#' Ajustar variables de un dataframe a nuevas medidas de tendencia, dispersión, forma y outliers
#'
#' @description
#' Modifica una columna numérica de un data.frame para ajustar:
#' 1. Forma (Asimetría y Curtosis) usando el método de Fleishman.
#' 2. Cantidad aproximada de outliers (inyectando o recortando).
#' 3. Tendencia (Media) y Dispersión (Desvío Estándar) mediante transformación lineal.
#'
#' Soporta dataframes agrupados (`grouped_df` de `dplyr`).
#'
#' @param data Un data.frame (o grouped_df) que contiene la columna a modificar.
#' @param col Nombre de la columna a modificar (string).
#' @param media_obj Media objetivo. Numérico (escalar o vector/lista por grupos) o nombre de columna.
#' @param desvio_obj Desviación estándar objetivo. Numérico (escalar o vector/lista por grupos) o nombre de columna.
#' @param asim_obj Asimetría objetivo. Numérico (escalar o vector/lista por grupos) o nombre de columna.
#' @param curt_obj Curtosis objetivo (3 = Normal). Numérico (escalar o vector/lista por grupos) o nombre de columna.
#' @param n_outliers Número aproximado de outliers. Numérico (escalar o vector/lista por grupos) o nombre de columna.
#' @param mantener_originales Lógico. Si es TRUE, los parámetros no especificados (NULL) se rellenan con los valores originales de la muestra. Si es FALSE (default), se dejan como NULL y la función solo ajusta lo solicitado.
#' @return Un data.frame con la columna especificada modificada.
#'
#' @examples
#' \dontrun{
#' library(dplyr)
#' data("energia_abejas")
#'
#' # Ejemplo: Modificar por grupos usando listas para parámetros especificos
#' # Grupo 1: Sin cambios (NULL) - Manteniendo originales
#' # Grupo 2: Asimetria -0.1
#' # Grupo 3: Asimetria 0.1
#' energia_mod <- energia_abejas %>%
#'     group_by(Temp_ord) %>%
#'     ajustar_variables(
#'         col = "Energia",
#'         asim_obj = list(NULL, -0.1, 0.1),
#'         mantener_originales = TRUE
#'     ) %>%
#'     ungroup()
#' }
#'
#' @importFrom stats sd optim rnorm quantile IQR qnorm runif
#' @importFrom grDevices boxplot.stats
#' @importFrom moments skewness kurtosis
#' @importFrom cli cli_alert_warning cli_abort
#' @export
ajustar_variables <- function(data, col, media_obj = NULL, desvio_obj = NULL,
                              asim_obj = NULL, curt_obj = NULL, n_outliers = NULL,
                              mantener_originales = FALSE) {
    # --- 1. Validaciones ---
    if (!is.data.frame(data)) {
        cli::cli_abort("El argumento 'data' debe ser un data.frame")
    }
    if (!col %in% names(data)) {
        cli::cli_abort(c("La columna {.val {col}} no existe en el data.frame.",
            "i" = "Columnas disponibles: {.val {names(data)}}"
        ))
    }
    if (!is.numeric(data[[col]])) {
        cli::cli_abort("La columna {.val {col}} debe ser numérica.")
    }

    # --- 2. Lógica Principal ---
    if (inherits(data, "grouped_df")) {
        # === CASO AGRUPADO ===
        groups <- attr(data, "groups")
        if (is.null(groups)) {
            cli::cli_alert_warning("El dataframe est\u00e1 marcado como agrupado ({.cls grouped_df}) pero no contiene metadatos de grupos. Se retorna el objeto sin cambios.")
            return(data)
        }

        n_groups <- nrow(groups) # Número de grupos
        group_indices <- groups$.rows # Indices de fila de cada grupo
        x_global <- data[[col]] # Vector global con todos los datos

        media_obj <- .validar_param_agrupado(media_obj, "media_obj", n_groups)
        desvio_obj <- .validar_param_agrupado(desvio_obj, "desvio_obj", n_groups)
        asim_obj <- .validar_param_agrupado(asim_obj, "asim_obj", n_groups)
        curt_obj <- .validar_param_agrupado(curt_obj, "curt_obj", n_groups)
        n_outliers <- .validar_param_agrupado(n_outliers, "n_outliers", n_groups)

        for (i in seq_len(n_groups)) {
            idx <- group_indices[[i]] # Indices de fila de este grupo
            subset_x <- x_global[idx] # Subconjunto de datos para este grupo

            if (length(subset_x) <= 1) {
                cli::cli_abort("El grupo {i} tiene tama\u00f1o {length(subset_x)}. Se requiere N > 1 para ajustar variables.")
            }

            # Aplicar transformación al subset
            # Usamos [[i]] para extraer (funciona para listas y vectores)
            subset_mod <- .ajustar_vector_nucleo(
                subset_x,
                media_obj[[i]],
                desvio_obj[[i]],
                asim_obj[[i]],
                curt_obj[[i]],
                n_outliers[[i]],
                mantener_originales
            )

            # Asignar de vuelta
            x_global[idx] <- subset_mod
        }

        data[[col]] <- x_global
    } else {
        # === CASO NO AGRUPADO ===
        x <- data[[col]]

        if (length(x) <= 1) {
            cli::cli_abort("La variable tiene tama\u00f1o {length(x)}. Se requiere N > 1 para ajustar variables.")
        }

        x_mod <- .ajustar_vector_nucleo(x, media_obj, desvio_obj, asim_obj, curt_obj, n_outliers, mantener_originales)
        data[[col]] <- x_mod
    }

    return(data)
}

