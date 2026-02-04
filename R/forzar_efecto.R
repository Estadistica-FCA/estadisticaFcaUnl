#' Forzar la significancia de un efecto en un diseño experimental
#'
#' @description
#' Modifica los datos de un diseño experimental para garantizar que un término específico
#' (tratamiento o interacción) resulte significativo (p < alpha) o no significativo,
#' preservando la estructura de bloques y otros factores.
#'
#' Utiliza `ajustar_variables` internamente para realizar las modificaciones.
#'
#' @param data Dataframe con los datos del experimento.
#' @param formula Fórmula del diseño (ej. `y ~ A * B`).
#' @param term El término a manipular (ej. "A", "A:B"). Si es NULL, se intenta detectar automáticamente
#' (priorizando interacciones sobre efectos principales).
#' @param significativo Lógico. TRUE para buscar diferencias significativas, FALSE para eliminarlas.
#' @param alpha Nivel de significancia nominal (solo referecial por ahora, controla la magnitud del cambio).
#' @param magnitud Multiplicador del desvío estándar para generar las diferencias. Valor más alto = p-valor más bajo.
#' @return El dataframe modificado.
#' @importFrom stats terms as.formula aggregate sd model.frame
#' @importFrom cli cli_abort cli_alert_info
#' @export
forzar_efecto <- function(data, formula, term = NULL, significativo = TRUE, alpha = 0.05, magnitud = 2) {
    # 1. Parsear Fórmula
    f <- as.formula(formula)
    y_name <- as.character(f[[2]])
    term_labels <- attr(stats::terms(f), "term.labels")

    if (length(term_labels) == 0) {
        cli::cli_abort("La f\u00f3rmula no tiene t\u00e9rminos.")
    }

    # 2. Auto-detectar término si es NULL
    if (is.null(term)) {
        # Prioridad: Interacciones (contienen ":") > Efectos Principales
        inters <- grep(":", term_labels, value = TRUE)
        main <- grep(":", term_labels, value = TRUE, invert = TRUE)

        # Filtrar bloques si es posible? Dificil saber cual es bloque sin metadata.
        # Asumimos el ultimo interaccion o el primer main.
        if (length(inters) > 0) {
            term <- inters[length(inters)] # La interacción más compleja
            cli::cli_alert_info("Seleccionado autom\u00e1ticamente el t\u00e9rmino: {.val {term}}")
        } else {
            term <- main[1]
            cli::cli_alert_info("Seleccionado autom\u00e1ticamente el t\u00e9rmino: {.val {term}}")
        }
    }

    if (!term %in% term_labels) {
        cli::cli_abort("El t\u00e9rmino {.val {term}} no est\u00e1 en la f\u00f3rmula.")
    }

    # 3. Identificar Variables del Término y Variables "Otras" (Bloques/Covariables)
    # term "A:B" -> vars c("A", "B")
    term_vars <- all.vars(as.formula(paste("~", term)))

    # Todas las variables del lado derecho
    all_rhs_vars <- all.vars(f[[3]])

    # Otras variables (Bloques) = Todas - TermVars
    block_vars <- setdiff(all_rhs_vars, term_vars)

    # 4. Agrupar Dataframe por TODOS los factores (Term + Bloques)
    # Para asegurar que calculamos medias por celda experimental
    group_vars <- c(term_vars, block_vars)

    # 5. Estrategia de Modificación

    # Paso A: Calcular media base de los bloques (si existen)
    # Si no hay bloques, la base es la media global.
    # Si hay bloques, la base varía por bloque.

    # Necesitamos una columna temporal en 'data' con la "Media Base"
    if (length(block_vars) > 0) {
        # Calcular media de Y agrupada por BlockVars
        agg_block <- stats::aggregate(
            as.formula(paste(y_name, "~", paste(block_vars, collapse = "+"))),
            data = data,
            FUN = mean,
            na.rm = TRUE
        )
        # Renombrar columna 'y' a 'bloque_media'
        names(agg_block)[names(agg_block) == y_name] <- ".bloque_media"

        # Unir con data (merge preserve order? Ajustar variables maneja groups)
        # Mejor estrategia: Usar vector de targets alineado.
        # Pero ajustar_variables no hace merge.
        # Solución: Crear columna ".bloque_media" en data usando merge/match
        data_labeled <- merge(data, agg_block, by = block_vars, all.x = TRUE, sort = FALSE)

        # Restaurar orden original si merge lo cambia (merge suele ordenar)
        # Truco: ID
        data$.id_temp <- seq_len(nrow(data))
        data_labeled <- merge(data, agg_block, by = block_vars, all.x = TRUE)
        data_labeled <- data_labeled[order(data_labeled$.id_temp), ]
        data$.id_temp <- NULL # Clean proper
    } else {
        data_labeled <- data
        data_labeled$.bloque_media <- mean(data[[y_name]], na.rm = TRUE)
    }

    # Paso B: Calcular "Efecto" a inyectar para el término
    # SD pooled aproximado
    sd_res <- stats::sd(data[[y_name]], na.rm = TRUE) # Simple approx

    # Interaction levels
    if (length(term_vars) > 1) {
        # Interacción: interaction(A, B)
        term_fac <- interaction(data_labeled[term_vars])
    } else {
        term_fac <- as.factor(data_labeled[[term_vars]])
    }

    # Niveles únicos
    lvls <- levels(term_fac)
    n_lvls <- length(lvls)

    if (significativo) {
        # Buscamos separar las medias de los grupos definidos por `term_vars`
        # Creamos una variable combinada de los niveles de term_vars
        # Ej. TratA, TratB.
        # Asignamos un delta a cada nivel.

        # Definir offset para cada nivel: centrado en 0
        # Ej: -1, 0, 1 * k * SD
        offsets <- seq(-magnitud, magnitud, length.out = n_lvls) * sd_res
        names(offsets) <- lvls

        # Asignar efecto a cada fila
        data_labeled$.efecto <- offsets[as.character(term_fac)]

        # Target Final = Media Bloque + Efecto
        data_labeled$.target_media <- data_labeled$.bloque_media + data_labeled$.efecto
    } else {
        # No Significativo: Reducir las diferencias entre grupos.
        # "magnitud" controla cuán pequeñas son las diferencias.
        # Mayor magnitud -> menor diferencia -> p-valor más alto (más cerca de 1).
        # Menor magnitud -> mayor diferencia (pero aún no sig si es bajo) -> p-valor más bajo.

        # Generamos ruido aleatorio pequeño centrado en 0
        # SD del ruido = sd_res / magnitud
        noise_sd <- sd_res / magnitud

        # Generar offsets aleatorios para cada nivel
        offsets <- stats::rnorm(n_lvls, mean = 0, sd = noise_sd)
        names(offsets) <- lvls

        # Centrar offsets para no desplazar la media global del bloque
        # (Aunque Ajustar Variables maneja esto, es más limpio)
        offsets <- offsets - mean(offsets)

        # Asignar efecto aleatorio pequeño
        data_labeled$.efecto <- offsets[as.character(term_fac)]

        # Target Final = Media Bloque + Pequeño Efecto Aleatorio
        data_labeled$.target_media <- data_labeled$.bloque_media + data_labeled$.efecto
    }

    # 6. Ejecutar Ajuste
    # Agrupamos por TODOS los factores para que ajustar_variables toque cada celda
    # usando el target calculado fila a fila

    # Requerimos dplyr para group_by dinámico o pasamos grupos manuales?
    # ajustar_variables ACEPTA column names para targets!
    # Entonces, solo necesitamos pasar el nombre ".target_media"
    # Y debemos agrupar data_labeled por 'group_vars' si queremos ajustar desvíos por celda,
    # O simplemente no agrupar si confiamos en el ajuste fila a fila?
    # PRECAUCION: ajustar_variables NO acepta targets fila a fila si no está agrupado (lanza warning y usa unique).
    # ENTONCES: Debemos agrupar data_labeled por `group_vars`.

    # Como no queremos depender de dplyr::group_by en este script:
    # Creamos estructura grouped_df manualmente o usamos el de dplyr si está disponible.

    if (requireNamespace("dplyr", quietly = TRUE)) {
        data_grouped <- dplyr::group_by(data_labeled, dplyr::across(dplyr::all_of(group_vars)))

        # Llamada
        # Preservar desvío original (NULL) o reducirlo?
        # Si significativo=TRUE, reducir ruido ayuda (magnitud controla media, pero reducir sd ayuda p-valor).
        # Por defecto mantenemos sd original (NULL).

        res <- ajustar_variables(data_grouped, col = y_name, media_obj = ".target_media")

        # Desagrupar y limpiar columnas temporales
        res <- dplyr::ungroup(res)
        res$.bloque_media <- NULL
        res$.efecto <- NULL
        res$.target_media <- NULL
        res$.id_temp <- NULL

        return(res)
    } else {
        cli::cli_abort("Se requiere el paquete dplyr instalado para usar forzar_efecto.")
    }
}
