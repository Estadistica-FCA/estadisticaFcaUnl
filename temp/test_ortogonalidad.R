library("estadisticaFcaUnl")

K <- cbind(
    C1 = c(1, -1 / 4, -1 / 4, -1 / 4, -1 / 4),
    C2 = c(0, 1, -1, 0, 0),
    C3 = c(0, 0, 0, 1, -1),
    C4 = c(0, 1 / 2, 1 / 2, -1 / 2, -1 / 2)
)

verificar_ortogonalidad(K)

K <- cbind(
    C1 = c(1, -1 / 4, -1 / 4, -1 / 4, -1 / 4),
    C2 = c(0, 1, -1, 0, 0),
    C3 = c(0, 0, 0, 1, -1),
    C4 = c(0, 1 / 2, 1 / 2, -1 / 2, 0)
)

verificar_ortogonalidad(K)
