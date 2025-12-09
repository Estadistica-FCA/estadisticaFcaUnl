#' @title Verificar Ortogonalidad de una Matriz
#' @description Comprueba si las columnas de una matriz son ortogonales entre sí y si suman cero (contrastes).
#' @param M Una matriz numérica.
#' @return Un valor lógico (invisible): TRUE si las columnas son ortogonales y suman cero, FALSE en caso contrario.
#' @examples
#' K <- cbind(
#'     C1 = c(1, -1 / 4, -1 / 4, -1 / 4, -1 / 4),
#'     C2 = c(0, 1, -1, 0, 0),
#'     C3 = c(0, 0, 0, 1, -1),
#'     C4 = c(0, 1 / 2, 1 / 2, -1 / 2, -1 / 2)
#' )
#' verificar_ortogonalidad(K)
#' @export
verificar_ortogonalidad <- function(M) {
    if (!is.matrix(M)) {
        stop("El argumento M debe ser una matriz.")
    }

    n_cols <- ncol(M)
    colnames_M <- colnames(M)
    # Si no hay nombres de columnas, se asignan nombres por defecto
    if (is.null(colnames_M)) {
        colnames_M <- paste0("C", 1:n_cols)
    }
    # chequea que la suma de cada columna sea cero
    all_sums_zero <- TRUE
    cat("Verificaci\u00f3n de suma de coeficientes:\n")
    for (i in 1:n_cols) {
        s <- sum(M[, i])
        if (s != 0) {
            all_sums_zero <- FALSE
        }
        cat(sprintf("Sumatoria del contraste %s = %g\n", colnames_M[i], s))
    }

    # chequea que la matriz sea ortogonal
    all_orthogonal <- TRUE
    failing_pairs <- character(0) # guarda las combinaciones que no son ortogonales

    if (n_cols > 1) {
        for (i in 1:(n_cols - 1)) {
            for (j in (i + 1):n_cols) {
                cp <- sum(M[, i] * M[, j])
                if (cp != 0) {
                    all_orthogonal <- FALSE
                    failing_pairs <- c(failing_pairs, sprintf("  %s vs %s (Producto = %g)", colnames_M[i], colnames_M[j], cp))
                }
            }
        }
    }
    # imprime el resultado final
    is_orthogonal <- all_sums_zero && all_orthogonal
    cat("\nResultado final: La matriz", ifelse(is_orthogonal, "ES", "NO ES"), "ortogonal.\n")
    # imprime las combinaciones que no son ortogonales si las hay
    if (length(failing_pairs) > 0) {
        cat("Combinaciones que rompen la ortogonalidad:\n")
        cat(paste(failing_pairs, collapse = "\n"), "\n")
    }
    # retorna el resultado final
    invisible(is_orthogonal)
}
