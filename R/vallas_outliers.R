#' @title Calcular Vallas para determinar Outliers
#' @description Función que calcula las vallas internas y externas para la detección de valores atípicos (outliers).
#' Permite ingresar los cuartiles Q1 y Q3 directamente o un vector de datos para calcularlos.
#' Si se proporciona un vector de datos, también contabiliza e informa la cantidad de outliers leves y severos.
#' @param Q1 Numerico. Valor del primer cuartil (25%). Opcional si se proporciona `data`.
#' @param Q3 Numerico. Valor del tercer cuartil (75%). Opcional si se proporciona `data`.
#' @param data Vector numérico de datos. Si se proporciona, se calculan Q1 y Q3 a partir de él (si no fueron especificados) y se cuentan los outliers.
#' @return Retorna invisiblemente un data frame con los valores de las vallas:
#' * `VEI`: Valla Externa Inferior (Q1 - 3 * IQR)
#' * `VII`: Valla Interna Inferior (Q1 - 1.5 * IQR)
#' * `VIS`: Valla Interna Superior (Q3 + 1.5 * IQR)
#' * `VES`: Valla Externa Superior (Q3 + 3 * IQR)
#' @examples
#' # Usando cuartiles directamente
#' res <- vallas_outliers(Q1 = 10, Q3 = 20)
#' res$VII
#'
#' # Usando un vector de datos
#' set.seed(123)
#' datos <- rnorm(100)
#' vallas_outliers(data = datos)
#' @importFrom stats quantile
#' @importFrom cli cli_abort cli_h1 cli_verbatim style_bold cli_bullets
#' @export
vallas_outliers <- function(data = NULL, Q1 = NULL, Q3 = NULL) {
  if (is.null(data)){
    if (is.null(Q1) || is.null(Q3)){
      cli::cli_abort("Se requiere un vector de datos ({.arg data}) o los valores de {.arg Q1} y {.arg Q3}.")
    }
    else {
      Q1 <- unname(Q1)
      Q3 <- unname(Q3)
    }
  }
  else {
    Q1 <- stats::quantile(data, 0.25, names = FALSE, na.rm = TRUE)
    Q3 <- stats::quantile(data, 0.75, names = FALSE, na.rm = TRUE)
  }

  IQR <- Q3 - Q1
  vallas <- c(
    VEI = Q1 - 3 * IQR,
    VII = Q1 - 1.5 * IQR,
    VIS = Q3 + 1.5 * IQR,
    VES = Q3 + 3 * IQR
  )

  # Salida por consola
  cli::cli_h1("Resumen de Estad\u00EDsticos")
  cli::cli_verbatim(cli::style_bold(sprintf("%-10s %-10s %-10s", "Q1", "Q3", "IQR")))
  cli::cli_verbatim(sprintf("%-10.2f %-10.2f %-10.2f", Q1, Q3, IQR))

  cli::cli_h1("Vallas")
  nombres_v <- paste(sprintf("%-10s", names(vallas)), collapse = " ")
  valores_v <- paste(sprintf("%-10.2f", vallas), collapse = " ")

  cli::cli_verbatim(cli::style_bold(nombres_v))
  cli::cli_verbatim(valores_v)

  if (!is.null(data)) {
      x <- data[!is.na(data)]
      n_leves <- sum((x < vallas["VII"] & x >= vallas["VEI"]) | (x > vallas["VIS"] & x <= vallas["VES"]))
      n_severos <- sum(x < vallas["VEI"] | x > vallas["VES"])

      cli::cli_h1("Outliers")
      cli::cli_bullets(c(
          "*" = "Leves: {.val {n_leves}}",
          "*" = "Severos: {.val {n_severos}}"
      ))
  }

  return(invisible(as.data.frame(as.list(vallas))))
}
