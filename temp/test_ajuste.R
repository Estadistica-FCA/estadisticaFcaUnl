# Load the package functions (simulating package load)
source("/home/alejandro/Documents/Estadistica/estadisticaFcaUnl/R/ajustar_variables.R")

# Load ryegrass data
# We'll mock the data loading since we are not installing the package yet
# ryegrass structure based on datasets_estb.R
ryegrass <- data.frame(
    planta = 1:75,
    longitud = rnorm(75, mean = 20, sd = 3) # Simulated data
)

cat("Original Mean:", mean(ryegrass$longitud), "\n")
cat("Original SD:", sd(ryegrass$longitud), "\n")

# Adjust to Mean 50 and SD 5
ryegrass_mod <- ajustar_variables(ryegrass, col = "longitud", media_obj = 50, desvio_obj = 5)

cat("\n--- Modified Data ---\n")
cat("New Mean:", mean(ryegrass_mod$longitud), "\n")
cat("New SD:", sd(ryegrass_mod$longitud), "\n")

# Verification
if (abs(mean(ryegrass_mod$longitud) - 50) < 1e-10) {
    cat("Mean Verification: PASSED\n")
} else {
    cat("Mean Verification: FAILED\n")
}

if (abs(sd(ryegrass_mod$longitud) - 5) < 1e-10) {
    cat("SD Verification: PASSED\n")
} else {
    cat("SD Verification: FAILED\n")
}
