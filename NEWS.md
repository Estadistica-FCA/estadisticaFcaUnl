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
