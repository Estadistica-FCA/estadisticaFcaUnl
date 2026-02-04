.hallar_coeficientes_fleishman <- function(asim, curt) {
    # Función objetivo para minimizar
    # ecuaciones de Fleishman 1978:
    # b^2 + 6bd + 2c^2 + 15d^2 = 1 (Varianza = 1)
    # asim = 2c(b^2 + 24bd + 105d^2 + 2)
    # curt = ... (muy largo, usar minimizacion numerica)

    # Usaremos un enfoque más directo:
    # Simular Normal -> Aplicar coeficientes -> Calcular Asim/Curt -> Minimizar error
    # Pero es lento. Fleishman tiene ecuaciones explicitas para optimizar.

    f <- function(coefs) {
        b <- coefs[1]
        c <- coefs[2]
        d <- coefs[3]
        a <- -c # Para media cero

        b2 <- b^2
        c2 <- c^2
        d2 <- d^2
        bd <- b * d

        # Restriccion varianza = 1
        var_eq <- b2 + 6 * bd + 2 * c2 + 15 * d2 - 1

        # Asimetria
        skew_eq <- 2 * c * (b2 + 24 * bd + 105 * d2 + 2) - asim

        # Curtosis (Exceso)
        kurt_eq <- 24 * (b * d + c2 * (1 + 125 * d2) + 48 * c * b * d^3 + 20 * d2) - curt # Formula aprox simplificada, mejor usar simulacion para robustez si formula es liosa?
        # No, mejor usar formulas exactas de Fleishman (1978)
        # Kurtosis Exceso = 24 * [bd + c^2(1 + 125d^2) + something...] - curt
        # Revisando paper o implementaciones confiables:
        # Fleishman (1978):
        # g1(skew) = 2c(b^2 + 24bd + 105d^2 + 2)
        # g2(kurt) = 24(bd + c^2(1 + 125d^2) + 2b^2d(1+...) wait formulas are huge.

        # Alternative: Numerical checking via simulation (slower but strictly accurate)
        # Or using simplified moments?

        # Let's stick to the equations which are safer if we find them correctly.
        # From "BinNonNor" package logic (approx):
        # K = 24*(b*d + c^2 + 18*b*d^3 + 45*c^2*d^2 + 135*d^4) THIS IS WRONG.

        # Let's use simple numerical simulation for the Objective Function inside optim.
        # It's robust and simpler to code without importing 'BinNonNor'.

        z <- sort(rnorm(100000)) # Fixed huge sample for stability
        y <- a + b * z + c * z^2 + d * z^3

        s_sim <- mean((y - mean(y))^3) / sd(y)^3
        k_sim <- mean((y - mean(y))^4) / sd(y)^4 - 3

        return((s_sim - asim)^2 + (k_sim - curt)^2 + abs(var_eq) * 100) # Penalty for var!=1
    }

    # Intentar optimizar
    res <- optim(c(1, 0, 0), f, control = list(maxit = 1000, reltol = 1e-5))

    if (res$convergence != 0) warning("Fleishman optimization did not converge perfectly.")

    return(c(-res$par[2], res$par)) # a, b, c, d (a = -c)
}

# Quick test
# Target Skew=1, Kurt=2
coefs <- .hallar_coeficientes_fleishman(1, 2)
print(coefs)

z <- rnorm(100000)
a <- coefs[1]
b <- coefs[2]
c <- coefs[3]
d <- coefs[4]
y <- a + b * z + c * z^2 + d * z^3

cat("Skew:", moments::skewness(y), "\n")
cat("Kurt:", moments::kurtosis(y) - 3, "\n")
