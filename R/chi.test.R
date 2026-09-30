#' @title Funcion interna para calcular p-valor e intervalo de confianza para Chi-cuadrado
#' @description Funcion auxiliar para calcular p-valor e intervalo de confianza para pruebas de una varianza bajo distribucion Chi-cuadrado.
#' @param chi_calc Numerico. Estadistico Chi-cuadrado calculado.
#' @param df Numerico. Grados de libertad (n - 1).
#' @param ss Numerico. Suma de cuadrados (df * s2).
#' @inheritParams chi.test
#' @return Un listado con `p_val` (valor p) y `conf_int` (intervalo de confianza).
#' @importFrom stats pchisq qchisq
#' @keywords internal
chi_values <- function(chi_calc, df, ss, alternative = c("two.sided", "less", "greater"), conf.level = 0.95) {
    alpha <- 1 - conf.level

    if (alternative == "less") {
        p_val <- stats::pchisq(chi_calc, df = df, lower.tail = TRUE)
        ci_lower <- 0
        ci_upper <- ss / stats::qchisq(alpha, df = df, lower.tail = TRUE)
    } else if (alternative == "greater") {
        p_val <- stats::pchisq(chi_calc, df = df, lower.tail = FALSE)
        ci_lower <- ss / stats::qchisq(1 - alpha, df = df, lower.tail = TRUE)
        ci_upper <- Inf
    } else { # two.sided
        p_val <- 2 * min(stats::pchisq(chi_calc, df = df, lower.tail = TRUE),
                         stats::pchisq(chi_calc, df = df, lower.tail = FALSE))
        p_val <- min(p_val, 1)

        ci_lower <- ss / stats::qchisq(1 - alpha / 2, df = df, lower.tail = TRUE)
        ci_upper <- ss / stats::qchisq(alpha / 2, df = df, lower.tail = TRUE)
    }

    conf_int <- c(ci_lower, ci_upper)
    attr(conf_int, "conf.level") <- conf.level

    return(list(p_val = p_val, conf_int = conf_int))
}

#' @title Test Chi-cuadrado para una varianza
#' @description
#' Realiza pruebas de hipotesis e intervalos de confianza para la varianza de una poblacion normal a partir de una muestra o de estadisticos muestrales.
#' @param x Vector numerico. Muestra observada.
#' @param sigma2 Numerico. Valor de la varianza poblacional bajo la hipotesis nula (H0).
#' @param alternative String de caracteres que especifica la hipotesis alternativa. Debe ser `"two.sided"` (default), `"greater"` o `"less"`.
#' @param conf.level Numerico. Nivel de confianza del intervalo. Por defecto es 0.95.
#' @param s2 Numerico. Varianza muestral (para entrada de datos resumidos).
#' @param n Numerico. Tamano de la muestra (para entrada de datos resumidos).
#' @return Un objeto de la clase `"htest"` que contiene:
#' * `statistic`: El valor del estadistico Chi-cuadrado (X-squared).
#' * `parameter`: Los grados de libertad (df).
#' * `p.value`: El p-valor de la prueba.
#' * `conf.int`: El intervalo de confianza para la varianza.
#' * `estimate`: La varianza muestral estimada.
#' * `null.value`: El valor hipotetico de la varianza.
#' * `alternative`: Un string que describe la hipotesis alternativa.
#' * `method`: Un string indicando el tipo de prueba realizada.
#' * `data.name`: Un string con el nombre de los datos o estadisticos ingresados.
#' @examples
#' # Usando un vector de datos
#' set.seed(123)
#' x <- rnorm(20, mean = 5, sd = 2)
#' chi.test(x, sigma2 = 4)
#'
#' # Usando estadisticos muestrales directamente
#' chi.test(s2 = 3.5, n = 25, sigma2 = 2.5)
#' @importFrom stats var
#' @export
chi.test <- function(x = NULL, sigma2 = NULL,
                     alternative = c("two.sided", "less", "greater"),
                     conf.level = 0.95, s2 = NULL, n = NULL) {
    alternative <- match.arg(alternative)

    if (is.null(sigma2)) {
        stop("Debe especificar el valor de la varianza poblacional bajo la hipotesis nula en 'sigma2'")
    }
    if (!is.numeric(sigma2) || length(sigma2) != 1 || sigma2 <= 0) {
        stop("sigma2 debe ser un numero positivo")
    }
    if (conf.level <= 0 || conf.level >= 1) {
        stop("conf.level debe estar entre 0 y 1")
    }

    # Caso 1: Se ingresa vector x
    if (!is.null(x)) {
        data_name <- deparse(substitute(x))
        x <- x[!is.na(x)]
        if (!is.numeric(x)) {
            stop("x debe ser un vector numerico")
        }
        n_sample <- length(x)
        if (n_sample < 2) {
            stop("x debe tener al menos 2 observaciones validas")
        }
        s2_calc <- stats::var(x)
    # Caso 2: Se ingresan estadisticos resumidos s2 y n
    } else if (!is.null(s2) && !is.null(n)) {
        if (!is.numeric(s2) || length(s2) != 1 || s2 < 0) {
            stop("s2 debe ser un numero positivo")
        }
        if (!is.numeric(n) || length(n) != 1 || n < 2 || n != round(n)) {
            stop("n debe ser un entero mayor o igual a 2")
        }
        n_sample <- n
        s2_calc <- s2
        data_name <- paste0("s2 = ", round(s2, 4), ", n = ", n)
    } else {
        stop("Debe especificar un vector 'x' o bien los estadisticos 's2' y 'n'")
    }

    df <- n_sample - 1
    ss <- df * s2_calc
    chi_calc <- ss / sigma2

    chi_res <- chi_values(chi_calc, df = df, ss = ss, alternative = alternative, conf.level = conf.level)

    res <- list(
        statistic = c(`X-squared` = chi_calc),
        parameter = c(df = df),
        p.value = chi_res$p_val,
        conf.int = chi_res$conf_int,
        estimate = c(variance = s2_calc),
        null.value = c(variance = sigma2),
        alternative = alternative,
        method = "One-sample Chi-squared test for variance",
        data.name = data_name
    )

    class(res) <- "htest"
    return(res)
}
