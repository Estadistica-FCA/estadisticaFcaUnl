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
#'   * `Departamento`: nombre del departamento.
#'   * `Cant_EAP`: número de explotaciones agropecuarias.
#'   * `Sup_promedio`: superficie promedio de las explotaciones agropecuarias (en ha).
#' @source Instituto Nacional de Estadísticas y Censos
"superficies_EAP"

# 3 pesada_novillos----
#' Datos del pesaje de dos tropas de novillos extraídos del sistema de registros del establecimiento "La Escondida S.A."
#' @docType data
#' @usage data(pesada_novillos)
#' @format
#' A data frame with 1842 rows and 13 columns:
#'   * `IDV`: código de identificación visual (caravana)
#'   * `Tropa`: número de tropa al que pertenece.
#'   * `Procedencia`: nombre del establecimiento del cual proviene.
#'   * `Fecha_Ingreso`: fecha de ingreso al sistema de engorde.
#'   * `Peso_inicial`: peso al ingresar al sistema de engorde.
#'   * `Peso_anterior`: peso registrado en la pesada anterior.
#'   * `GPV_anterior`: ganancia de peso vivo en la ultima pesada, i.e. diferencia de peso entre las últimas dos pesadas.
#'   * `GDM_anterior`: ganancia de peso diaria promedio anterior
#'   * `Fecha`: fecha de la pesada actual (MM/DD/YYYY)
#'   * `Hora`: hora en la que se realizó la pesada actual (HH:MM:SS)
#'   * `Peso`: peso actual registrado en kg.
#'   * `Dias`: número de días entre la pesada anterior y la actual.
#'   * `Dias_total`: número de dias desde el ingreso al sistema.
#' @source Gentileza Ing. Agr. Marcón
"pesada_novillos"

# 4 tambos_2008_2015----
#' Datos sobre numero de establecimientos lecheros y composición de rodeo en la provincia de Santa Fe durante el período 2008-2015.
#' @docType data
#' @usage data(tambos_2008_2015)
#' @format
#' A data frame with 152 rows and 10 columns:
#'   * `Departamento`: nombre del departamento
#'   * `Establecimientos`: número de establecimientos tamberos.
#'   * `Vacas, Vaquillonas, Toros, Terneros, Terneras, Novillos, Novillitos`: número de cabezas según categoría
#'   * `Año`: año de la serie
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
#'   * `Especie`: género y especie del árbol
#'   * `DAP`: diámetro a la altura del pecho (en cm)
#'   * `asim_copa`: asimetría de la copa
#'   * `dom_copa`: dominancia de la copa
#'   * `cazuela`: tamaño de la cazuela o cantero donde está plantado el árbol
#'   * `DC`: daño más importante en la corona.
#'   * `DT`: daño más importante en el tronco.
#'   * `DR`: daño más importante en las ramas.
#'   * `riesgo`: nivel de riesgo según escala ISA, resulta de la adición de tres componentes:
#'   (1) potencial de ruptura,
#'   (2) tamaño de la parte comprometida, y
#'   (3) objetivo sobre el cual puede caer.
#'   Cada componente va de 1 a 4, entonces el riesgo puede tomar valores entre 3 (bajo) y 12 (alto).
#' @source Dr. Castro
"riesgo_arbolado"

# 7 ryegrass----
#' @title Longitud de espigas de Ryegrass
#' @description
#' En un estudio de mejoramiento se midió la longitud de 75 espigas de ryegrass.
#' @details
#' La variable en estudio es la longitud de espigas (cm).
#' @docType data
#' @usage data(ryegrass)
#' @format A data frame with 75 rows and 2 columns:
#'   * `planta`: número de planta
#'   * `longitud`: Longitud de la espiga en cm
"ryegrass"

# 8 tribolium----
#' @title Pérdida de agua en Tribolium confusum
#' @description
#' Estudio de pérdida de agua en el coleóptero de la harina (*Tribolium confusum*).
#' @details
#' Se pesaron 9 lotes de 25 coleópteros cada uno, se guardaron a diferente humedad relativa y se pesaron nuevamente a los 6 días. Se calculó la pérdida de peso (mg) para cada lote.
#' @docType data
#' @usage data(tribolium)
#' @format A data frame with 9 rows and 2 columns:
#'   * `Humedad`: Humedad relativa (%)
#'   * `Perdida`: Pérdida de peso (mg)
"tribolium"

# 9 lisina_pollos----
#' @title Suplementación con Lisina en pollos
#' @description
#' Experimento para modelar la relación entre la ganancia de peso en pollos cuyas dietas fueron suplementadas con distintas cantidades de lisina.
#' @details
#' Se seleccionó una muestra aleatoria de 12 pollos los cuales fueron alojados en jaulas individuales y alimentados a voluntad con el alimento más el suplemento.
#' @docType data
#' @usage data(lisina_pollos)
#' @format A data frame with 12 rows and 3 columns:
#'   * `Pollo`: Identificador del pollo
#'   * `Consumo`: Consumo de alimento
#'   * `Lisina`: Cantidad de lisina consumida (g)
"lisina_pollos"

# 10 productores----
#' @title Producción de lotes por grupo de productores
#' @description
#' Datos de 320 lotes clasificados por producción de tres grupos de productores (A, B y C). Las clasificaciones se realizaron según el nivel de la producción de cada lote (Alto, Medio y Bajo).
#' @docType data
#' @usage data(productores)
#' @format A data frame with 320 rows and 3 columns:
#'   * `Nivel_Produccion`: Nivel de producción del lote (Alto, Medio, Bajo)
#'   * `Grupo`: Grupo de productores (A, B, C)
#'   * `Lotes`: Cantidad de lotes (frecuencia)
"productores"

# 11 especies----
#' @title Especies
#' @description
#' Datos de cantidad de hojas sanas y enfermas según especie.
#' @docType data
#' @usage data(especies)
#' @format A data frame with 6 rows and 3 columns:
#'   * `Especie`: Especie
#'   * `Hojas`: Estado de las hojas (sanas, enfermas)
#'   * `Numero`: Número de ejemplares
"especies"

