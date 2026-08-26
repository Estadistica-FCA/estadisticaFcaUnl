#' @title Calcular z-scores para determinar Outliers
#' @description Calcula los valores estandarizados (z-scores) para una columna de un data.frame,
#' agregando una columna `z` con los resultados e informando por consola la cantidad de valores
#' que superan 2 y 3 desviaciones estándar.
#'
#' @param data Un data.frame o grouped_df que contiene la columna a analizar.
#' @param col Nombre de la columna (carácter o nombre sin comillas) de la cual se desea obtener el z-score.
#'
#' @return El mismo data.frame (o grouped_df) recibido con una columna extra `z` que contiene los z-scores calculados.
#'
#' @examples
#' library(estadisticaFcaUnl)
#' data(fertilizante_pastizal)
#'
#' # Usando nombre de columna como cadena
#' z_score(fertilizante_pastizal, "P")
#'
#' # Usando nombre de columna sin comillas
#' z_score(fertilizante_pastizal, P)
#'
#' @importFrom stats sd
#' @importFrom cli cli_abort cli_h1 cli_bullets
#' @importFrom dplyr mutate %>%
#' @export
z_score <- function(data, col) {
  if (!is.data.frame(data)) {
    cli::cli_abort("El argumento {.arg data} debe ser un data.frame.")
  }

  # Determinar el nombre de la columna soportando escribirla sin comillas dobles
  col_sub <- substitute(col)
  col_name <- tryCatch({
    if (is.character(col)) {
      col
    } else if (is.symbol(col_sub)) {
      as.character(col_sub)
    } else {
      as.character(col)
    }
  }, error = function(e) {
    as.character(col_sub)
  })

  if (!col_name %in% names(data)) {
    val_eval <- tryCatch(eval(substitute(col), parent.frame()), error = function(e) NULL)
    if (is.character(val_eval) && length(val_eval) == 1 && val_eval %in% names(data)) {
      col_name <- val_eval
    } else {
      cli::cli_abort(c(
        "La columna {.val {col_name}} no existe en el data.frame.",
        "i" = "Columnas disponibles: {.val {names(data)}}"
      ))
    }
  }

  x <- data[[col_name]]
  if (!is.numeric(x)) {
    cli::cli_abort("La columna {.val {col_name}} debe ser num\u00e9rica.")
  }

  # Calcular z-score agregando la columna 'z' (respetando grupos si es grouped_df)
  res <- dplyr::mutate(data,
    z = (.data[[col_name]] - mean(.data[[col_name]], na.rm = TRUE)) / 
      stats::sd(.data[[col_name]], na.rm = TRUE))

  # Conteo de valores atípicos
  z_vals <- res$z[!is.na(res$z)]
  n_2sd <- sum(abs(z_vals) > 2)
  n_3sd <- sum(abs(z_vals) > 3)

  # Salida por consola
  cli::cli_h1("Outliers de {.val {col_name}}")
  cli::cli_bullets(c(
    "*" = "Leves (\u00b12\u03c3): {.val {n_2sd}}",
    "*" = "Severos (\u00b13\u03c3): {.val {n_3sd}}"
  ))

  return(invisible(res))
}
