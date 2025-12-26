#' @title Capa de Vallas para Outliers
#' @description Agrega vallas internas y externas a un gráfico ggplot2.
#' Permite personalizar directamente los colores para las vallas internas y externas.
#' @param mapping Conjunto de mapeos estéticos creados por \code{\link[ggplot2]{aes}}.
#' @param data Los datos que se mostrarán en esta capa.
#' @param position Ajuste de posición.
#' @param na.rm Si \code{FALSE} (por defecto), los valores faltantes se eliminan con una advertencia. Si \code{TRUE}, se eliminan silenciosamente.
#' @param show.legend Lógico. ¿Debería esta capa incluirse en las leyendas?
#' @param inherit.aes Si \code{FALSE}, anula el comportamiento de heredar los estéticos del gráfico principal.
#' @param color_interna Color para las vallas internas (VII, VIS).
#' @param color_externa Color para las vallas externas (VEI, VES).
#' @param linetype Tipo de línea para las vallas (por defecto "dashed").
#' @param linewidth Grosor de las líneas de las vallas (por defecto 1).
#' @param size_texto Tamaño del texto de las etiquetas (por defecto 3.5).
#' @param mostrar_vallas Qué vallas mostrar: "todas" (por defecto), "internas" o "externas".
#' @param ... Otros argumentos pasados a \code{\link[ggplot2]{layer}}.
#' @importFrom ggplot2 layer ggproto Stat GeomVline GeomLabel aes
#' @export
geom_vallas <- function(mapping = NULL, data = NULL, position = "identity",
                        na.rm = FALSE, show.legend = NA, inherit.aes = TRUE,
                        color_interna = "orange", color_externa = "red",
                        linetype = "dashed", linewidth = 1, size_texto = 3.5,
                        mostrar_vallas = "todas", ...) {
    res <- list()

    # --- Capas Internas ---
    if (mostrar_vallas %in% c("todas", "internas")) {
        res <- c(res, list(
            ggplot2::layer(
                stat = StatVallasOnlyLines, data = data, mapping = mapping, geom = "vline",
                position = position, show.legend = show.legend, inherit.aes = inherit.aes,
                params = list(
                    na.rm = na.rm, linetype = linetype, linewidth = linewidth,
                    color = color_interna, mostrar_vallas = "internas", ...
                )
            ),
            ggplot2::layer(
                stat = StatVallasOnlyLabels, data = data, mapping = mapping, geom = "label",
                position = position, show.legend = FALSE, inherit.aes = inherit.aes,
                params = list(
                    na.rm = na.rm, y = 0.2, fill = "white", vjust = 0.5, size = size_texto,
                    color = color_interna, mostrar_vallas = "internas", ...
                )
            )
        ))
    }

    # --- Capas Externas ---
    if (mostrar_vallas %in% c("todas", "externas")) {
        res <- c(res, list(
            ggplot2::layer(
                stat = StatVallasOnlyLines, data = data, mapping = mapping, geom = "vline",
                position = position, show.legend = show.legend, inherit.aes = inherit.aes,
                params = list(
                    na.rm = na.rm, linetype = linetype, linewidth = linewidth,
                    color = color_externa, mostrar_vallas = "externas", ...
                )
            ),
            ggplot2::layer(
                stat = StatVallasOnlyLabels, data = data, mapping = mapping, geom = "label",
                position = position, show.legend = FALSE, inherit.aes = inherit.aes,
                params = list(
                    na.rm = na.rm, y = 0.2, fill = "white", vjust = 0.5, size = size_texto,
                    color = color_externa, mostrar_vallas = "externas", ...
                )
            )
        ))
    }

    return(res)
}

#' @export
StatVallasOnlyLines <- ggplot2::ggproto("StatVallasOnlyLines", ggplot2::Stat,
    compute_group = function(data, scales, mostrar_vallas = "todos") {
        x <- data$x
        Q1 <- stats::quantile(x, 0.25, names = FALSE)
        Q3 <- stats::quantile(x, 0.75, names = FALSE)
        IQR <- Q3 - Q1

        # Calculamos todas
        todas_vallas <- c(
            VEI = Q1 - 3 * IQR,
            VII = Q1 - 1.5 * IQR,
            VIS = Q3 + 1.5 * IQR,
            VES = Q3 + 3 * IQR
        )

        # Filtramos segun parametro
        vallas <- switch(mostrar_vallas,
            "internas" = todas_vallas[c("VII", "VIS")],
            "externas" = todas_vallas[c("VEI", "VES")],
            todas_vallas # valor por defecto "todos"
        )

        data.frame(
            xintercept = as.numeric(vallas),
            tipo = if (mostrar_vallas == "internas") "Interna" else "Externa", # Simplificacion
            x = as.numeric(vallas)
        )
    },
    required_aes = c("x")
)

#' @export
StatVallasOnlyLabels <- ggplot2::ggproto("StatVallasOnlyLabels", ggplot2::Stat,
    compute_group = function(data, scales, mostrar_vallas = "todos") {
        x <- data$x
        Q1 <- stats::quantile(x, 0.25, names = FALSE)
        Q3 <- stats::quantile(x, 0.75, names = FALSE)
        IQR <- Q3 - Q1

        todas_vallas <- c(
            VEI = Q1 - 3 * IQR,
            VII = Q1 - 1.5 * IQR,
            VIS = Q3 + 1.5 * IQR,
            VES = Q3 + 3 * IQR
        )

        vallas <- switch(mostrar_vallas,
            "internas" = todas_vallas[c("VII", "VIS")],
            "externas" = todas_vallas[c("VEI", "VES")],
            todas_vallas
        )

        data.frame(
            x = as.numeric(vallas),
            label = names(vallas),
            tipo = if (mostrar_vallas == "internas") "Interna" else "Externa"
        )
    },
    required_aes = c("x")
)
