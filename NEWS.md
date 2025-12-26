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