# 12 plantacion----
#' @title Altura de ejemplares de Eucalyptus
#' @description
#' Datos de altura en metros de una muestra de 10 ejemplares de árboles _Eucalyptus_ en su segundo año de plantación de un predio de San Agustín (Santa Fe).
#' @docType data
#' @usage data(plantacion)
#' @format A data frame with 10 rows and 1 column:
#'   * `altura`: Altura del árbol en metros
"plantacion"

# 13 plantacion_dap----
#' @title Diámetro a la altura del pecho de ejemplares de Eucalyptus
#' @description
#' Datos de DAP (diámetro a la altura del pecho) expresados en centímetros de los árboles de la plantación de _Eucalyptus_ de San Agustín (Santa Fe) en su segundo año.
#' @docType data
#' @usage data(plantacion_dap)
#' @format A data frame with 10 rows and 1 column:
#'   * `dap`: Diámetro a la altura del pecho en centímetros
"plantacion_dap"

# 14 pulsaciones_caballos----
#' @title Pulsaciones del corazón de caballos de carrera
#' @description
#' Datos de pulsaciones del corazón por minuto de una muestra de 15 caballos de carrera registrados en un estudio.
#' @docType data
#' @usage data(pulsaciones_caballos)
#' @format A data frame with 15 rows and 1 column:
#'   * `pulsaciones`: Pulsaciones del corazón por minuto (latidos por minuto)
"pulsaciones_caballos"

# 15 molinos----
#' @title Resistencia al viento en torres de molinos
#' @description
#' Datos de resistencia al viento (en km/h) de una muestra aleatoria de 15 torres de molinos sometidas a pruebas de viento.
#' @details
#' Una empresa mayorista solicita al fabricante torres de molinos que puedan soportar vientos de 80 \eqn{km~h^{-1}}. La misma quiere determinar si las torres se ajustan a estas especificaciones solicitadas, para lo cual selecciona una muestra aleatoria de 15 molinos y los somete a pruebas de viento.
#' @docType data
#' @usage data(molinos)
#' @format A data frame with 15 rows and 1 column:
#'   * `km_h`: velocidad del viento (en km/h) soportada por la torre
"molinos"

# 16 alimento----
#' @title Contenido vitamínico en alimento animal
#' @description
#' Datos del contenido de vitaminas (por cada 100 g) en una muestra de 16 animales alimentados con cierto alimento.
#' @details
#' Un nutricionista animal desea estimar el contenido vitamínico de cierto alimento. Toma una muestra de 16 animales y registra los contenidos de vitaminas por cada 100 g.
#' @docType data
#' @usage data(alimento)
#' @format A data frame with 16 rows and 1 column:
#'   * `vitaminas`: contenido de vitaminas por cada 100 g
"alimento"

# 17 maiz----
#' @title Densidad de plantas en lote de maíz
#' @description
#' Datos de frecuencia del número de plantas por metro cuadrado nacidas en sectores dentro de un lote de maíz.
#' @details
#' Las observaciones corresponden al número de plantas \eqn{m^{-2}} nacidas en 20 sectores dentro de un lote de maíz.
#' @docType data
#' @usage data(maiz)
#' @format A data frame with 6 rows and 2 columns:
#'   * `plantas`: número de plantas por metro cuadrado
#'   * `parcelas`: cantidad de sectores (frecuencia)
"maiz"

# 18 corderos----
#' @title Peso de corderos
#' @description
#' Datos de pesos en kilogramos de una muestra de 20 corderos.
#' @details
#' Una muestra de 20 corderos indica los pesos en kg.
#' @docType data
#' @usage data(corderos)
#' @format A data frame with 20 rows and 1 column:
#'   * `peso`: peso en kilogramos
"corderos"

# 19 sorgo----
#' @title Altura de plantas de sorgo forrajero
#' @description
#' Datos de alturas de una muestra de 16 plantas de sorgo forrajero.
#' @details
#' Las siguientes son las alturas de una muestra de 16 plantas de sorgo forrajero.
#' @docType data
#' @usage data(sorgo)
#' @format A data frame with 16 rows and 1 column:
#'   * `altura`: altura de la planta (en metros)
"sorgo"

# 20 ovejas----
#' @title Ganancia en peso de ovejas
#' @description
#' Datos de ganancia en peso (en kg) de una muestra de 25 ovejas sometidas a una ración alimenticia durante un cierto período.
#' @details
#' La ganancia en peso de 25 ovejas sometidas a una ración alimenticia durante un cierto período fue registrada en este set de datos.
#' @docType data
#' @usage data(ovejas)
#' @format A data frame with 25 rows and 1 column:
#'   * `peso`: ganancia en peso (en kilogramos)
"ovejas"

# 21 balanceado_cerdos----
#' @title Aumento de peso en cerdos con alimento balanceado
#' @description
#' Datos de aumentos de peso (en gramos) de una muestra de 20 cerdos tomados al azar para evaluar la afirmación de un fabricante sobre su alimento balanceado.
#' @details
#' Un fabricante dedicado a la elaboración de alimento balanceado para cerdos afirma que su producto aumenta el peso promedio en 200 gr. En una muestra de 20 cerdos tomados al azar se obtuvieron los siguientes aumentos de peso (en gramos).
#' @docType data
#' @usage data(balanceado_cerdos)
#' @format A data frame with 20 rows and 1 column:
#'   * `aumento`: aumento de peso en gramos
"balanceado_cerdos"

# 22 pezoneras----
#' @title Duración de pezoneras de ordeño
#' @description
#' Datos de duración (en horas) de una muestra de 20 pezoneras de ordeño, utilizados para evaluar la afirmación del fabricante sobre su vida útil media.
#' @details
#' Un fabricante de pezoneras sostiene que la duración media de las mismas es superior a 1400 h. Se tomó una muestra de 20 pezoneras y se detalla su duración en este set de datos.
#' @docType data
#' @usage data(pezoneras)
#' @format A data frame with 20 rows and 1 column:
#'   * `duracion`: duración de la pezonera en horas
"pezoneras"

