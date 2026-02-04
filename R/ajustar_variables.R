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
#' @param media_obj Media objetivo. Numérico (escalar o vector por grupos) o nombre de columna.
#' @param desvio_obj Desviación estándar objetivo. Numérico (escalar o vector por grupos) o nombre de columna.
#' @param asim_obj Asimetría objetivo. Numérico (escalar o vector por grupos) o nombre de columna.
#' @param curt_obj Curtosis objetivo (3 = Normal). Numérico (escalar o vector por grupos) o nombre de columna.
#' @param n_outliers Número aproximado de outliers. Numérico (escalar o vector por grupos) o nombre de columna.
#' @return Un data.frame con la columna especificada modificada.
#'
#' @importFrom stats sd optim rnorm quantile IQR qnorm runif
#' @importFrom grDevices boxplot.stats
#' @importFrom moments skewness kurtosis
#' @importFrom cli cli_alert_warning cli_abort
#' @export
ajustar_variables <- function(data, col, media_obj = NULL, desvio_obj = NULL,
                              asim_obj = NULL, curt_obj = NULL, n_outliers = NULL) {
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
            return(data)
        }

        n_groups <- nrow(groups)
        group_indices <- groups$.rows
        x_global <- data[[col]]

        for (i in seq_len(n_groups)) {
            idx <- group_indices[[i]] # Indices de fila de este grupo
            subset_x <- x_global[idx]

            # Obtener valores objetivo especificos para este grupo
            m_val <- .obtener_valor_grupo(media_obj, data, idx, i, n_groups, "media_obj")
            d_val <- .obtener_valor_grupo(desvio_obj, data, idx, i, n_groups, "desvio_obj")
            a_val <- .obtener_valor_grupo(asim_obj, data, idx, i, n_groups, "asim_obj")
            c_val <- .obtener_valor_grupo(curt_obj, data, idx, i, n_groups, "curt_obj")
            o_val <- .obtener_valor_grupo(n_outliers, data, idx, i, n_groups, "n_outliers")

            # Aplicar transformación al subset
            subset_mod <- .ajustar_vector_nucleo(subset_x, m_val, d_val, a_val, c_val, o_val)

            # Asignar de vuelta
            x_global[idx] <- subset_mod
        }

        data[[col]] <- x_global
    } else {
        # === CASO NO AGRUPADO ===
        x <- data[[col]]

        m_val <- .obtener_valor_simple(media_obj, data, "media_obj")
        d_val <- .obtener_valor_simple(desvio_obj, data, "desvio_obj")
        a_val <- .obtener_valor_simple(asim_obj, data, "asim_obj")
        c_val <- .obtener_valor_simple(curt_obj, data, "curt_obj")
        o_val <- .obtener_valor_simple(n_outliers, data, "n_outliers")

        x_mod <- .ajustar_vector_nucleo(x, m_val, d_val, a_val, c_val, o_val)
        data[[col]] <- x_mod
    }

    return(data)
}

# --- Helpers de Resolución de Parámetros ---

.obtener_valor_simple <- function(val, data, arg_name) {
    if (is.null(val)) {
        return(NULL)
    }
    if (is.character(val) && length(val) == 1 && val %in% names(data)) {
        vals <- unique(data[[val]])
        if (length(vals) > 1) {
            cli::cli_alert_warning("Argumento {.arg {arg_name}} varía en los datos no agrupados. Se usará el primer valor.")
        }
        return(vals[1])
    }
    return(val)
}

.obtener_valor_grupo <- function(val, data, idx_rows, group_i, n_groups, arg_name) {
    if (is.null(val)) {
        return(NULL)
    }
    if (is.character(val) && length(val) == 1 && val %in% names(data)) {
        sub_vals <- unique(data[[val]][idx_rows])
        if (length(sub_vals) > 1) {
            cli::cli_alert_warning("Grupo {group_i} tiene múltiples valores en {.val {val}}. Se usa el primero.")
        }
        return(sub_vals[1])
    }
    if (is.numeric(val) && length(val) == n_groups) {
        return(val[group_i])
    }
    if (length(val) == 1) {
        return(val)
    }
    cli::cli_abort("Argumento {.arg {arg_name}} tiene longitud incorrecta ({length(val)}) para {n_groups} grupos.")
}

# --- Núcleo Matemático ---

.ajustar_vector_nucleo <- function(x, media_obj, desvio_obj, asim_obj, curt_obj, n_outliers) {
    if (is.null(media_obj)) media_obj <- mean(x, na.rm = TRUE)
    if (is.null(desvio_obj)) desvio_obj <- stats::sd(x, na.rm = TRUE)

    if (!is.null(asim_obj) || !is.null(curt_obj)) {
        cur_skew <- moments::skewness(x, na.rm = TRUE)
        cur_kurt <- moments::kurtosis(x, na.rm = TRUE)
        target_s <- if (is.null(asim_obj)) cur_skew else asim_obj
        target_k <- if (is.null(curt_obj)) cur_kurt else curt_obj
        x <- .modificar_forma(x, target_s, target_k)
    }

    if (!is.null(n_outliers)) {
        x <- .modificar_outliers(x, n_outliers)
    }

    media_act <- mean(x, na.rm = TRUE)
    desvio_act <- stats::sd(x, na.rm = TRUE)
    if (is.na(desvio_act)) desvio_act <- 0

    # Si target desvio es NULL, asumimos mantener el actual
    if (is.null(desvio_obj)) desvio_obj <- desvio_act

    if (desvio_act == 0) {
        # Si no hay variabilidad (o N=1), no podemos escalar varianza.
        # Simplemente fijamos la nueva media.
        x_new <- rep(media_obj, length(x))
    } else {
        z <- (x - media_act) / desvio_act
        x_new <- z * desvio_obj + media_obj
    }
    return(x_new)
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
