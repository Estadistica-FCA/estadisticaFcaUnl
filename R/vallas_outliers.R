#' @title Calcular y Graficar Vallas para Outliers
#' @description Función que calcula las vallas internas y externas para la detección de valores atípicos (outliers).
#' Permite ingresar los cuartiles Q1 y Q3 directamente o un vector de datos para calcularlos.
#' Además, genera un gráfico ilustrativo de las vallas y, si se proporcionan datos, un boxplot.
#' @param Q1 Valor del primer cuartil (25%). Opcional si se proporciona `data`.
#' @param Q3 Valor del tercer cuartil (75%). Opcional si se proporciona `data`.
#' @param data Vector numérico de datos. Si se proporciona, se calculan Q1 y Q3 a partir de él.
#' @param plot Valor lógico. Si es `TRUE` (por defecto), genera un gráfico de las vallas.
#' @return Retorna invisiblemente un vector con los valores de las vallas:
#' \itemize{
#'   \item \code{VIE}: Valla Inferior Externa (Q1 - 3 * IQR)
#'   \item \code{VII}: Valla Inferior Interna (Q1 - 1.5 * IQR)
#'   \item \code{VSI}: Valla Superior Interna (Q3 + 1.5 * IQR)
#'   \item \code{VSE}: Valla Superior Externa (Q3 + 3 * IQR)
#' }
#' @examples
#' # Usando cuartiles directamente
#' vallas_outliers(Q1 = 10, Q3 = 20)
#'
#' # Usando un vector de datos
#' set.seed(123)
#' datos <- rnorm(100)
#' vallas_outliers(data = datos)
#' @importFrom stats quantile
#' @importFrom ggplot2 ggplot theme_minimal labs theme element_blank element_text coord_cartesian geom_vline aes scale_color_manual geom_label geom_boxplot annotate
#' @export
vallas_outliers <- function(Q1 = NULL, Q3 = NULL, data = NULL, plot = TRUE) {
    if (is.null(Q1) || is.null(Q3)) {
        if (is.null(data)) {
            stop("Se requieren Q1 y Q3 o data")
        } else {
            Q1 <- quantile(data, 0.25) |> unname()
            Q3 <- quantile(data, 0.75) |> unname()
        }
    }

    IQR <- Q3 - Q1
    estadisticos <- c(
        Q1 = Q1,
        Q3 = Q3,
        IQR = IQR
    )
    vallas <- c(
        VIE = Q1 - 3 * IQR,
        VII = Q1 - 1.5 * IQR,
        VSI = Q3 + 1.5 * IQR,
        VSE = Q3 + 3 * IQR
    )

    # Salida por consola
    cat("Resumen de Estadísticos:\n")
    print(round(estadisticos, 2))
    cat("|-----------------------|\n")
    cat("Vallas:\n")
    print(round(vallas, 2))
    cat("\n")

    # Grafico de vallas
    if (plot) {
        # Crear data frame para las vallas
        df_vallas <- data.frame(
            valla = names(vallas),
            valor = as.numeric(vallas),
            tipo = c("Externa", "Interna", "Interna", "Externa") # Nomenclatura necesaria para los labels
        )

        # Esqueleto del grafico
        p <- ggplot2::ggplot() +
            ggplot2::theme_minimal() +
            ggplot2::labs(title = "Vallas y Outliers", x = "", y = "") +
            ggplot2::theme(
                axis.text.y = ggplot2::element_blank(),
                axis.ticks.y = ggplot2::element_blank(),
                plot.title = ggplot2::element_text(hjust = 0.5),
                legend.title = ggplot2::element_blank()
            ) +
            ggplot2::coord_cartesian(ylim = c(0, 2))

        # Dibujar vallas
        p <- p + ggplot2::geom_vline(
            data = df_vallas, ggplot2::aes(xintercept = valor, color = tipo),
            linetype = "dashed", linewidth = 1
        ) +
            ggplot2::scale_color_manual(values = c("Externa" = "red", "Interna" = "orange")) +
            ggplot2::geom_label(
                data = df_vallas, ggplot2::aes(x = valor, y = 0.2, label = valla, color = tipo),
                fill = "white", vjust = 0.5, size = 3, show.legend = FALSE
            )

        # Dibujar datos si existen, sino dibujar Q1 y Q3
        if (!is.null(data)) {
            df_puntos <- data.frame(x = data, y = 1)
            p <- p + ggplot2::geom_boxplot(
                data = df_puntos, ggplot2::aes(x = x, y = y, group = 1),
                width = 0.8, alpha = 0.6, fill = "lightblue"
            )
        } else {
            p <- p + ggplot2::geom_vline(xintercept = c(Q1, Q3), linetype = "dotted", color = "blue", linewidth = 1) +
                ggplot2::annotate("label", x = Q1, y = 1, label = "Q1", color = "blue", vjust = 0, fill = "white") +
                ggplot2::annotate("label", x = Q3, y = 1, label = "Q3", color = "blue", vjust = 0, fill = "white")
        }

        print(p)
    }
    return(invisible(vallas)) # Se pone como invisible ya que se muestra por consola más arriba
}
