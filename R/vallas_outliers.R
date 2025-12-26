#' @title Calcular Vallas para Outliers
#' @description Función que calcula las vallas internas y externas para la detección de valores atípicos (outliers).
#' Permite ingresar los cuartiles Q1 y Q3 directamente o un vector de datos para calcularlos.
#' @param Q1 Numerico. Valor del primer cuartil (25%). Opcional si se proporciona `data`.
#' @param Q3 Numerico. Valor del tercer cuartil (75%). Opcional si se proporciona `data`.
#' @param data Vector numérico de datos. Si se proporciona, se calculan Q1 y Q3 a partir de él.
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
#' @export
vallas_outliers <- function(data = NULL, Q1 = NULL, Q3 = NULL) {
    if (is.null(Q1) || is.null(Q3)) {
        if (is.null(data)) {
            stop("Se requieren que se cargue un vector de datos o los valores de Q1 y Q3 de la distribución")
        } else {
            Q1 <- quantile(data, 0.25, names = FALSE)
            Q3 <- quantile(data, 0.75, names = FALSE)
        }
    } else {
        # Asegurar que Q1 y Q3 no tengan nombres (por si se ingresaron manualmente con names=TRUE)
        Q1 <- unname(Q1)
        Q3 <- unname(Q3)
    }


    IQR <- Q3 - Q1
    estadisticos <- c(
        Q1 = Q1,
        Q3 = Q3,
        IQR = IQR
    )
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

    return(invisible(as.data.frame(as.list(vallas)))) # Se pone como invisible ya que se muestra por consola más arriba
}