# 23 establecimientos----
#' @title Superficie de establecimientos agropecuarios
#' @description
#' Datos de superficie (en hectáreas) de una muestra de 12 establecimientos agropecuarios de una región.
#' @details
#' Un estudio económico desea probar si la superficie media de los establecimientos de una región es mayor a 135 ha. Para ello se tomó una muestra de 12 establecimientos agropecuarios y se obtuvieron los siguientes datos de superficie en ha.
#' @docType data
#' @usage data(establecimientos)
#' @format A data frame with 12 rows and 1 column:
#'   * `superficie`: superficie del establecimiento en hectáreas (ha)
"establecimientos"

# 24 neumaticos_tractores----
#' @title Duración de neumáticos de tractores
#' @description
#' Datos de duración (en miles de kilómetros) de una muestra de 15 neumáticos de tractores sometidos a un ensayo.
#' @details
#' Un fabricante de neumáticos de tractores mide en miles de km la duración de los mismos. En un ensayo de 15 neumáticos la duración de los mismos fue registrada en este set de datos.
#' @docType data
#' @usage data(neumaticos_tractores)
#' @format A data frame with 15 rows and 1 column:
#'   * `duracion`: duración del neumático en miles de kilómetros (mil km)
"neumaticos_tractores"

# 25 glifosato----
#' @title Peso de empaque de cajas de Glifosato
#' @description
#' Datos de peso de empaques de cajas de Glifosato (herbicida granulado soluble) registrados para diferentes meses y envases, utilizados para control de calidad.
#' @details
#' Datos correspondientes a mediciones de control de calidad del peso de empaque para cajas de Glifosato (un herbicida granulado soluble que se comercializa en paquetes de 15 kg). Incluye registros de múltiples meses y envases con el objetivo de evaluar el funcionamiento de la maquinaria de empaque y controlar la variabilidad y desviaciones en los pesos de carga de los envases.
#' @docType data
#' @usage data(glifosato)
#' @format A data frame with 1150 rows and 3 columns:
#'   * `Mes`: mes de registro del empaque (ej. "enero", "febrero", etc.)
#'   * `Envase`: identificador numérico de la caja/envase
#'   * `Peso`: peso del empaque en kilogramos (kg)
"glifosato"

# 26 barrenador----
#' @title Eficacia de insecticida para control de barrenador del brote de soja
#' @description
#' Datos sobre el control del barrenador del brote de soja (_Epinotia aporema_) tras la aplicación de un insecticida en dos lotes de cultivo.
#' @details
#' Datos correspondientes a un experimento realizado para evaluar la eficacia de un insecticida destinado al control del barrenador del brote de soja (_Epinotia aporema_). Se seleccionaron plantas afectadas por la plaga en dos lotes experimentales diferentes (Lote 1 y Lote 2) y se les aplicó la dosis de producto recomendada, registrando de forma binaria si la plaga fue controlada eficazmente en cada planta.
#' @docType data
#' @usage data(barrenador)
#' @format A data frame with 2050 rows and 3 columns:
#'   * `Muestra`: identificador numérico de la planta (muestra)
#'   * `Control`: si la plaga fue controlada ("si", "no")
#'   * `Lote`: identificador del lote experimental (1 o 2)
"barrenador"

# 27 penetrometro----
#' @title Resistencia mecánica a la penetración de suelo
#' @description
#' Datos de resistencia mecánica a la penetración (RP) en megapascales (MPa) medidos en muestras de suelo en diferentes momentos relativos a una labor de labranza.
#' @details
#' Datos correspondientes a mediciones de resistencia mecánica a la penetración (RP) de un suelo, expresadas en megapascales (MPa). La resistencia mecánica es una propiedad del suelo crítica para el desarrollo radical, existiendo un umbral de 2 MPa que puede limitar el cultivo y requerir labranza. El set de datos incluye determinaciones de RP en diferentes muestras (ubicaciones) tomadas antes y después de realizar una labor de labranza vertical.
#' @docType data
#' @usage data(penetrometro)
#' @format A data frame with 2000 rows and 3 columns:
#'   * `Muestra`: identificador numérico del punto de muestreo
#'   * `RP`: resistencia mecánica a la penetración (en megapascales, MPa)
#'   * `momento`: momento del muestreo en relación a la labranza ("antes", "despues")
"penetrometro"

# 28 TRC----
#' @title Tasa de recuperación cardíaca (TRC)
#' @description
#' Datos de tasa de recuperación cardíaca (TRC) medida a través del tiempo registrado en una carrera de 2.5 km en dos grupos de participantes hombres.
#' @details
#' Los participantes de un programa de salud miden su progreso mediante el tiempo que les toma correr determinada distancia. Un índice del progreso lo constituye la tasa de recuperación cardíaca (TRC). Los datos corresponden a tiempos (minutos y segundos) registrados para una carrera de 2.5 km. Los participantes pertenecen a dos grupos etarios: hombres entre 40 y 49 años (Grupo 1) y hombres entre 50 y 59 años (Grupo 2).
#' @docType data
#' @usage data(TRC)
#' @format A data frame with 22 rows and 3 columns:
#'   * `individuo`: identificador numérico del participante
#'   * `Grupo`: grupo etario del participante ("1: 40-49 años", "2: 50-59 años")
#'   * `TRC`: tasa de recuperación cardíaca medida en tiempo (minutos y segundos, expresados decimalmente)
"TRC"

# 29 concentracion_insecticida----
#' @title Comparación de métodos de estimación de concentración de insecticida
#' @description
#' Datos de concentraciones medidas con dos métodos rápidos en 10 dosis preparadas en laboratorio, con el fin de comparar ambos métodos.
#' @details
#' Se quiere comparar dos métodos rápidos para estimar la concentración de un principio activo en un insecticida. Se preparan 10 dosis en el laboratorio y se mide la concentración de cada una con ambos métodos (A y B).
#' @docType data
#' @usage data(concentracion_insecticida)
#' @format A data frame with 20 rows and 2 columns:
#'   * `metodo`: método de medición utilizado ("A" o "B")
#'   * `concentracion`: concentración estimada del principio activo
"concentracion_insecticida"

