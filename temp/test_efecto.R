library(estadisticaFcaUnl)
library(dplyr)
library(stats)

# 1. Cargar dataset energia_abejas
data(energia_abejas)

cat("--- ANOVA ORIGINAL ---\n")
mod0 <- aov(Energia ~ Temp_ord * Visc_ord, data = energia_abejas)
print(summary(mod0))

# 2. Forzar NO Significativo (H0) en Interacción
df_no_int <- forzar_efecto(energia_abejas, Energia ~ Temp_ord * Visc_ord,
    significativo = TRUE # , magnitud = 10
)

summary(aov(Energia ~ Temp_ord * Visc_ord, data = df_no_int))
