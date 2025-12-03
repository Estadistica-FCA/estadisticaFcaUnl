#' @title Internal function to calculate p-value and confidence interval
#' @description Helper function to calculate p-values and confidence intervals for z-tests.
#' @param z_calc Numeric. Calculated Z statistic.
#' @param x Numeric. Center of the confidence interval (mean or difference).
#' @param se Numeric. Standard error.
#' @inheritParams z.test
#' @return A list containing `p_val` (p-value) and `conf_int` (confidence interval).
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

#' @title Normal Z test
#' @description
#' Performs one and two sample z-tests on vectors of data.
#' @param x Numeric vector. Sample data for one-sample test or first sample for two-sample test.
#' @param y Numeric vector. Second sample data for two-sample test. Optional.
#' @param sig_x Numeric. Population standard deviation for x.
#' @param sig_y Numeric. Population standard deviation for y. Required for two-sample test.
#' @param alternative Character string specifying the alternative hypothesis.
#'   Must be one of "two.sided" (default), "greater" or "less".
#' @param mu Numeric. Hypothesized true mean or difference in means. Default is 0.
#' @param conf.level Numeric. Confidence level of the interval. Default is 0.95.
#' @param p1 Numeric. Proportion of success in population 1 (for two-proportion test).
#' @param p2 Numeric. Proportion of success in population 2 (for two-proportion test).
#' @param n1 Numeric. Sample size for population 1 (for two-proportion test).
#' @param n2 Numeric. Sample size for population 2 (for two-proportion test).
#' @return A list with class "htest" containing the following components:
#'   \item{statistic}{The value of the z-statistic.}
#'   \item{p.value}{The p-value for the test.}
#'   \item{conf.int}{A confidence interval for the mean or difference in means appropriate to the specified alternative hypothesis.}
#'   \item{estimate}{The estimated mean or difference in means/proportions.}
#'   \item{null.value}{The specified hypothesized value of the mean or mean difference.}
#'   \item{alternative}{A character string describing the alternative hypothesis.}
#'   \item{method}{A character string indicating what type of test was performed.}
#'   \item{data.name}{A character string giving the name(s) of the data.}
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
