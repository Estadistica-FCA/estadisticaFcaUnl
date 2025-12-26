# Ejemplos de uso para vallas_outliers y geom_vallas
# Cargar el paquete
devtools::load_all()
library(ggplot2)

set.seed(42)
datos_df <- data.frame(valor = c(rnorm(100), 5, 6, -5))

# 1. Uso básico (colores por defecto: naranja interna, rojo externa)
ggplot(datos_df, aes(x = valor)) +
    geom_boxplot() +
    geom_vallas() +
    labs(title = "Colores por defecto (Naranja/Rojo)") +
    theme_minimal()

# 2. Personalización Directa (¡Nuevo!)
ggplot(datos_df, aes(x = valor)) +
    geom_boxplot() +
    geom_vallas(color_interna = "blue", color_externa = "darkgreen", linewidth = 1.2) +
    labs(title = "Personalizado: Interna Azul, Externa Verde") +
    theme_minimal()

# 3. Faceting
df_facet <- rbind(
    data.frame(valor = c(rnorm(100, mean = 0), 5, 6, -5), grupo = "A"),
    data.frame(valor = c(rnorm(100, mean = 5), 10, 11, -10), grupo = "B")
)

ggplot(df_facet, aes(x = valor)) +
    geom_boxplot() +
    geom_vallas(color_interna = "purple", color_externa = "black") + # Personalizado en facetas
    facet_wrap(~grupo, scales = "free_x") +
    labs(title = "Faceting con colores personalizados") +
    theme_minimal()

ggplot(df_facet, aes(x = valor)) +
    geom_boxplot() +
    geom_vallas(mostrar_vallas = "internas") +
    facet_wrap(~grupo) +
    coord_flip() +
    labs(title = "Faceting solo internas") +
    theme_minimal()

# 4. Casos a resolver
# Como cada layer se dibuja por separado y son vlines, no se puede usar sin faceting
ggplot(df_facet) +
    aes(x = valor, y = grupo) +
    geom_boxplot() +
    geom_vallas() +
    labs(title = "Sin faceting") +
    theme_minimal()
# Para comparar múltiples grupos con sus respectivas vallas,
# la forma correcta es usar facet_wrap() o facet_grid().
# De esta forma cada panel calcula y dibuja sus vallas de forma independiente.
# Intentar graficarlos en un mismo panel con variables en X e Y no es compatible
# con el uso de líneas infinitas (geom_vline).
