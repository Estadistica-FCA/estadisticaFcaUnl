library(estadisticaFcaUnl)
library(moments)

# Create a clean dataset
set.seed(42)
df <- data.frame(
    id = 1:200,
    val = rnorm(200, 20, 5) # Normal: Skew~0, Kurt~0 (excess)
)

cat("--- ORIGINAL ---\n")
cat("Mean:", mean(df$val), "\n")
cat("SD:", sd(df$val), "\n")
cat("Skew:", skewness(df$val), "\n")
cat("Kurtosis:", kurtosis(df$val), "\n")
cat("Outliers:", length(boxplot.stats(df$val)$out), "\n")

# Apply complex transformation
# Target: Mean=50, SD=10, Skew=1.5, Kurt=5, Outliers=15
df_mod <- ajustar_variables(df, "val",
    media_obj = 50,
    desvio_obj = 10,
    asim_obj = 1.5,
    curt_obj = 5,
    n_outliers = 15
)

cat("\n--- MODIFIED ---\n")
val <- df_mod$val
cat("Mean:", mean(val), "\n")
cat("SD:", sd(val), "\n")
cat("Skew:", skewness(val), "\n")
cat("Kurtosis:", kurtosis(val), "\n")
outs <- boxplot.stats(val)$out
cat("Outliers count:", length(outs), "\n")
cat("Outliers summary (Min/Max):", min(outs), "to", max(outs), "\n")
cat("Outliers head:", head(outs), "\n")

# Checks
if (abs(mean(val) - 50) < 1e-10) cat("Mean OK\n") else cat("Mean FAIL\n")
if (abs(sd(val) - 10) < 1e-10) cat("SD OK\n") else cat("SD FAIL\n")
if (abs(skewness(val) - 1.5) < 0.2) cat("Skew OK (Approx)\n") else cat(paste("Skew FAIL:", skewness(val), "\n"))
if (length(boxplot.stats(val)$out) == 15) cat("Outliers OK\n") else cat(paste("Outliers FAIL:", length(boxplot.stats(val)$out), "\n"))