# 30 neumaticos----
#' @title Comparación de duración de neumáticos de camiones
#' @description
#' Datos de duración (en miles de kilómetros) de dos marcas de neumáticos (A y B) probadas hasta el desgaste para camiones de una cooperativa agrícola.
#' @details
#' Una cooperativa agrícola debe decidir cuál de dos tipos de neumáticos (A y B) va a comprar para sus camiones. Los neumáticos se prueban bajo condiciones semejantes hasta que se desgastan. Se emplean 15 de cada marca, registrándose la duración en miles de km.
#' @docType data
#' @usage data(neumaticos)
#' @format A data frame with 30 rows and 3 columns:
#'   * `neumatico`: identificador numérico de la muestra de neumático
#'   * `marca`: marca/tipo del neumático ("A" o "B")
#'   * `duracion`: duración del neumático en miles de kilómetros (mil km)
"neumaticos"

# 31 peso_balanceado----
#' @title Pesos de bolsas de alimento balanceado para cerdos
#' @description
#' Datos de pesos netos (en kg) de bolsas de alimento balanceado para cerdos tomadas en dos días de producción.
#' @details
#' Se sabe que una máquina de empacar balanceado para cerdos vierte el balanceado en bolsas de 20 kg, con una desviación estándar de 3.8 kg. Se llevan a cabo verificaciones constantes de los pesos netos de las bolsas para mantener el ajuste de la maquinaria que controla el peso. Dos muestras tomadas en dos días presentan la información registrada en este set de datos.
#' @docType data
#' @usage data(peso_balanceado)
#' @format A data frame with 55 rows and 3 columns:
#'   * `muestra`: identificador numérico de la bolsa (muestra)
#'   * `dia`: día en que se tomó la muestra ("muestra1" o "muestra2")
#'   * `peso`: peso neto de la bolsa de alimento balanceado (en kg)
"peso_balanceado"

# 32 raciones----
#' @title Ganancia diaria de peso en novillos por tipo de ración
#' @description
#' Datos de ganancia de peso diaria promedio por animal (en kg) en novillos sometidos a dos raciones alimenticias diferentes (A y B).
#' @details
#' En un ensayo de engorde de novillos se utilizaron dos raciones (A y B) en dos lotes de 12 animales cada uno. La variable respuesta fue la ganancia de peso por animal por día (kg). Por información previa se consideró que las varianzas poblacionales eran iguales, con un valor de 0.65.
#' @docType data
#' @usage data(raciones)
#' @format A data frame with 24 rows and 3 columns:
#'   * `novillo`: identificador numérico del animal
#'   * `racion`: ración alimenticia suministrada ("1" o "2", correspondientes a A y B)
#'   * `peso`: ganancia diaria de peso por animal (en kg/día)
"raciones"

# 33 cerdos----
#' @title Ganancia de peso en cerdos según tipo de alimentación
#' @description
#' Datos de ganancia en peso (en kg) de cerdos sometidos a dos tipos de alimentación diferentes (D y M).
#' @details
#' En un ensayo de engorde de cerdos se utilizaron dos tipos de alimentación diferentes, D y M, en dos lotes de 8 cerdos. Al mes de iniciado el ensayo se registró la ganancia en peso (kg) por animal.
#' @docType data
#' @usage data(cerdos)
#' @format A data frame with 16 rows and 3 columns:
#'   * `cerdo`: identificador numérico del animal
#'   * `alimento`: tipo de alimentación suministrada ("alim_d" o "alim_m")
#'   * `ganancia`: ganancia en peso al mes de iniciado el ensayo (en kg)
"cerdos"

# 34 ganancia_novillos----
#' @title Ganancia de peso en novillos Holando con suplementación mineral
#' @description
#' Datos de ganancia de peso (en kg) de novillos de raza Holando sometidos a un tratamiento con suplementación mineral o placebo.
#' @details
#' Se realizó un ensayo con novillos de raza Holando. A un grupo de animales se le dio un mineral y al otro grupo un placebo. Se detalla la ganancia de peso (kg) acumulada por cada animal durante el ensayo.
#' @docType data
#' @usage data(ganancia_novillos)
#' @format A data frame with 28 rows and 3 columns:
#'   * `novillo`: identificador numérico del animal
#'   * `tratamiento`: tipo de tratamiento recibido ("Placebo" o "Mineral")
#'   * `ganancia`: ganancia de peso registrada (en kg)
"ganancia_novillos"

# 35 N_suelo----
#' @title Contenido de nitrógeno nítrico en suelos
#' @description
#' Datos de contenido de nitrógeno nítrico (N-NO3) en partes por millón (ppm) para dos tipos de suelos (Bueno y Pobre) del norte de la provincia de Santa Fe.
#' @details
#' El contenido de N-NO3 (ppm) en diferentes suelos del norte de la provincia de Santa Fe fue medido y clasificado según el tipo de suelo (Bueno y Pobre).
#' @docType data
#' @usage data(N_suelo)
#' @format A data frame with 50 rows and 3 columns:
#'   * `suelo`: identificador numérico de la muestra de suelo
#'   * `tipo`: tipo o calidad del suelo ("Bueno" o "Pobre")
#'   * `ppm`: contenido de nitrógeno nítrico (en partes por millón, ppm)
"N_suelo"

# 36 efectividad_sembradora----
#' @title Comparación de rendimiento por tipo de máquina sembradora
#' @description
#' Datos de rendimiento (en kg por parcela) obtenidos al comparar una máquina sembradora nueva con una tradicional.
#' @details
#' Para contrastar la efectividad del uso de una nueva máquina sembradora con respecto a una tradicional se seleccionaron 10 parcelas. Cada una de ellas se dividió en dos sectores, asignándose al azar a cada uno de los mismos las distintas máquinas, utilizando el mismo cultivo. El rendimiento en kg/parcela se detalla en este set de datos.
#' @docType data
#' @usage data(efectividad_sembradora)
#' @format A data frame with 20 rows and 3 columns:
#'   * `parcelas`: identificador numérico de la parcela
#'   * `maquina`: tipo de sembradora utilizada ("nueva" o "vieja")
#'   * `rendimiento`: rendimiento del cultivo obtenido (en kg/parcela)
"efectividad_sembradora"

