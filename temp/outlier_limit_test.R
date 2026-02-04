# Script para verificar limites de outliers en N=9
set.seed(42)
x <- rnorm(9)

# Intentar forzar 5 outliers moviendolos muy lejos
# Ordenamos
x <- sort(x)
# Movemos los 5 más grandes a un valor muy alto
x[5:9] <- x[5:9] + 1000

# Verificamos
cat("Data:", x, "\n")
stats <- boxplot.stats(x)
cat("Outliers encontrados:", length(stats$out), "\n")
cat("Outliers:", stats$out, "\n")
cat("Q1:", quantile(x, 0.25), "\n")
cat("Q3:", quantile(x, 0.75), "\n")
cat("IQR:", IQR(x), "\n")

# Intentar con 4
set.seed(42)
x <- rnorm(9)
x[6:9] <- x[6:9] + 1000
cat("\n--- Con 4 modificados ---\n")
stats <- boxplot.stats(x)
cat("Outliers encontrados:", length(stats$out), "\n")

# Intentar con 3
set.seed(42)
x <- rnorm(9)
x[7:9] <- x[7:9] + 1000
cat("\n--- Con 3 modificados ---\n")
stats <- boxplot.stats(x)
cat("Outliers encontrados:", length(stats$out), "\n")
