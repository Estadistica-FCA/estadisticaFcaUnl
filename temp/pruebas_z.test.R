# Generar datos de ejemplo
set.seed(42)
datos1 <- rnorm(50, mean = 105, sd = 15)
set.seed(42)
datos2 <- rnorm(50, mean = 85, sd = 11)

# Parámetros de la prueba Z
mu <- 100
sigma1 <- 15
sigma2 <- 11

z.test(x = datos1, mu = mu, sig_x = sigma1, alternative = "two.sided", conf.level = 0.99)

z.test(x = datos1, mu = 22, y = datos2, sig_x = sigma1, sig_y = sigma2, alternative = "less", conf.level = 0.90)
p1 <- 112 / 120
p2 <- 135 / 150
z.test(p1 = p1, p2 = p2, n1 = 120, n2 = 150, alternative = "two.sided", conf.level = 0.95)
