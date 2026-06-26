#' @title Eficiencia Relativa de un Diseño en Bloques Completos al Azar o Cuadrado Latino
#' @description Calcula la eficiencia relativa (ER) de aplicar un diseño de bloques
#' completos al azar (DBCA) frente a un diseño completamente al azar (DCA), o de un
#' diseño en cuadrado latino (DCL) frente a un diseño en bloques completos al azar (DBCA).
#'
#' @details
#' La función estima la eficiencia relativa basándose en la comparación de las
#' varianzas estimadas (CME) bajo los diseños involucrados y realiza una corrección por
#' grados de libertad. En la comparación `"DCAvsDBCA"`, el término del bloque debe especificarse
#' en primer lugar a la derecha de la fórmula. En la comparación `"DBCAvsDCL"`, los dos primeros
#' términos a la derecha de la fórmula representan las filas y las columnas respectivamente.
#'
#' @param formula Una fórmula del modelo del tipo `respuesta ~ bloque + tratamiento` (para DCA vs DBCA)
#' o `respuesta ~ fila + columna + tratamiento` (para DBCA vs DCL).
#' @param data Un data.frame que contiene las variables del modelo.
#' @param comparacion Carácter. Indica la comparación a realizar:
#' `"DCAvsDBCA"` (por defecto) para comparar DCA frente a DBCA, o
#' `"DBCAvsDCL"` para comparar DBCA frente a DCL (diseño en cuadrado latino).
#'
#' @return Retorna de manera invisible un valor numérico que representa la eficiencia relativa.
#' Para `"DBCAvsDCL"`, retorna de manera invisible un vector con dos valores correspondientes
#' a la eficiencia relativa considerando las filas como bloques y las columnas como bloques respectivamente.
#'
#' @examples
#' library(estadisticaFcaUnl)
#'
#' # Comparación DCA vs DBCA
#' data(fertilizante_pastizal)
#' er_bloqueo(P ~ Bloque + Tratamiento, fertilizante_pastizal)
#'
#' # Comparación DBCA vs DCL
#' data(densidad_trigo_riego_suelo)
#' er_bloqueo(rend ~ Fila + Columna + Densidad_ord, densidad_trigo_riego_suelo, comparacion = "DBCAvsDCL")
#'
#' @importFrom stats as.formula terms model.frame aov anova
#' @importFrom cli cli_abort cli_text cli_bullets cli_alert_success cli_alert_danger cli_alert_info
#' @export
er_bloqueo <- function(formula, data, comparacion = "DCAvsDBCA") {
    formula <- stats::as.formula(formula)
    if (!is.data.frame(data)) {
        cli::cli_abort("El argumento {.arg data} debe ser un data.frame.")
    }

    if (!comparacion %in% c("DCAvsDBCA", "DBCAvsDCL")) {
        cli::cli_abort("El argumento {.arg comparacion} debe ser 'DCAvsDBCA' o 'DBCAvsDCL'.")
    }

    # Evaluar formula en el contexto de data
    mf <- stats::model.frame(formula, data = data)
    formula_terms <- attr(stats::terms(formula), "term.labels")

    if (comparacion == "DCAvsDBCA") {
        if (length(formula_terms) < 2) {
            cli::cli_abort("La fórmula debe tener al menos dos términos en el miembro derecho: el bloque (primero) y el tratamiento (segundo).")
        }

        bloque_name <- formula_terms[1]

        # Ajustar el modelo DBCA y extraer datos del anova
        mod0 <- stats::aov(formula, data = data)
        anova_mod0 <- stats::anova(mod0)

        CME_DBCA <- anova_mod0["Residuals", "Mean Sq"]
        SC_Bloq <- anova_mod0[bloque_name, "Sum Sq"]
        f_DBCA <-  anova_mod0["Residuals", "Df"]

        # Estimar CME si era un DCA
        r <- nlevels(as.factor(mf[[2]]))
        t <- nlevels(as.factor(mf[[3]]))

        CME_DCA <- (SC_Bloq + r * (t - 1) * CME_DBCA) / (r * t - 1)
        f_DCA <-  t * (r - 1)

        # Eficiencia relativa corregida
        fc <- ((f_DBCA + 1) * (f_DCA + 3)) / ((f_DBCA + 3) * (f_DCA + 1))
        er <- (CME_DCA / CME_DBCA) * fc

        # Mostrar por consola
        cli::cli_text("Valores de Cuadrados Medios (CM) utilizados:")
        cli::cli_bullets(c(
            "*" = "CM Error (DCA estimado): {.val {round(CME_DCA, 2)}}",
            "*" = "CM Error (DBCA): {.val {round(CME_DBCA, 2)}}"
        ))
        cli::cli_text("Factor de corrección por grados de libertad: {.val {round(fc, 2)}}")
        cli::cli_text("Eficiencia relativa de aplicar un bloqueo (DCA vs DBCA): {.val {round(er, 2)}}")

        # Conclusión
        if (er > 1) {
            cli::cli_alert_success("Aplicar bloques mejoró la precisión del experimento.")
        } else if (er < 1) {
            cli::cli_alert_danger("Aplicar bloques no mejoró la precisión del experimento.")
        } else {
            cli::cli_alert_info("Aplicar bloques no produjo cambios en la precisión del experimento.")
        }
    } else {
        if (length(formula_terms) < 3) {
            cli::cli_abort("Para la comparación 'DBCAvsDCL', la fórmula debe tener al menos tres términos en el miembro derecho: fila (primero), columna (segundo) y tratamiento (tercero).")
        }

        row_name <- formula_terms[1]
        col_name <- formula_terms[2]

        # Ajustar el modelo DCL y extraer datos del anova
        mod0 <- stats::aov(formula, data = data)
        anova_mod0 <- stats::anova(mod0)

        CME_DCL <- anova_mod0["Residuals", "Mean Sq"]
        CMFila <- anova_mod0[row_name, "Mean Sq"]
        CMCol <- anova_mod0[col_name, "Mean Sq"]
        f_DCL <-  anova_mod0["Residuals", "Df"]

        t <- nlevels(as.factor(mf[[4]]))
        f_DBCA <- (t - 1) * (t - 1)

        # Estimar CME si era un DBCA con fila como bloque
        CME_DBCAf <- (CMFila + (t - 1) * CME_DCL) / t

        # Estimar CME si era un DBCA con columna como bloque
        CME_DBCAc <- (CMCol + (t - 1) * CME_DCL) / t

        # Eficiencias relativas corregidas
        fc <- ((f_DCL + 1) * (f_DBCA + 3)) / ((f_DCL + 3) * (f_DBCA + 1))
        er_f <- (CME_DBCAf / CME_DCL) * fc
        er_c <- (CME_DBCAc / CME_DCL) * fc

        er <- c(er_f, er_c)
        names(er) <- c(row_name, col_name)

        # Mostrar por consola
        cli::cli_text("Valores de Cuadrados Medios (CM) utilizados:")
        cli::cli_bullets(c(
            "*" = "CM Error (DBCA estimado con filas como bloques): {.val {round(CME_DBCAf, 2)}}",
            "*" = "CM Error (DBCA estimado con columnas como bloques): {.val {round(CME_DBCAc, 2)}}",
            "*" = "CM Error (DCL): {.val {round(CME_DCL, 2)}}"
        ))
        cli::cli_text("Factor de corrección por grados de libertad: {.val {round(fc, 2)}}")
        cli::cli_text("Eficiencia relativa de aplicar un cuadrado latino (DBCA vs DCL):")
        cli::cli_bullets(c(
            "*" = "Usando filas como bloques ({.val {row_name}}): {.val {round(er_f, 2)}}",
            "*" = "Usando columnas como bloques ({.val {col_name}}): {.val {round(er_c, 2)}}"
        ))

        # Conclusiones
        # Filas
        if (er_f > 1) {
            cli::cli_alert_success("El diseño en cuadrado latino (DCL) mejoró la precisión respecto a un DBCA con {.val {row_name}} como bloques.")
        } else if (er_f < 1) {
            cli::cli_alert_danger("El diseño en cuadrado latino (DCL) no mejoró la precisión respecto a un DBCA con {.val {row_name}} como bloques.")
        } else {
            cli::cli_alert_info("El diseño en cuadrado latino (DCL) no produjo cambios respecto a un DBCA con {.val {row_name}} como bloques.")
        }
        # Columnas
        if (er_c > 1) {
            cli::cli_alert_success("El diseño en cuadrado latino (DCL) mejoró la precisión respecto a un DBCA con {.val {col_name}} como bloques.")
        } else if (er_c < 1) {
            cli::cli_alert_danger("El diseño en cuadrado latino (DCL) no mejoró la precisión respecto a un DBCA con {.val {col_name}} como bloques.")
        } else {
            cli::cli_alert_info("El diseño en cuadrado latino (DCL) no produjo cambios respecto a un DBCA con {.val {col_name}} como bloques.")
        }
    }

    return(invisible(er))
}