# 37 lesiones_hojas----
#' @title Lesiones virales en hojas de tabaco
#' @description
#' Datos sobre la cantidad de lesiones provocadas artificialmente en hojas de tabaco por dos preparados con distintas concentraciones de un virus.
#' @details
#' En un ensayo se comparó la cantidad de lesiones provocadas en hojas de tabaco por dos concentraciones de un virus. Se seleccionaron 8 pares de hojas (un par de hojas por planta). A cada hoja del par se le aplicó uno de los preparados (prep1 o prep2) y se midió el número de lesiones provocadas artificialmente.
#' @docType data
#' @usage data(lesiones_hojas)
#' @format A data frame with 16 rows and 3 columns:
#'   * `id`: identificador numérico de la planta (par de hojas)
#'   * `preparado`: tipo de preparado del virus aplicado ("prep1" o "prep2")
#'   * `lesiones`: número de lesiones provocadas en la hoja
"lesiones_hojas"

# 38 dieta_bufalos----
#' @title Pérdida de peso en búfalos bajo dieta hipocalórica
#' @description
#' Datos de peso (en kg) medidos en 10 búfalos antes y después de ser sometidos a una dieta hipocalórica.
#' @details
#' Se estudió el efecto en la pérdida de peso (kg) en 10 búfalos sometidos a una dieta hipocalórica. Los datos registran el peso de cada animal en el momento inicial y en el momento final del tratamiento.
#' @docType data
#' @usage data(dieta_bufalos)
#' @format A data frame with 20 rows and 3 columns:
#'   * `animal`: identificador del búfalo
#'   * `tratamiento`: momento del registro del peso ("inicial" o "final")
#'   * `perdida`: peso del animal registrado (en kg, cuya diferencia representa la pérdida de peso)
"dieta_bufalos"

# 39 colesterol----
#' @title Nivel de colesterol en sangre por tipo de dieta
#' @description
#' Datos del nivel de colesterol en sangre (mg/dl) de pacientes bajo dos tipos de dietas: baja en grasa y normal.
#' @details
#' Se compara el nivel de colesterol en la sangre (mg/dl) de pacientes seleccionados al azar y sometidos a dos dietas distintas, una baja en grasa y otra normal.
#' @docType data
#' @usage data(colesterol)
#' @format A data frame with 43 rows and 3 columns:
#'   * `paciente`: identificador numérico del paciente
#'   * `tratamiento`: tipo de dieta seguida ("baja_grasa" o "normal")
#'   * `colesterol`: nivel de colesterol medido en sangre (mg/dl)
"colesterol"

# 40 MS_girasol----
#' @title Porcentaje de materia seca en plantas de girasol
#' @description
#' Datos del porcentaje de materia seca en plantas normales y anormales de un cultivo de girasol.
#' @details
#' En un cultivo de girasol se seleccionaron 30 plantas al azar de las cuales 16 eran normales y 14 anormales. Los porcentajes de materia seca para cada grupo fueron registrados en este set de datos.
#' @docType data
#' @usage data(MS_girasol)
#' @format A data frame with 30 rows and 3 columns:
#'   * `plantas`: identificador de la planta
#'   * `grupo`: clasificación de la planta ("Normales" o "Anormales")
#'   * `MS`: porcentaje de materia seca de la planta (%)
"MS_girasol"

# 41 dietas_pollos----
#' @title Ganancia de peso en pollos por ración de alimento
#' @description
#' Datos de ganancia de peso (en kg) de 8 pares de pollos idénticos alimentados con ración tradicional o ración especial.
#' @details
#' Se buscaron 8 pares de pollos idénticos en cuanto a peso, raza y sexo. A un lote se le suministró por 15 días el alimento tradicional y al otro lote una ración especial. Se detalla la ganancia de peso de cada animal al finalizar el periodo.
#' @docType data
#' @usage data(dietas_pollos)
#' @format A data frame with 16 rows and 3 columns:
#'   * `pollo`: identificador numérico de la pareja de pollos
#'   * `dieta`: tipo de ración de alimento suministrada ("Tradicional" o "Especial")
#'   * `ganancia`: ganancia de peso registrada (en kg)
"dietas_pollos"

# 42 germinacion----
#' @title Pruebas de germinación con tratamientos químicos
#' @description
#' Datos sobre los resultados de germinación en semillas sometidas a tres tratamientos químicos diferentes.
#' @details
#' Un experimentador efectuó pruebas de germinación de tres tratamientos químicos aplicados a cada una de 200 semillas elegidas al azar.
#' @docType data
#' @usage data(germinacion)
#' @format A data frame with 6 rows and 3 columns:
#'   * `Trat`: tratamiento químico aplicado ("A", "B", "C")
#'   * `Germinado`: estado de germinación de la semilla ("si", "no")
#'   * `semillas`: cantidad de semillas (frecuencia)
"germinacion"

# 43 algodon----
#' @title Clasificación de plantas de algodón por color de corola y forma de hoja
#' @description
#' Frecuencias de clasificación de 1282 plantas de algodón según el color de la corola y la forma de la hoja.
#' @details
#' La tabla da la clasificación de 1282 plantas de algodón según el color de la corola y la forma de la hoja, utilizada para evaluar si existe asociación entre ambas características.
#' @docType data
#' @usage data(algodon)
#' @format A data frame with 4 rows and 3 columns:
#'   * `corola`: color de la corola de la planta ("amarilla", "blanca")
#'   * `hoja`: forma de la hoja de la planta ("ancha", "angosta")
#'   * `frec`: cantidad de plantas observadas (frecuencia)
"algodon"

# 44 educacion----
#' @title Permanencia de estudiantes universitarios por estado civil
#' @description
#' Frecuencias de estudiantes universitarios según su estado civil y su permanencia en el establecimiento educacional tres años más tarde del ingreso.
#' @details
#' Los datos corresponden al número de estudiantes universitarios hombres, casados y solteros, que aún estaban en el establecimiento educacional tres años más tarde del ingreso. Diseñado para contrastar si la proporción difiere entre grupos.
#' @docType data
#' @usage data(educacion)
#' @format A data frame with 4 rows and 3 columns:
#'   * `momento`: momento del registro ("ingreso", "3er_año")
#'   * `casado`: estado civil casado ("si", "no")
#'   * `frec`: cantidad de estudiantes (frecuencia)
"educacion"