# Helper para validar y rellenar parámetros
# Si es NULL, se genera una lista de NULLs.
# Si no es NULL, debe ser vector o lista de longitud n_groups.
.validar_param_agrupado <- function(param, nombre, n) {
    if (is.null(param)) {
        return(vector("list", n)) # Lista de NULLs
    }
    if ((!is.vector(param) && !is.list(param)) || length(param) != n) {
        cli::cli_abort("El argumento {.arg {nombre}} debe ser un vector o lista de la misma longitud que el número de grupos ({n}).")
    }
    return(param)
}

# --- Núcleo Matemático ---

.ajustar_vector_nucleo <- function(x, media_obj, desvio_obj, asim_obj, curt_obj, n_outliers, mantener_originales) {
    # Validar parámetros entrada (Nucleo espera escalares o NULL)
    .validar_parametro_nucleo(media_obj, "media_obj")
    .validar_parametro_nucleo(desvio_obj, "desvio_obj")
    .validar_parametro_nucleo(asim_obj, "asim_obj")
    .validar_parametro_nucleo(curt_obj, "curt_obj")
    .validar_parametro_nucleo(n_outliers, "n_outliers")

    # Capturar estadísticas originales por si se piden mantener
    media_orig <- mean(x, na.rm = TRUE)
    desvio_orig <- stats::sd(x, na.rm = TRUE)

    # 1. Cambiar forma (asimetría y curtosis)
    if (!is.null(asim_obj) || !is.null(curt_obj)) {
        cur_skew <- moments::skewness(x, na.rm = TRUE)
        cur_kurt <- moments::kurtosis(x, na.rm = TRUE)

        # Si alguno es NULL, decidimos con qué rellenarlo
        target_s <- if (is.null(asim_obj)) cur_skew else asim_obj
        target_k <- if (is.null(curt_obj)) cur_kurt else curt_obj

        x <- .modificar_forma(x, target_s, target_k)
    }

    # 2. Outliers
    if (!is.null(n_outliers)) {
        x <- .modificar_outliers(x, n_outliers)
    }

    # 3. Escalar Media y Desvío
    if (is.null(media_obj) && is.null(desvio_obj) && !mantener_originales) {
        return(x)
    }
    media_act <- mean(x, na.rm = TRUE)
    desvio_act <- stats::sd(x, na.rm = TRUE)
    z <- (x - media_act) / desvio_act

    if (is.null(media_obj)) {
        if (mantener_originales) {
            media_obj <- media_orig
        } else {
            media_obj <- media_act
        }
    }

    if (is.null(desvio_obj)) {
        if (mantener_originales) {
            desvio_obj <- desvio_orig
        } else {
            desvio_obj <- desvio_act
        }
    }
    x_new <- z * desvio_obj + media_obj
    return(x_new)
}

