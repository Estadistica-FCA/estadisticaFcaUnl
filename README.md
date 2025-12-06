# estadisticaFcaUnl <a href="https://fca.unl.edu.ar/"><picture><source media="(prefers-color-scheme: dark)" srcset="man/figures/logo_dark.png"><img src="man/figures/logo.png" align="left" height="139" alt="FCA-UNL" /></picture></a>

<!-- badges: start -->
<!-- badges: end -->

Herramientas y Datos para Estadística en FCA-UNL.

Provee conjuntos de datos y funciones auxiliares para la enseñanza y práctica de la estadística en la Facultad de Ciencias Agrarias de la Universidad Nacional del Litoral.

## Instalación

Puedes instalar la versión de desarrollo de `estadisticaFcaUnl` desde [GitHub](https://github.com/) con:

``` r
# install.packages("devtools")
devtools::install_github("Estadistica-FCA/estadisticaFcaUnl")
```

## Ejemplo

Este es un ejemplo básico de cómo cargar un dataset del paquete:

``` r
library(estadisticaFcaUnl)

# Cargar el dataset lotes_BA
data(lotes_BA)

# Ver las primeras filas
head(lotes_BA)
```
