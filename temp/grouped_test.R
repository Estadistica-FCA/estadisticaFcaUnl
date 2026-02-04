library(estadisticaFcaUnl)
library(dplyr)
library(moments)

# 1. Crear dataset agrupado
set.seed(42)
df <- bind_rows(
    tibble(g = "A", val = rnorm(100, mean = 20, sd = 2)),
    tibble(g = "B", val = rnorm(100, mean = 100, sd = 10))
) %>% group_by(g)

cat("--- ORIGINAL BY GROUP ---\n")
print(df %>% summarize(m = mean(val), s = sd(val)))

# 2. Aplicar ajuste VECTORIZADO
# Grupo A: media 50
# Grupo B: media 200
df_mod <- ajustar_variables(df, "val",
    media_obj = c(50, 200)
)

cat("\n--- MODIFIED BY GROUP (Vector Target) ---\n")
res_vec <- df_mod %>% summarize(m = mean(val), s = sd(val))
print(res_vec)

# Check
m_A <- res_vec %>%
    filter(g == "A") %>%
    pull(m)
m_B <- res_vec %>%
    filter(g == "B") %>%
    pull(m)

if (abs(m_A - 50) < 1e-10 && abs(m_B - 200) < 1e-10) {
    cat("Vector Grouped Test: OK\n")
} else {
    cat("Vector Grouped Test: FAIL\n")
}

# 3. Test de columna como argumento (Bonus check for safety)
# Aunque el usuario prefirio vectores, la implementacion soporta nombres de columna
df_col <- df %>% mutate(target_m = if_else(g == "A", 30, 40))
df_mod_col <- ajustar_variables(df_col, "val", media_obj = "target_m")

cat("\n--- MODIFIED BY GROUP (Column Target) ---\n")
res_col <- df_mod_col %>% summarize(m = mean(val))
print(res_col)
