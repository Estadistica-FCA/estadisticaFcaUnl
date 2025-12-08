#' @title Funcion interna para calcular p-valor y intervalo de confianza
#' @description Funcion auxiliar para calcular p-valor y intervalo de confianza para pruebas de distribucion normal Z.
#' @param z_calc Numerico. Estadistico Z calculado.
#' @param x Numerico. Centro del intervalo de confianza (media o diferencia).
#' @param se Numerico. Error estandar.
#' @inheritParams z.test
#' @return Un listado con `p_val` (valor p) y `conf_int` (intervalo de confianza).
#' @importFrom stats pnorm qnorm
#' @keywords internal
z_values <- function(z_calc, x, se, alternative = c("two.sided", "less", "greater"), conf.level = 0.95) {
    if (alternative == "less") {
        p_val <- pnorm(z_calc, lower.tail = TRUE)
        z_crit <- qnorm(conf.level)
        ci_lower <- -Inf
        ci_upper <- x + z_crit * se
    } else if (alternative == "greater") {
        p_val <- pnorm(z_calc, lower.tail = FALSE)
        z_crit <- qnorm(conf.level)
        ci_lower <- x - z_crit * se
        ci_upper <- Inf
    } else { # two.sided
        p_val <- pnorm(z_calc, lower.tail = z_calc < 0) * 2
        z_crit <- qnorm(conf.level + ((1 - conf.level) / 2))
        ci_lower <- x - z_crit * se
        ci_upper <- x + z_crit * se
    }
    conf_int <- c(ci_lower, ci_upper)
    attr(conf_int, "conf.level") <- conf.level

    return(list(p_val = p_val, conf_int = conf_int))
}

#' @title Test de distribucion Normal Z
#' @description
#' Realiza pruebas de hipotesis de una o dos muestras con distribucion normal.
#' @param x Vector numerico. Muestra para una muestra o primer muestra para dos muestras.
#' @param y Vector numerico. Segunda muestra para dos muestras. Optional.
#' @param sig_x Numerico. Desviacion estandar poblacional para x.
#' @param sig_y Numerico. Desviacion estandar poblacional para y. Requerido para dos muestras.
#' @param alternative String de caracteres que especifica la hipotesis alternativa.
#'   Debe ser "two.sided" (default), "greater" o "less".
#' @param mu Numerico. Hipotesis nula para la media o diferencia de medias. Por defecto es 0.
#' @param conf.level Numerico. Nivel de confianza del intervalo. Por defecto es 0.95.
#' @param p1 Numerico. Proporcion de exito en la poblacion 1 (para prueba de proporciones).
#' @param p2 Numerico. Proporcion de exito en la poblacion 2 (para prueba de proporciones).
#' @param n1 Numerico. Tamaño de la muestra para la poblacion 1 (para prueba de proporciones).
#' @param n2 Numerico. Tamaño de la muestra para la poblacion 2 (para prueba de proporciones).
#' @return Un objeto de la clase "htest" que contiene los siguientes componentes:
#' * `statistic`: El valor del estadistico Z.
#' * `p.value`: El p-valor para la prueba.
#' * `conf.int`: Un intervalo de confianza para la media o diferencia en medias apropiado a la hipotesis alternativa especificada.
#' * `estimate`: La estimacion de la media o diferencia en medias/proportiones.
#' * `null.value`: El valor hipotetico de la media o diferencia en medias.
#' * `alternative`: Un string descriptivo de la hipotesis alternativa.
#' * `method`: Un string indicando el tipo de prueba realizada.
#' * `data.name`: Un string que da el nombre(s) de los datos.
#' @export
z.test <- function(x = NULL, y = NULL, sig_x, sig_y = NULL,
                   alternative = c("two.sided", "less", "greater"), mu = 0, conf.level = 0.95,
                   p1 = NULL, p2 = NULL, n1 = NULL, n2 = NULL) {
    # Validaciones
    alternative <- match.arg(alternative)
    if (conf.level <= 0 || conf.level >= 1) stop("conf.level debe estar entre 0 y 1")
    # Una muestra
    if (is.null(y) && !is.null(x)) {
        # Parametros muestrales
        n_x <- length(x)
        xbar_x <- mean(x)
        se <- sig_x / sqrt(n_x)
        z_calc <- (xbar_x - mu) / se

        # Calculo de proporciones e intervalos de confianza
        z <- z_values(z_calc, xbar_x, se, alternative, conf.level)

        # Estructura de la salida
        res <- list(
            statistic = c(z = z_calc),
            p.value = z$p_val,
            conf.int = z$conf_int,
            estimate = c(`mean of x` = xbar_x), # Etiqueta de la estimación
            null.value = c(mean = mu), # La etiqueta también es 'mean'
            alternative = alternative,
            method = "One-sample Z-test",
            data.name = deparse(substitute(x))
        )
        # Dos muestras
    } else if (!is.null(y) && !is.null(x)) {
        # Valida que el valor ingresado sea correcto
        if (is.null(sig_y)) {
            stop("Se requiere sig_y para la prueba de dos muestras")
        }
        # Parametros muestrales
        n_x <- length(x)
        n_y <- length(y)
        xbar_x <- mean(x)
        xbar_y <- mean(y)

        se <- sqrt(sig_x^2 / n_x + sig_y^2 / n_y)
        z_calc <- (xbar_x - xbar_y - mu) / se

        # Calculo de proporciones e intervalos de confianza
        z <- z_values(z_calc, xbar_x - xbar_y, se, alternative, conf.level)

        # Estructura de la salida
        data_name <- paste(deparse(substitute(x)), "and", deparse(substitute(y)))

        res <- list(
            statistic = c(z = z_calc),
            p.value = z$p_val,
            conf.int = z$conf_int,
            estimate = c(`difference in means` = xbar_x - xbar_y), # Etiqueta para la diferencia de medias
            null.value = c(`difference in means` = mu), # Etiqueta para la diferencia de medias nula
            alternative = alternative,
            method = "Two-sample Z-test",
            data.name = data_name
        )
    } else if (!is.null(p1) && !is.null(p2) && !is.null(n1) && !is.null(n2)) {
        # Parametros muestrales
        p <- (n1 * p1 + n2 * p2) / (n1 + n2)
        se <- sqrt(p * (1 - p) * (1 / n1 + 1 / n2))
        z_calc <- (p1 - p2) / sqrt(p * (1 - p) / n1 + p * (1 - p) / n2)

        # Calculo de proporciones e intervalos de confianza
        z <- z_values(z_calc, p1 - p2, se, alternative, conf.level)

        # Estructura de la salida
        data_name <- paste(deparse(substitute(p1)), "and", deparse(substitute(p2)))

        res <- list(
            statistic = c(z = z_calc),
            p.value = z$p_val,
            conf.int = z$conf_int,
            estimate = c(`difference in proportions` = p1 - p2), # Etiqueta para la diferencia de proporciones
            null.value = c(`difference in proportions` = 0), # Etiqueta para la diferencia de proporciones nula
            alternative = alternative,
            method = "Two-proportion Z-test",
            data.name = data_name
        )
    } else {
        stop("Falta cargar parametros de la prueba")
    }

    class(res) <- "htest"
    return(res)
}