.validar_parametro_nucleo <- function(val, nombre) {
    if (is.null(val)) {
        return(invisible(NULL))
    }

    if (!is.numeric(val)) {
        cli::cli_abort("El parámetro interno {.arg {nombre}} debe ser numérico.")
    }
    if (length(val) != 1) {
        cli::cli_abort("El parámetro interno {.arg {nombre}} debe ser un escalar (longitud 1).")
    }
}


.modificar_forma <- function(x, asim, curt) {
    coefs <- .hallar_coeficientes_fleishman(asim, curt)
    a <- coefs[1]
    b <- coefs[2]
    c <- coefs[3]
    d <- coefs[4]
    n <- length(x)
    p <- (rank(x) - 0.5) / n
    z <- stats::qnorm(p)
    y <- a + b * z + c * z^2 + d * z^3
    return(y)
}

.hallar_coeficientes_fleishman <- function(asim, curt) {
    original_seed <- .Random.seed
    set.seed(12345)
    z_sim <- sort(stats::rnorm(50000))
    if (!is.null(original_seed)) .Random.seed <<- original_seed

    fn_obj <- function(par) {
        b <- par[1]
        c <- par[2]
        d <- par[3]
        a <- -c
        var_calc <- b^2 + 6 * b * d + 2 * c^2 + 15 * d^2
        y <- a + b * z_sim + c * z_sim^2 + d * z_sim^3
        s_sim <- moments::skewness(y)
        k_sim <- moments::kurtosis(y)
        cost <- (s_sim - asim)^2 + (k_sim - curt)^2 + 20 * (var_calc - 1)^2
        return(cost)
    }
    res <- stats::optim(c(1, 0, 0), fn_obj, method = "Nelder-Mead", control = list(maxit = 500))
    return(c(-res$par[2], res$par))
}

.modificar_outliers <- function(x, n_target) {
    stats <- grDevices::boxplot.stats(x)
    outs <- stats$out
    diff <- n_target - length(outs)

    # Lógica de inyección/winsorizing
    if (diff != 0) {
        q1 <- stats::quantile(x, 0.25)
        q3 <- stats::quantile(x, 0.75)
        iqr <- q3 - q1
        barrera_inf <- q1 - 1.5 * iqr
        barrera_sup <- q3 + 1.5 * iqr

        if (diff > 0) {
            indices_inliers <- which(x >= barrera_inf & x <= barrera_sup)
            if (length(indices_inliers) > 0) {
                min_dist <- pmin(abs(x[indices_inliers] - barrera_inf), abs(x[indices_inliers] - barrera_sup))
                n_inject <- min(diff, length(indices_inliers))
                candidatos_idx <- indices_inliers[order(min_dist)[1:n_inject]]

                eps <- stats::sd(x) * 0.1
                for (idx in candidatos_idx) {
                    if (abs(x[idx] - barrera_sup) < abs(x[idx] - barrera_inf)) {
                        x[idx] <- barrera_sup + eps * stats::runif(1, 1, 4.0)
                    } else {
                        x[idx] <- barrera_inf - eps * stats::runif(1, 1, 4.0)
                    }
                }
            }
        } else {
            indices_outs <- which(x < barrera_inf | x > barrera_sup)
            dist_out <- pmax(x[indices_outs] - barrera_sup, barrera_inf - x[indices_outs])
            num_a_mover <- min(abs(diff), length(indices_outs))
            if (num_a_mover > 0) {
                a_eliminar_idx <- indices_outs[order(dist_out, decreasing = TRUE)[1:num_a_mover]]
                eps <- stats::sd(x) * 0.01
                for (idx in a_eliminar_idx) {
                    if (x[idx] > barrera_sup) {
                        x[idx] <- barrera_sup - eps
                    } else {
                        x[idx] <- barrera_inf + eps
                    }
                }
            }
        }
    }

    # --- Verificación Final y Warning ---
    stats_final <- grDevices::boxplot.stats(x)
    n_final <- length(stats_final$out)

    if (n_final != n_target) {
        cli::cli_alert_warning("No se pudo alcanzar el objetivo de {n_target} outliers (se obtuvieron {n_final}). Esto suele ocurrir en muestras peque\u00f1as donde los outliers inflan el IQR.")
    }

    return(x)
}
