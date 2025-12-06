# 1 pesada_terneros----
#' Pesaje de 1598 terneros que ingresaron al sistema de engorde de la estancia "La Escondida S.A."
#' @docType data
#' @usage data(pesada_terneros)
#' @format
#' A data frame with 1598 rows and 8 columns:
#' * `Procedencia`: nombre del establecimiento del cual provienen los terneros de destete.
#' * `IDV`: código de identificación visual (caravana)
#' * `Sexo`: sexo del animal
#' * `Fecha Ingreso`: fecha de ingreso al sistema de engorde
#' * `Categoria`: categoría dentro a la que pertenecen dentro del rodeo de engorde.
#' * `Fecha`: fecha en la que se realizó la pesada (MM/DD/YYYY)
#' * `Hora`: hora en la que se realizó la pesada (HH:MM:SS)
#' * `Peso`: peso del animal en kg.
#' @source Gentileza Ing. Agr. Marcón
"pesada_terneros"

# 2 superficies_EAP----
#' Cantidad de empresas agropecuarias y la superficie promedio de la provincia de Santa Fe registradas en el Censo Nacional Agropecuario 2008.
#' @docType data
#' @usage data(superficies_EAP)
#' @format
#' A data frame with 19 rows and 3 columns:
#' \describe{
#'   \item{Departamento}{nombre del departamento.}
#'   \item{Cant_EAP}{número de explotaciones agropecuarias.}
#'   \item{Sup_promedio}{superficie promedio de las explotaciones agropecuarias (en ha).}
#' }
#' @source Instituto Nacional de Estadísticas y Censos
"superficies_EAP"

# 3 pesada_novillos----
#' Datos del pesaje de dos tropas de novillos extraídos del sistema de registros del establecimiento "La Escondida S.A."
#' @docType data
#' @usage data(pesada_novillos)
#' @format
#' A data frame with 1842 rows and 13 columns:
#' \describe{
#'   \item{IDV}{código de identificación visual (caravana)}
#'   \item{Tropa}{número de tropa al que pertenece.}
#'   \item{Procedencia}{nombre del establecimiento del cual proviene.}
#'   \item{Fecha_Ingreso}{fecha de ingreso al sistema de engorde.}
#'   \item{Peso_inicial}{peso al ingresar al sistema de engorde.}
#'   \item{Peso_anterior}{peso registrado en la pesada anterior.}
#'   \item{GPV_anterior}{ganancia de peso vivo en la ultima pesada, i.e. diferencia de peso entre las últimas dos pesadas.}
#'   \item{GDM_anterior}{ganancia de peso diaria promedio anterior}
#'   \item{Fecha}{fecha de la pesada actual (MM/DD/YYYY)}
#'   \item{Hora}{hora en la que se realizó la pesada actual (HH:MM:SS)}
#'   \item{Peso}{peso actual registrado en kg.}
#'   \item{Días}{número de días entre la pesada anterior y la actual.}
#'   \item{Días_total}{número de dias desde el ingreso al sistema.}
#' }
#' @source Gentileza Ing. Agr. Marcón
"pesada_novillos"

# 4 tambos_2008_2015----
#' Datos sobre numero de establecimientos lecheros y composición de rodeo en la provincia de Santa Fe durante el período 2008-2015.
#' @docType data
#' @usage data(tambos_2008_2015)
#' @format
#' A data frame with 152 rows and 10 columns:
#' \describe{
#'   \item{Departamento}{nombre del departamento}
#'   \item{Establecimientos}{número de establecimientos tamberos.}
#'   \item{Vacas, Vaquillonas, Toros, Terneros, Terneras, Novillos, Novillitos}{número de cabezas según categoría}
#'   \item{Año}{año de la serie}
#' }
#' @source Instituto Provincial de Estadísticas y Censos (IPEC)
"tambos_2008_2015"

# 5 Lotes_BA----
#' Datos de fertilidad 0-15 y 15-30 cm de Argiudoles en 39 pares de lotes y  bajo alambrado del departamento Las Colonias.
#' @docType data
#' @usage data(lotes_BA)
#' @format
#' A data frame with 156 rows and 15 columns:
#' * `Id_lote`: código identificador del par lote-bajo alambrado
#' * `Id_muestra`: identificador interno del número de muestra
#' * `lat`, `long`: coordenadas geográficas
#' * `Prof`: profundidad en cm
#' * `Condicion`: uso de la tierra
#' * `MO`: materia orgánica en %
#' * `P`: fósforo disponible en ppm
#' * `Nt`: nitrógeno total en %
#' * `pH_actual`: acidez actual
#' * `Ca`, `Mg`, `K`, `Na`: Cationes de intercambio en \eqn{cmol~c~100g^{-1}}
#' * `CIC`: capacidad de intercambio catiónico en \eqn{cmol~c~100g^{-1}}
#' @source Dra. Carrizo
"lotes_BA"

# 6 riesgo_arbolado----
#' Datos de un relevamiento de 677 arboles de la vía pública de la ciudad de Rafaela para la determinación de riesgo según la metodología de la Sociedad Internacional de Arboricultura (ISA).
#' @docType data
#' @usage data(riesgo_arbolado)
#' @format
#' A data frame with 677 rows and 9 columns:
#' \describe{
#'   \item{Especie}{género y especie del árbol}
#'   \item{DAP}{diámetro a la altura del pecho (en cm)}
#'   \item{asim_copa}{asimetría de la copa}
#'   \item{dom_copa}{dominancia de la copa}
#'   \item{cazuela}{tamaño de la cazuela o cantero donde está plantado el árbol}
#'   \item{DC}{daño más importante en la corona.}
#'   \item{DT}{daño más importante en el tronco.}
#'   \item{DR}{daño más importante en las ramas.}
#'   \item{riesgo}{nivel de riesgo según escala ISA, resulta de la adición de tres componentes:
#'   (1) potencial de ruptura,
#'   (2) tamaño de la parte comprometida, y
#'   (3) objetivo sobre el cual puede caer.
#'   Cada componente va de 1 a 4, entonces el riesgo puede tomar valores entre 3 (bajo) y 12 (alto).}
#' }
#' @source Dr. Castro
"riesgo_arbolado"