# 45 semilla----
#' @title Variación en la forma de la semilla de plantas de Mendel
#' @description
#' Resultados de variación de planta a planta en la forma de la semilla (redonda o angular) en las primeras diez plantas de un estudio clásico de Mendel.
#' @details
#' Mendel, en uno de sus clásicos estudios genéticos, observó la variación de planta a planta en una serie de experimentos sobre la forma de la semilla. Las primeras diez plantas dieron los resultados registrados en este set de datos.
#' @docType data
#' @usage data(semilla)
#' @format A data frame with 10 rows and 2 columns:
#'   * `redonda`: cantidad de semillas con forma redonda obtenidas por planta
#'   * `angular`: cantidad de semillas con forma angular obtenidas por planta
"semilla"

# 46 albumen----
#' @title Variación en el color del albumen de semillas de plantas de Mendel
#' @description
#' Resultados de variación de planta a planta en el color del albumen (amarillo o verde) en diez plantas de un estudio de Mendel.
#' @details
#' Mendel también observó la variación de planta a planta en un experimento sobre el color del albumen de las semillas. Los resultados para diez plantas seleccionadas se registran en este set de datos.
#' @docType data
#' @usage data(albumen)
#' @format A data frame with 10 rows and 2 columns:
#'   * `amarillo`: cantidad de semillas con albumen amarillo obtenidas por planta
#'   * `verde`: cantidad de semillas con albumen verde obtenidas por planta
"albumen"

# 47 insectos----
#' @title Distribución de insectos en plantas
#' @description
#' Distribución de frecuencia del número de insectos observados por planta en una muestra de 400 plantas.
#' @details
#' Datos correspondientes a la distribución del número de insectos en una muestra de 400 plantas de cultivo.
#' @docType data
#' @usage data(insectos)
#' @format A data frame with 6 rows and 2 columns:
#'   * `obs`: número de plantas observadas con la cantidad de insectos correspondiente (frecuencia)
#'   * `insectos`: número de insectos por planta (0 a 5)
"insectos"

# 48 monedas----
#' @title Lanzamiento de cuatro monedas
#' @description
#' Frecuencias observadas del número de caras obtenidas en el lanzamiento simultáneo de 4 monedas repetido 160 veces.
#' @details
#' Distribución de resultados obtenidos al lanzar un grupo de 4 monedas de forma simultánea un total de 160 veces, registrando el número de caras.
#' @docType data
#' @usage data(monedas)
#' @format A data frame with 5 rows and 2 columns:
#'   * `obs`: frecuencia de lanzamientos observados con la cantidad de caras dada
#'   * `caras`: cantidad de caras obtenidas en el lanzamiento (0 a 4)
"monedas"

# 49 capturados----
#' @title Captura de insectos en intervalos de tiempo
#' @description
#' Distribución de frecuencia del número de insectos capturados en un lote durante 1000 intervalos de un minuto.
#' @details
#' El número observado de insectos capturados en un lote en 1000 intervalos de un minuto se describe en esta tabla de frecuencias.
#' @docType data
#' @usage data(capturados)
#' @format A data frame with 6 rows and 2 columns:
#'   * `obs`: cantidad de intervalos observados con el número de insectos correspondiente (frecuencia)
#'   * `insectos`: cantidad de insectos capturados en el intervalo
"capturados"

# 50 susceptibilidad----
#' @title Relación entre largo de semilla y susceptibilidad a roya en trigo
#' @description
#' Frecuencias de cruzamiento en trigo clasificadas según la longitud de la semilla y la susceptibilidad a roya.
#' @details
#' Se realizó una experiencia en trigo a fin de establecer si existe relación entre los caracteres largo de semilla y susceptibilidad a roya. Se obtuvieron los valores para un cruzamiento entre un padre de semilla larga y resistente y otro de semilla corta y susceptible.
#' @docType data
#' @usage data(susceptibilidad)
#' @format A data frame with 6 rows and 3 columns:
#'   * `Roya`: nivel de susceptibilidad/resistencia a la roya ("resistente", "susceptible")
#'   * `largo`: longitud de la semilla ("corto", "medio", "largo")
#'   * `freq`: cantidad de semillas observadas (frecuencia)
"susceptibilidad"

# 51 actividad----
#' @title Actividad predominante de explotaciones agropecuarias
#' @description
#' Frecuencias de la actividad económica predominante de explotaciones agropecuarias en el área rural de cuatro localidades.
#' @details
#' En una encuesta socioeconómica efectuada en el área rural de cuatro localidades se obtuvieron los valores para la variable actividad predominante de la explotación (agrícola, ganadera, etc.).
#' @docType data
#' @usage data(actividad)
#' @format A data frame with 12 rows and 3 columns:
#'   * `actividad`: actividad predominante de la explotación ("Agrícola", "Ganadera", "Mixta")
#'   * `localidad`: localidad del área rural ("A", "B", "C", "D")
#'   * `freq`: cantidad de explotaciones (frecuencia)
"actividad"

# 52 razas----
#' @title Relación entre tipo de parto y raza en vacas lecheras
#' @description
#' Frecuencias observadas de tipo de parto (normal o anormal) según la raza en una muestra de 300 vacas de una cuenca lechera.
#' @details
#' Para estudiar la relación entre el tipo de parto y la raza en vacas lecheras se tomó una muestra de 300 vacas de una cuenca lechera y se las clasificó según dichos atributos.
#' @docType data
#' @usage data(razas)
#' @format A data frame with 6 rows and 3 columns:
#'   * `Tipo`: tipo de parto ("normal" o "anormal")
#'   * `Raza`: raza de la vaca ("Holstein", "Cruza", "Jersey")
#'   * `partos`: número de partos registrados (frecuencia)
"razas"

