library(estadisticaFcaUnl)
library(ggplot2)
library(dplyr)
library(moments)
data("energia_abejas")
ggplot(energia_abejas) +
    aes(y = Energia, x = Temp_ord) +
    geom_boxplot()
energia_abejas_mod <- energia_abejas %>%
    group_by(Temp_ord) %>%
    ajustar_variables(col = "Energia", n_outliers = c(1, 2, 3)) %>%
    ungroup()


ggplot(energia_abejas_mod) +
    aes(y = Energia, x = Temp_ord) +
    geom_boxplot()

energia_abejas %>%
    group_by(Temp_ord) %>%
    summarise(
        asime = skewness(Energia),
        curt = kurtosis(Energia),
        media = mean(Energia),
        desvio = sd(Energia)
    )


ggplot(energia_abejas) +
    aes(x = Energia) +
    geom_histogram(aes(y = after_stat(density)), bins = 15, fill = "skyblue", color = "black", alpha = 0.6) +
    geom_density(col = "red", linewidth = 1) +
    facet_wrap(~Temp_ord) +
    theme_minimal() +
    labs(title = "Distribución de Energía por Temperatura", y = "Densidad")

ggplot(energia_abejas) +
    aes(x = Energia, fill = Temp_ord) +
    geom_density(alpha = 0.5) +
    theme_minimal()
energia_abejas_mod2 <- energia_abejas %>%
    group_by(Temp_ord) %>%
    ajustar_variables(
        col = "Energia",
        asim_obj = list(NULL, -0.1, 0.1),
        n_outliers = list(1, 2, 1),
        mantener_originales = TRUE
    ) %>%
    ungroup()
ggplot(energia_abejas_mod2) +
    aes(x = Energia) +
    geom_histogram(aes(y = after_stat(density)), bins = 15, fill = "skyblue", color = "black", alpha = 0.6) +
    geom_density(col = "red", linewidth = 1) +
    facet_wrap(~Temp_ord) +
    theme_minimal() +
    labs(title = "Distribución de Energía por Temperatura", y = "Densidad")

ggplot(energia_abejas_mod2) +
    aes(x = Energia, fill = Temp_ord) +
    geom_density(alpha = 0.5) +
    theme_minimal()
