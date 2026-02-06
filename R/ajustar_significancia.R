#' Ajustar la significancia de un efecto en un diseño experimental
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
#' @param sig Lógico. TRUE para buscar diferencias significativas, FALSE para eliminarlas.
#' @param alpha Nivel de significancia nominal (solo referecial por ahora, controla la magnitud del cambio).
#' @param magnitud Multiplicador del desvío estándar para generar las diferencias. Valor más alto = p-valor más bajo.
#' @return El dataframe modificado.
#' @importFrom stats terms as.formula aggregate sd model.frame
#' @importFrom cli cli_abort cli_alert_info
#' @importFrom dplyr %>% group_by across all_of filter mutate ungroup bind_rows summarise
#' @examples
#' \donttest{
#' library(stats)
#'
#' # 1. Caso con energia_abejas: Forzar NO Significativo en Interacción
#' data(energia_abejas)
#' mod0 <- aov(Energia ~ Temp_ord * Visc_ord, data = energia_abejas)
#' summary(mod0)
#'
#' energia_ns <- ajustar_significancia(energia_abejas, Energia ~ Temp_ord * Visc_ord,
#'     sig = FALSE
#' )
#' summary(aov(Energia ~ Temp_ord * Visc_ord, data = energia_ns))
#'
#' # 2. Caso con sal_suelo: Forzar NO significativo en interacción específica
#' data(sal_suelo)
#' mod_sal <- aov(EC ~ Salinidad_ord * Agua_ord + Textura, data = sal_suelo)
#' summary(mod_sal)
#'
#' sal_ns <- ajustar_significancia(sal_suelo, EC ~ Salinidad_ord * Agua_ord + Textura,
#'     term = "Salinidad_ord:Agua_ord",
#'     sig = FALSE
#' )
#' summary(aov(EC ~ Salinidad_ord * Agua_ord + Textura, data = sal_ns))
#' }
#' @export
ajustar_significancia <- function(data, formula, term = NULL, sig, alpha = 0.05, magnitud = 2) {
    if (missing(sig)) {
        cli::cli_abort("El argumento {.arg sig} es obligatorio. Debe ser TRUE o FALSE.")
    }

    if (!is.logical(sig) || length(sig) != 1) {
        cli::cli_abort("El argumento {.arg sig} debe ser un valor l\u00f3gico (TRUE o FALSE).")
    }

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

    # 3. Early Exit Strategy
    cli::cli_alert_info("Verificando estado actual del t\u00e9rmino {.val {term}}...")
    model_check <- stats::aov(f, data = data)
    summ <- summary(model_check)[[1]]

    # Clean term name (remove spaces usually not needing, but aov output matches term labels)
    # Check if term exists in summary (it should)
    if (term %in% rownames(summ)) {
        pval <- summ[term, "Pr(>F)"]
        is_sig <- !is.na(pval) && pval < alpha

        if (sig && is_sig) {
            cli::cli_alert_success("El t\u00e9rmino {.val {term}} ya es significativo (p = {format.pval(pval)}). No se realizaron cambios.")
            return(data)
        }

        if (!sig && !is_sig) {
            # Double check magnitude? If user wants to force "more" non-significant?
            # For now, simplistic early exit.
            cli::cli_alert_success("El t\u00e9rmino {.val {term}} ya es NO significativo (p = {format.pval(pval)}). No se realizaron cambios.")
            return(data)
        }
    }

    # 4. Modificación

    # Identificar Variables
    term_vars <- all.vars(as.formula(paste("~", term))) # Identifica las variables del término
    all_rhs_vars <- all.vars(f[[3]]) # Identifica todas las variables en el lado derecho de la fórmula
    block_vars <- setdiff(all_rhs_vars, term_vars) # Identifica las variables de bloque (todas las del lado derecho menos las del término)
    group_vars <- c(term_vars, block_vars) # Identifica todas las variables de grupo (las del término más las de bloque)

    # Validar repeticiones por TÉRMINO (para evitar experimentos sin replicación del tratamiento)
    # Validar que cada nivel del término tenga al menos 2 obs en total
    counts_term <- data %>%
        dplyr::group_by(dplyr::across(dplyr::all_of(term_vars))) %>%
        dplyr::count()

    if (any(counts_term$n < 2)) {
        cli::cli_abort(c(
            "Se encontraron niveles del t\u00e9rmino sin repeticiones.",
            "x" = "Cada nivel de {.val {term}} debe tener al menos 2 observaciones en total."
        ))
    }


    # Paso A: Calcular media base de los bloques
    if (length(block_vars) > 0) {
        agg_block <- stats::aggregate(
            as.formula(paste(y_name, "~", paste(block_vars, collapse = "+"))),
            data = data,
            FUN = mean,
            na.rm = TRUE
        )
        names(agg_block)[names(agg_block) == y_name] <- ".bloque_media"

        # Merge preserving order
        data$.id_temp <- seq_len(nrow(data))
        data_labeled <- merge(data, agg_block, by = block_vars, all.x = TRUE)
        data_labeled <- data_labeled[order(data_labeled$.id_temp), ]
        data$.id_temp <- NULL
    } else {
        data_labeled <- data
        data_labeled$.bloque_media <- mean(data[[y_name]], na.rm = TRUE)
    }

    # Paso B: Calcular Efecto
    sd_res <- stats::sd(data[[y_name]], na.rm = TRUE)

    if (length(term_vars) > 1) {
        term_fac <- interaction(data_labeled[term_vars])
    } else {
        term_fac <- as.factor(data_labeled[[term_vars]])
    }

    lvls <- levels(term_fac)
    n_lvls <- length(lvls)

    if (sig) {
        # Generar diferencias
        offsets <- seq(-magnitud, magnitud, length.out = n_lvls) * sd_res
        names(offsets) <- lvls
        data_labeled$.efecto <- offsets[as.character(term_fac)]
        data_labeled$.target_media <- data_labeled$.bloque_media + data_labeled$.efecto
    } else {
        # Eliminar diferencias (Ruido controlado)
        # Invertir logica magnitud: Mayor magnitud = Mayor reduccion de efecto?
        # User request: "el parametro magnitud dependiendo el valor que le ingreses logra lo deseado ... inconsistente"
        # Logic: Magnitud should reflect "Intensity of the forcing".
        # Forcing Non-Significance -> High Magnitude = Very low p-value (wait, very HIGH p-value, close to 1).
        # We start with small noise.
        # Let's define: P-value target approx 1 -> Variance among groups ~ 0.
        # We want group means to be VERY close.
        # Base logic: .target_media = .bloque_media + noise.
        # noise sd should be small.
        # Relationship: noise_sd = sd_res / f(magnitud).
        # if magnitud = 2 (standard), noise should be small enough to be non-sig.
        # Say, 0.1 * sd_res.
        # New formula: noise_sd = sd_res / (magnitud * 5)

        noise_sd <- sd_res / (magnitud * 5)
        offsets <- stats::rnorm(n_lvls, mean = 0, sd = noise_sd)
        names(offsets) <- lvls
        offsets <- offsets - mean(offsets) # Center

        data_labeled$.efecto <- offsets[as.character(term_fac)]
        data_labeled$.target_media <- data_labeled$.bloque_media + data_labeled$.efecto
    }

    # 6. Ejecutar Ajuste
    # Separar casos N=1 (RCBD cell) de N>1

    # Agrupamos por celda experimental
    data_labeled <- data_labeled %>%
        dplyr::group_by(dplyr::across(dplyr::all_of(group_vars))) %>%
        dplyr::mutate(.n_cell = dplyr::n()) %>%
        dplyr::ungroup()

    # Split
    df_single <- dplyr::filter(data_labeled, .n_cell == 1)
    df_multi <- dplyr::filter(data_labeled, .n_cell > 1)

    # Process Single (Direct Assignment with Residual Noise)
    if (nrow(df_single) > 0) {
        # Para N=1, debemos inyectar ruido residual (error experimental) manualmente
        # de lo contrario el error es 0 y cualquier diferencia es infinitamente significativa.
        noise <- stats::rnorm(nrow(df_single), mean = 0, sd = sd_res)
        df_single[[y_name]] <- df_single$.target_media + noise
    }

    # Process Multi (Ajustar Variables)
    if (nrow(df_multi) > 0) {
        # Agrupamos
        data_grouped <- dplyr::group_by(df_multi, dplyr::across(dplyr::all_of(group_vars)))

        # Extraer targets
        targets_df <- data_grouped %>%
            dplyr::summarise(tgt = dplyr::first(.target_media), .groups = "drop")

        media_obj_list <- as.list(targets_df$tgt)

        res_multi <- ajustar_variables(data_grouped, col = y_name, media_obj = media_obj_list)
        df_multi <- dplyr::ungroup(res_multi)
    }

    # Recombine
    res <- dplyr::bind_rows(df_single, df_multi)

    # Restore original order if possible?
    # Not critical as long as data integrity is kept, but nice to have.
    # Usually row order is not guaranteed.

    # Limpieza
    res$.bloque_media <- NULL
    res$.efecto <- NULL
    res$.target_media <- NULL
    res$.n_cell <- NULL

    return(res)
}