# 53 semillas----
#' @title Proporción de tamaños de semilla de maíz en tres partidas
#' @description
#' Frecuencias de clasificación por tamaño de semillas de maíz tomadas de tres partidas diferentes.
#' @details
#' Se quiere saber si la proporción de los tamaños de semilla de maíz son similares en 3 partidas de semillas. De cada partida se toma una muestra y se clasifica la semilla según su tamaño en chico, normal y grande.
#' @docType data
#' @usage data(semillas)
#' @format A data frame with 9 rows and 3 columns:
#'   * `Partida`: partida de procedencia de la semilla ("A", "B", "C")
#'   * `Tamaño`: tamaño de la semilla ("grande", "normal", "chico")
#'   * `semillas`: cantidad de semillas (frecuencia)
"semillas"

# 54 arvejas----
#' @title Frecuencias fenotípicas en arvejas de Mendel
#' @description
#' Frecuencias observadas de textura y color en 556 arvejas clasificadas según fenotipo mendeliano.
#' @details
#' En una variedad de arvejas, la textura y color de la semilla se rigen por caracteres mendelianos, siendo "lisas" (L) y "amarillas" (A) fenotipos dominantes, mientras que "rugosas" (R) y "verdes" (V) son recesivos. La proporción teórica del número de arvejas LA, LV, RA y RV es 9:3:3:1. Se clasificaron 556 arvejas según su fenotipo y se obtuvieron los resultados registrados.
#' @docType data
#' @usage data(arvejas)
#' @format A data frame with 4 rows and 2 columns:
#'   * `freq`: cantidad de arvejas observadas (frecuencia)
#'   * `fenotipo`: fenotipo mendeliano observado ("LA", "LV", "RA", "RV")
"arvejas"

# 55 agua_forrajera----
#' @title Relación entre agua aplicada y rendimiento en especie forrajera
#' @description
#' Datos de cantidad de agua aplicada (en cm^3) y el rendimiento resultante de materia seca en una especie forrajera.
#' @details
#' Los datos representan la cantidad de agua aplicada (cm^3) y el rendimiento de una especie forrajera (tn MS/ha), en un establecimiento de la provincia de Santa Fe.
#' @docType data
#' @usage data(agua_forrajera)
#' @format A data frame with 5 rows and 2 columns:
#'   * `agua`: cantidad de agua aplicada (cm^3)
#'   * `MS`: rendimiento de la especie forrajera (tn MS/ha)
"agua_forrajera"

# 56 area_trigo----
#' @title Relación entre tamaño de explotación y área sembrada con trigo
#' @description
#' Datos de una muestra de 12 explotaciones agrícolas que registran el tamaño total de la explotación y el área sembrada con trigo.
#' @details
#' A continuación se detallan los datos de una muestra de 12 explotaciones agrícolas donde se registra el tamaño de las mismas y el área sembrada con trigo (ambas variables en hectáreas o unidades de superficie correspondientes).
#' @docType data
#' @usage data(area_trigo)
#' @format A data frame with 12 rows and 2 columns:
#'   * `sup_total`: superficie o tamaño total de la explotación agrícola
#'   * `sup_trigo`: superficie o área sembrada con trigo
"area_trigo"

# 57 coleoptero----
#' @title Pérdida de agua en coleópteros de la harina
#' @description
#' Datos de pérdida de peso (en mg) en lotes de coleópteros de la harina (\emph{Tribolium confusum}) sometidos a distintas humedades relativas.
#' @details
#' Los datos proceden de un estudio de pérdida de agua en el coleóptero de la harina (\emph{Tribolium confusum}). Se pesaron 9 lotes de 25 coleópteros cada uno, se guardaron a diferente humedad relativa (HR) y se pesaron nuevamente a los 6 días. Se calculó la pérdida de peso (mg) para cada lote.
#' @docType data
#' @usage data(coleoptero)
#' @format A data frame with 9 rows and 2 columns:
#'   * `HR`: humedad relativa a la que fueron expuestos los coleópteros (%)
#'   * `perdida`: pérdida de peso registrada en el lote (mg)
"coleoptero"

# 58 P_maiz----
#' @title Relación de fósforo inicial en suelo y recuperado por plantas de maíz
#' @description
#' Datos de concentraciones de fósforo (P) inorgánico en suelo al inicio del cultivo y la cantidad de fósforo recuperado por plantas de maíz a los 30 días.
#' @details
#' Se realizó un experimento para determinar la relación entre la cantidad de P inorgánico en el suelo (ppm) al inicio del cultivo de maíz y la cantidad de P que es recuperada por la planta (en ppm) a los 30 días. Se prepararon macetas con distintas concentraciones de P inicial, se sembró el mismo híbrido de maíz y luego de 30 días se determinó el contenido de P en la planta.
#' @docType data
#' @usage data(P_maiz)
#' @format A data frame with 9 rows and 2 columns:
#'   * `P_suelo`: cantidad de fósforo inorgánico inicial en el suelo (ppm)
#'   * `P_planta`: cantidad de fósforo recuperado en la planta a los 30 días (ppm)
"P_maiz"

# 59 lluvia_forraje----
#' @title Rendimiento de forraje en relación a la lluvia caída
#' @description
#' Datos de rendimiento de forraje y la lluvia caída durante los meses de julio y agosto en 10 establecimientos elegidos al azar.
#' @details
#' Los datos representan el rendimiento en toneladas de forraje y la lluvia caída en mm durante los meses de julio y agosto en 10 establecimientos elegidos al azar en una determinada región.
#' @docType data
#' @usage data(lluvia_forraje)
#' @format A data frame with 10 rows and 2 columns:
#'   * `rend`: rendimiento de forraje obtenido (toneladas)
#'   * `lluvia`: cantidad de lluvia caída (mm)
"lluvia_forraje"

# 60 hileras_maiz----
#' @title Relación entre peso de espiga y número de hileras en maíz
#' @description
#' Datos de peso de la espiga y el número de hileras de granos correspondientes, medidos en un estudio sobre maíz.
#' @details
#' Un estudio sobre maíz busca determinar la relación entre el peso de la espiga (en gramos u otra unidad de peso) y el número de hileras de grano en la misma.
#' @docType data
#' @usage data(hileras_maiz)
#' @format A data frame with 18 rows and 2 columns:
#'   * `Hileras`: número de hileras de grano en la espiga
#'   * `Peso`: peso de la espiga
"hileras_maiz"

