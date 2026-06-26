# estadisticaFcaUnl 0.3.0

*   Implemented `er_bloqueo()` to calculate relative blocking efficiency for "DCAvsDBCA" (DCA vs DBCA) and "DBCAvsDCL" (DBCA vs DCL).
*   Added `comparacion` parameter to `er_bloqueo()` to choose between DCA vs DBCA and DBCA vs DCL comparison modes.
*   Formatted output to display rounded values (2 decimal places) using `cli` in console, while returning the numeric value invisibly.
*   Added package documentation and examples.

# estadisticaFcaUnl 0.2.8


*   Added roxygen2 documentation for 14 experimental statistics datasets: `almacenamiento_carne`, `cangrejo_ermitanio`, `competencia`, `fert_trigo_bajo_riego`, `densidad_trigo_riego_suelo`, `corderos_des`, `citricos`, `lodos`, `cebada_salinidad`, `camarones`, `cemento`, `forestal_alt`, `cesped_compactacion`, and `cesped_golf`.
*   Updated `R/documentation_groups.R` to register these datasets under the `datasets_estex` group in alphabetical order.
*   Updated `pending/PENDING_EST2_DATASETS.md` checklist of pending datasets.

# estadisticaFcaUnl 0.2.7


*   Added a numerical tolerance parameter `tol` to `verificar_ortogonalidad()` to prevent floating-point comparison errors with non-integer contrast matrices.
*   Added support for one-proportion Z-test in `z.test()` when `p1` and `n1` are specified and `p2`/`n2` are omitted.
*   Updated package documentation and examples for `z.test()`.

# estadisticaFcaUnl 0.2.6

*   Reverted column name accent removals across `pesada_novillos` (`Días`, `Días_total`), `especies` (`Número`), `arroz_pd` (`Repetición`), and `cana_pd` (`Método`) to preserve compatibility with scripts/exercises that import raw `.xlsx` files directly.
*   Updated package documentation and re-generated internal `.rda` dataset files to match the reverted column names.

# estadisticaFcaUnl 0.2.5

*   Added roxygen2 documentation for 55 basic statistics datasets (including `molinos`, `alimento`, `maiz`, `corderos`, `sorgo`, `ovejas`, `balanceado_cerdos`, `pezoneras`, `establecimientos`, `neumaticos_tractores`, `glifosato`, `barrenador`, `penetrometro`, `TRC`, `concentracion_insecticida`, `neumaticos`, `peso_balanceado`, `raciones`, `cerdos`, `ganancia_novillos`, `N_suelo`, `efectividad_sembradora`, `lesiones_hojas`, `dieta_bufalos`, `colesterol`, `MS_girasol`, `dietas_pollos`, `germinacion`, `algodon`, `educacion`, `semilla`, `albumen`, `insectos`, `monedas`, `capturados`, `susceptibilidad`, `actividad`, `razas`, `semillas`, `arvejas`, `agua_forrajera`, `area_trigo`, `coleoptero`, `P_maiz`, `lluvia_forraje`, `hileras_maiz`, `calificaciones`, `semilla_trigo`, `huevos`, `pollos`, `fungicida`, `proteina_caseina`, and `dosis_tomate`).
*   Updated `R/documentation_groups.R` to register all 67 basic statistics datasets under the `datasets_estb` group in alphabetical order.
*   Cleaned column names across several datasets to remove written accents/tildes while preserving original capitalization (`Días` and `Días_total` to `Dias` and `Dias_total` in `pesada_novillos`; `Número` to `Numero` in `especies`; `Repetición` to `Repeticion` in `arroz_pd`; `Método` to `Metodo` in `cana_pd`).
*   Re-generated internal `.rda` dataset files and updated package documentation via `devtools::document()`.

# estadisticaFcaUnl 0.2.4

*   Added new function `forzar_efecto()`: Manipulates ANOVA effect significance.
*   Added new function `ajustar_variables()`: Adjusts distribution properties (mean, sd, shape, outliers).
*   Improved `forzar_efecto()` logic: `significativo = FALSE` now generates realistic non-significant p-values using inverse magnitude scaling.
*   Updated `ajustar_variables()`:
    *   Added support for `list()` inputs in grouped dataframes to handle explicit `NULL` values per group.
    *   Added `mantener_originales` argument to preserve original statistics when parameters are unspecified.
    *   Added validation to ensure sample size ($N > 1$) to prevent calculation errors.
*   Renamed `forzar_efecto()` to `ajustar_significancia()`:
    *   Renamed parameter `significativo` to `sig` and made it mandatory.
    *   Added support for RCBD designs (cells with N=1) by injecting residual noise.
    *   Implemented early exit if the desired significance state is already met.
*   Updated documentation: Recommended `pak::pkg_install()` for installation instead of `devtools::install_github()` to align with modern R standards and avoid deprecation warnings.

# estadisticaFcaUnl 0.2.3

*   Refactored `vallas_outliers`: removed plotting logic and updated return type (now `data.frame`).
*   Added `geom_vallas()`: a new ggplot2 geometry to plot outlier fences.
*   `geom_vallas()` supports direct color customization (`color_interna`, `color_externa`), line width (`linewidth`), and label size (`size_texto`).
*   `geom_vallas()` includes a `mostrar_vallas` parameter to filter internal/external fences.
*   Internal implementation uses multiple layers to allow independent styling and facet support.
*   Integrated `cli` package for improved console output in `vallas_outliers`, `verificar_ortogonalidad`, `install.local_repo`, and `mkminiCRAN`.

# estadisticaFcaUnl 0.2.2

*   Added new function: `verificar_ortogonalidad` for checking orthogonality of contrast matrices.
*   Added examples to `z.test` documentation.
*   Added new datasets.
*   Added new datasets: `productores`.
*   Fixed import issue in `superficies_EAP` dataset where some records were missing.
*   Corrected data types for date and time columns in `pesada_novillos` dataset.
*   Improved `vallas_outliers` to explicitly unname quantile inputs, preventing issues with named vectors.
*   Changed `vallas_outliers` return type to a `data.frame` to support `$` operator access.
*   Documentation updates and minor fixes.

# estadisticaFcaUnl 0.2.1

*   Added new function: `vallas_outliers` (and internal helper `z_values`).
*   Comprehensive documentation fixes and improvements across all datasets.
*   Fixed non-ASCII character encoding issues.
*   Internal improvements: Added `globals.R` and fixed namespace imports.
