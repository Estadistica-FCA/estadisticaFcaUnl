devtools::load_all(".")
library(stats)

# 1. Caso con energia_abejas
data(energia_abejas)

mod0 <- aov(Energia ~ Temp_ord * Visc_ord, data = energia_abejas)
summary(mod0)

# Forzar NO Significativo (H0) en Interacción
energia_abejas_ns <- ajustar_significancia(energia_abejas, Energia ~ Temp_ord * Visc_ord,
    sig = FALSE
)

mod1 <- aov(Energia ~ Temp_ord * Visc_ord, data = energia_abejas_ns)
summary(mod1)

# 2. Caso con sal_suelo
data(sal_suelo)
mod0 <- aov(EC ~ Salinidad_ord * Agua_ord + Textura, data = sal_suelo)
summary(mod0)

# Forzar efecto NO significativo
sal_suelo_ns <- ajustar_significancia(sal_suelo, EC ~ Salinidad_ord * Agua_ord + Textura,
    term = "Salinidad_ord:Agua_ord",
    sig = FALSE
)

mod2 <- aov(EC ~ Salinidad_ord * Agua_ord + Textura, data = sal_suelo_ns)
summary(mod2)