# 61 calificaciones----
#' @title Calificaciones de alumnos en Física y Matemática
#' @description
#' Calificaciones obtenidas en las asignaturas de Física y Matemática en una muestra de 12 alumnos.
#' @details
#' La tabla detalla las calificaciones en Física y Matemática de una muestra de 12 alumnos seleccionados al azar.
#' @docType data
#' @usage data(calificaciones)
#' @format A data frame with 12 rows and 2 columns:
#'   * `Fisica`: calificación obtenida en la asignatura de Física
#'   * `Matematica`: calificación obtenida en la asignatura de Matemática
"calificaciones"

# 62 semilla_trigo----
#' @title Caracteres de semillas de trigo diploide
#' @description
#' Datos de varios caracteres físicos (peso, longitud, diámetro, humedad, dureza) en una muestra de 190 semillas de trigo diploide (\emph{Triticum monococcum}).
#' @details
#' Con el objeto de identificar variables asociadas con las diferencias de peso de semillas de trigo diploide (\emph{Triticum monococcum}), Jing et al. (2007) estudiaron varios caracteres (peso, longitud, diámetro, dureza) de 190 semillas obtenidas al azar.
#' @docType data
#' @usage data(semilla_trigo)
#' @format A data frame with 190 rows and 6 columns:
#'   * `ID`: identificador numérico de la semilla
#'   * `Peso`: peso de la semilla
#'   * `Long`: longitud de la semilla
#'   * `Diametro`: diámetro de la semilla
#'   * `Humedad`: contenido de humedad de la semilla
#'   * `Dureza`: índice de dureza de la semilla
"semilla_trigo"

# 63 huevos----
#' @title Relación entre peso y producción de huevos en langostas
#' @description
#' Datos sobre el peso de hembras de langostas y el número de huevos producidos.
#' @details
#' En un estudio sobre el éxito reproductivo de langostas, un entomólogo busca ajustar y modelar la relación entre el peso de las hembras y el número de huevos que produce. Selecciona 30 langostas de diferentes pesos (en gramos) y registra el número de huevos producidos.
#' @docType data
#' @usage data(huevos)
#' @format A data frame with 30 rows and 2 columns:
#'   * `Huevos`: número de huevos producidos por la hembra
#'   * `Peso`: peso de la hembra de langosta (en gramos)
"huevos"

# 64 pollos----
#' @title Suplementación con Lisina en pollos y ganancia de peso
#' @description
#' Datos de consumo estimado de lisina y ganancia de peso en una muestra de 12 pollos.
#' @details
#' Un investigador condujo un experimento para modelar la relación entre la ganancia de peso en pollos cuyas dietas fueron suplementadas con distintas cantidades de lisina (aminoácido) y la cantidad de lisina consumida. Dado que el porcentaje de lisina del alimento es conocido, la cantidad de lisina consumida se estima a partir de la cantidad de alimento consumida. Se seleccionó una muestra aleatoria de 12 pollos los cuales fueron alojados en jaulas individuales y alimentados a voluntad con el alimento más el suplemento.
#' @docType data
#' @usage data(pollos)
#' @format A data frame with 12 rows and 2 columns:
#'   * `ganancia`: ganancia de peso acumulada del pollo (en gramos)
#'   * `lisina`: cantidad estimada de lisina consumida por el pollo
"pollos"

# 65 fungicida----
#' @title Efectividad de dosis de fungicida para el control de roya en trigo
#' @description
#' Datos del daño remanente (tamaño promedio de manchas en hoja bandera) obtenido al evaluar distintas dosis de un nuevo fungicida contra la roya en trigo.
#' @details
#' Se desea probar la efectividad de un nuevo fungicida para el control de roya en trigo. Se probaron distintas dosis en gramos de principio activo por hectárea (gr.p.a./ha) en 13 parcelas de 100 plantas cada una. A los 15 días de la aplicación se realizó una evaluación del daño, registrada como el tamaño promedio de las manchas en la hoja bandera.
#' @docType data
#' @usage data(fungicida)
#' @format A data frame with 13 rows and 2 columns:
#'   * `Dosis`: dosis de principio activo del fungicida aplicada (gr.p.a./ha)
#'   * `Daño`: daño evaluado como tamaño promedio de las manchas en hoja bandera
"fungicida"

# 66 proteina_caseina----
#' @title Contenido de proteína bruta y caseína en leche
#' @description
#' Contenido de proteína bruta (PB) y caseína (CA) en leche registrado en una muestra de 23 tambos.
#' @details
#' Los datos se refieren al contenido de proteína bruta (PB) y caseína (CA) en leche medido en una muestra de 23 tambos de la cuenca lechera del centro del país.
#' @docType data
#' @usage data(proteina_caseina)
#' @format A data frame with 23 rows and 2 columns:
#'   * `PB`: porcentaje de proteína bruta en leche (%)
#'   * `CA`: porcentaje de caseína en leche (%)
"proteina_caseina"

# 67 dosis_tomate----
#' @title Efecto de dosis de fertilizante en crecimiento de tomate
#' @description
#' Datos de rendimiento de fruto y cantidad de tallos por metro cuadrado registrados en plantas de tomate bajo distintas dosis de fertilizante.
#' @details
#' Se realizó un análisis de crecimiento de tomate en invernadero y se midieron distintas variables como rendimiento de fruto en kg/ha y la cantidad de tallos por m2. Las plantas fueron establecidas en macetas, se utilizó un sistema de riego dirigido y se les aplicaron diferentes dosis de fertilizante. Al momento de la cosecha se contabilizaron los tallos y se pesaron los frutos.
#' @docType data
#' @usage data(dosis_tomate)
#' @format A data frame with 11 rows and 3 columns:
#'   * `dosis`: dosis de fertilizante aplicada (ml/ha)
#'   * `fruto`: rendimiento de fruto obtenido (en miles de kg/ha de peso húmedo)
#'   * `tallo`: número de tallos por metro cuadrado (m2)
"dosis_tomate"

