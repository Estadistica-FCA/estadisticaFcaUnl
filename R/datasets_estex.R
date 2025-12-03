# 1 vitA_vaquillas----
#' @title Vitamina A en vaquillas
#' @description
#'  Efecto de la Vitamina A en el crecimiento de vaquillas Holstein.
#' @details
#'  Se seleccionaron 28 vaquillas de similar peso inicial y edad, las cuales
#'  fueron alimentadas individualmente durante un cierto período. A la mitad de
#'  las vaquillonas se les suministró una dieta sin Vitamina A (control) y al
#'  resto una dieta rica en Vitamina A. La asignación de las dietas fue
#'  completamente al azar.
#'
#'  Al final del ensayo se registró el peso final y se calculó la ganancia
#'  diaria de peso vivo (GDPV) en g/día/animal.
#' @docType data
#' @usage data(vitA_vaquillas)
#' @format
#' A data frame with 28 rows and 2 columns:
#' \describe{
#'   \item{Tratamiento:}{tipo de dieta a la que fué sometida.}
#'   \item{GDPV:}{ganancia diaria de peso vivo (GDPV) en g/día/animal.}
#' }
#' @source --
"vitA_vaquillas"

# 2 dms_ensilaje----
#' @title Digestibilidad de materia seca en ensilaje de maíz
#' @description
#' Ensayo de digestibilidad in vivo realizado para determinar si la
#' digestibilidad de la materia seca (DMS) de ensilaje de maíz es similar en
#' corderos y novillos.
#' @details
#' Se seleccionaron 7 corderos y 6 novillos a los cuales se les suministró el
#' ensilaje y se midió la digestibilidad de lo consumido.
#' @docType data
#' @usage data(dms_ensilaje)
#' @format
#' A data frame with 13 rows and 2 columns:
#' \describe{
#'   \item{Trat:}{tipo de especie a la que se le suministro la dieta (cordero o
#'   novillo).}
#'   \item{DMS:}{digestibilidad de la materia seca en \%.}
#' }
#' @source --
"dms_ensilaje"

# 3 guayule----
#' @title Contenido de caucho en guayule
#' @description
#' El guayule (_Parthenium argentatum_) es una planta arbustiva que se utiliza
#' como fuente alternativa de látex hipoalergénico.
#' @details
#' En un estudio para caracterizar los contenidos de caucho se recolectaron 54
#' ejemplares los cuales se clasificaron en `atípicos` y `aberrantes`.
#'
#' A cada individuo de estos grupos se le midió el contenido de caucho.
#' @docType data
#' @usage data(guayule)
#' @format
#' A data frame with 27 rows and 2 columns:
#' \describe{
#'   \item{Tipo:}{tipo de ejemplar (atípicos o aberrantes).}
#'   \item{caucho:}{contenido de caucho.}
#' }
#' @source --
"guayule"

# 4 ace_codornices----
#' @title Acetil colinesterasa en codornices
#' @description
#' La acetil colinesterasa (ACE) es un indicador de la actividad cerebral.
#' Las codornices son muy susceptibles a un determinado pesticida usado en la
#' producción de algodón ya que cantidades residuales de dicho pesticida produce
#' cambios en su actividad cerebral.
#' @details
#' Para determinar si una nueva formulación disminuye la deriva de este
#' producto, se utilizaron dos grupos de codornices:
#' \describe{
#'   \item{Grupo 1:}{seis codornices expuestas a las condiciones ambientales
#'   antes de la aplicación.}
#'   \item{Grupo 2:}{cuatro codornices expuestas a las condiciones ambientales
#'   luego de la aplicación.}
#' }
#'
#' En ambos grupos se midió los niveles de ACE.
#' @docType data
#' @usage data(ace_codornices)
#' @format
#' A data frame with 10 rows and 2 columns:
#' \describe{
#'   \item{Momento:}{momento en que se expuso las codornices a las condiciones
#'   ambientales (antes o despues).}
#'   \item{ACE:}{nivel de acetil colinesterasa registrado.}
#' }
#' @source --
"ace_codornices"

# 5 nectar_trebol_rojo----
#' @title Néctar en trébol rojo
#' @description
#' Efecto de la presión de vapor en la secreción de néctar de flores de trébol
#' rojo (_Trifolium pratense_).
#' @details
#' Se tomó 10 cabezas (inflorescencias) de trébol rojo y las dividió a la mitad.
#' Cada mitad fue sometida a una presión de vapor (4.4 o 9.9 mmHg) y luego se
#' midió la concentración de azúcares del néctar.
#' @docType data
#' @usage data(nectar_trebol_rojo)
#' @format
#' A data frame with 20 rows and 3 columns:
#' \describe{
#'   \item{Cabeza:}{numero de identificación de la inflorescencia.}
#'   \item{Presion:}{presión de vapor (4.4 o 9.9 mmHg) a la que fué sometida.}
#'   \item{nectar:}{concentración de azúcares del néctar.}
#' }
#' @source --
"nectar_trebol_rojo"

# 6 trebol_rizhobium----
#' @title Incoculación en trébol rojo
#' @description
#' Experimento realizado para evaluar la capacidad de fijación biológica de
#' nitrógeno de plantas de trébol rojo (\emph{Trifolium pratense}) inoculadas con
#' diferentes cepas de bacterias.
#' @details
#' Se evaluaron tres tipos de tratamientos:
#' \describe{
#'   \item{}{- 5 cepas de las bacterias \emph{Rizhobium trifolii}.}
#'   \item{}{- 5 cepas de las bacterias \emph{Rizhobium meliloti}.}
#'   \item{}{- combinación de 5 cepas de \emph{R. trifolii} con 5 cepas de \emph{R. meliloti}.}
#' }
#' Los tratamientos fueron asignados por quintuplicado a macetas donde se dejó
#' crecer una planta de trébol rojo sobre la cual se midió el contenido de N (en mg).
#' @docType data
#' @usage data(trebol_rizhobium)
#' @format
#' A data frame with 30 rows and 2 columns:
#' \describe{
#'   \item{Tratamiento:}{cepa con la que fué inoculada.}
#'   \item{N:}{contenido de nitrogeno (en mg).}
#' }
#' @source --
"trebol_rizhobium"

# 7 dieta_cerdos----
#' @title Efecto de la dieta en cerdos
#' @description
#' Ensayo realizado para evaluar el efecto de 6 dietas en el aumento de peso en
#' kg (AP) de cerdos durante un tiempo determinado.
#' @details
#' Se seleccionaron 30 cerdos de similar peso y edad y cada dieta se suministró
#' individualmente al azar a 5 cerdos.
#'
#' Los ingredientes de las dietas evaluadas fueron:
#' \describe{
#'  \item{}{1. Maíz.}
#'  \item{}{2. Maíz y trigo.}
#'  \item{}{3. Maíz y cebada.}
#'  \item{}{4. Sorgo.}
#'  \item{}{5. Sorgo y trigo.}
#'  \item{}{6. Sorgo y cebada.}
#' }
#' No obstante, durante el experimento algunas de las repeticiones tuvieron que
#' ser descartadas quedaron 26 datos en total.
#' @docType data
#' @usage data(dieta_cerdos)
#' @format
#' A data frame with 26 rows and 2 columns:
#' \describe{
#'   \item{D:}{tipo de dieta suministrada.}
#'   \item{AP:}{aumento de peso en kg (AP).}
#' }
#' @source --
"dieta_cerdos"

# 8 caballos----
#' @title Medicamentos en caballos de carrera
#' @description
#' Respuesta de caballos de carrera a 3 medicamentos alternativos.
#' @details
#' Para el experimento se utilizaron 12 caballos de características similares
#' (edad, velocidad, sanidad). Los medicamentos evaluados se suministraron por
#' triplicado de manera individual dejando un grupo de animales testigo sin medicar.
#'
#' La respuesta se midió registrando los tiempos (TI) en segundos empleados en
#' una corrida de 300 metros en pista normal.
#' @docType data
#' @usage data(caballos)
#' @format
#' A data frame with 12 rows and 2 columns:
#' \describe{
#'   \item{TR:}{tipo de medicamento suministrado.}
#'   \item{TI:}{tiempo registrado en segundos.}
#' }
#' @source --
"caballos"

# 9 tomate----
#' @title Crecimiento de tejido de tomate
#' @description
#' Experimento realizado para evaluar el crecimiento de secciones de tejido de
#' plantas de tomate en medios de cultivo con distintas cantidades y tipos de
#' azúcares.
#' @details
#' Se evaluaron 4 tratamientos con 4 repeticiones cada uno:
#' \describe{
#'  \item{}{1- 3\% de fructosa.}
#'  \item{}{2- 3\% de glucosa.}
#'  \item{}{3- 3\% de sacarosa.}
#'  \item{}{4- Control (sin azúcar).}
#'  }
#' El resultado de crecimiento de tejidos (CR), se midió en mm X 10.
#' @docType data
#' @usage data(tomate)
#' @format
#' A data frame with 20 rows and 3 columns:
#' \describe{
#'   \item{Tejido:}{id del tejido tratado.}
#'   \item{TR:}{tratamiento aplicado (3\% de fructosa, 3\% de glucosa, 3\% de
#'   sacarosa y Control).}
#'   \item{CR:}{crecimiento del tejido medido en mm X 10.}
#' }
#' @source --
"tomate"

# 10 peso_vaquillonas----
#' @title Anabólicos en vaquillonas
#' @description
#' Estudió del efecto de anabólicos (AN) en el aumento de peso (AP) en kg de
#' vaquillonas.
#' @details
#' Se utilizaron en total 12 vaquillonas de similares características (peso,
#' edad, etc).
#'
#' Cuatro vaquillonas elegidas al azar recibieron un tipo de anabólico mientras
#' que otras 4 vaquillonas recibieron el otro tipo de anabólico. Adicionalmente,
#' 4 vaquillonas fueron dejadas como control sin recibir anabólicos.
#'
#' Durante el experimento, una de las vaquillonas del tratamiento 2 tuvo que ser
#' descartada del ensayo.
#' @docType data
#' @usage data(peso_vaquillonas)
#' @format
#' A data frame with 28 rows and 2 columns:
#' \describe{
#'   \item{AN:}{tipo de anabólico suministrado.}
#'   \item{AP:}{aumento de peso en kg.}
#' }
#' @source --
"peso_vaquillonas"

# 11 estrogeno----
#' @title Actividad estrogénica
#' @description
#' Experimento realizado para evaluar la actividad estrogénica de 6 tipos de
#' solución de estrógenos sujetas a una técnica de inactivación in vitro.
#' @details
#' Las 6 soluciones y un tratamiento control se asignaron por cuadriplicado a
#' ratones hembra.
#' Se registró el peso (PE) del útero como medida de la actividad estrogénica.
#' @docType data
#' @usage data(estrogeno)
#' @format
#' A data frame with 28 rows and 2 columns:
#' \describe{
#'   \item{SO:}{solucion de estrógeno asignada.}
#'   \item{PE:}{Peso del útero.}
#' }
#' @source --
"estrogeno"

# 12 lechuga----
#' @title Respuesta de la lechuga a la fertilización nitrogenada
#' @description
#' Experimento realizado para evaluar la respuesta en el stand de plantas de
#' lechuga a la fertilización nitrogenada.
#' @details
#' Se aplicaron cinco dosis de nitrato de amonio (0, 50, 100, 150 y 200 kg/ha)
#' por cuadruplicado a parcelas siguiendo un diseño completamente aleatorizado.
#'
#' Se registró el número de lechugas cosechadas de la parcela.
#' @docType data
#' @usage data(lechuga)
#' @format
#' A data frame with 20 rows and 24 columns:
#' \describe{
#'   \item{Dosis:}{dosis de nitrogeno aplicado.}
#'   \item{Dosis_ord:}{dosis transformada a factor ordenada.}
#'   \item{Dosis_chr:}{dosis como caracter transformada a factor.}
#'   \item{Plantas:}{numero de plantas cosechadas de la parcela.}
#' }
#' @source --
"lechuga"

# 13 gallinas----
#' @title Función pituitaria en gallinas
#' @description
#' Un fisiólogo de animales estudió la función pituitaria de las gallinas
#' sometidas a un régimen estándar de muda de pluma forzada usado por los
#' productores de huevo para mantener las gallinas en producción.
#' @details
#' Se usaron 25 gallinas en el estudio. Cinco se utilizaron para la medición
#' previa al régimen de muda forzada y el resto al final de cada una de las
#' cuatro etapas del régimen.
#'
#' Las cinco etapas del régimen (TR) fueron:
#' \describe{
#'   \item{}{1. premuda (control).}
#'   \item{}{2. ayuno de 8 días.}
#'   \item{}{3. 60 g de salvado al día durante 10 días.}
#'   \item{}{4. 80 g de salvado al día por 10 días.}
#'   \item{}{5. mezcla de malta durante 42 días.}
#' }
#' Uno de los compuestos medidos fue la concentración de suero T3. Los datos de
#' la tabla son las medidas de suero T3 en las cinco gallinas sacrificadas al
#' final de cada etapa del régimen.
#' @docType data
#' @usage data(gallinas)
#' @format
#' A data frame with 25 rows and 2 columns:
#' \describe{
#'   \item{TR:}{regimen de muda suministrado.}
#'   \item{T3:}{concentración de suero T3.}
#' }
#' @source --
"gallinas"

# 14 pH_laboratorio----
#' @title Error en pH-metros
#' @description
#' Un laboratorio de suelos tiene 4 tipos de pH-metros para determinar el pH en
#' muestras de suelo. El encargado del laboratorio quiere determinar si hay
#' diferencias en el promedio de las lecturas obtenidas por estos dispositivos.
#' @details
#' Para ello selecciona 24 muestras de suelo con pH conocido y asigna
#' aleatoriamente seis muestras a cada pH-metro. Cada muestra de suelo es
#' analizada y se registra la diferencia entre el valor que lee el pH-metro y
#' el valor conocido de pH de la muestra.
#' @docType data
#' @usage data(pH_laboratorio)
#' @format
#' A data frame with 24 rows and 3 columns:
#' \describe{
#'   \item{Dispositivo:}{letra que identifica el dispositivo utilizado.}
#'   \item{Muestra:}{id de la muestra a la que se le realizo la medida.}
#'   \item{dif:}{diferencia de pH medido vs pH conocido.}
#' }
#' @source --
"pH_laboratorio"

# 15 conservante_frutilla----
#' @title Conservantes en frutillas congeladas
#' @description
#' Investigadores del Departamento de Cultivos Frutales de una universidad
#' compararon cuatro preservantes para ser utilizados en frutilla congeladas.
#' @details
#' Se prepararon en recipientes para freezer muestras de frutillas a las cuales
#' al azar les agregaron uno de los 4 preservantes evaluados: uno estandar o
#' control y 3 nuevos compuestos.
#'
#' Luego del tratamiento con el preservante, cada bandeja fue envuelta con bolsa
#' de plástico y conservada en el freezer a 0°C durante 6 meses. Luego de dicho
#' período las muestras fueron descongeladas y se realizó una evaluación de
#' decoloración en una escala de 1 a 10 (a mayor numero mayor decoloración).
#' @docType data
#' @usage data(conservante_frutilla)
#' @format
#' A data frame with 32 rows and 2 columns:
#' \describe{
#'   \item{Tratamiento:}{preservante utilizado.}
#'   \item{decoloracion:}{grado de decoloración en una escala del 1 al 10.}
#' }
#' @source --
"conservante_frutilla"

# 16 hibridos_maiz----
#' @title Híbridos de maíz
#' @description
#' Ensayo comparativo de rendimiento de maíz.
#' @details
#' Se evaluaron 4 híbridos: A, B, C y D los cuales fueron asignados
#' aleatoriamente a cada una de las 32 parcelas disponibles para el estudio.
#' @docType data
#' @usage data(hibridos_maiz)
#' @format
#' A data frame with 32 rows and 2 columns:
#' \describe{
#'   \item{Hibrido:}{id del híbrido de maíz evaluado.}
#'   \item{rend:}{rendimiento registrado.}
#' }
#' @source --
"hibridos_maiz"

# 17 dieta_pavos----
#' @title Dietas en pavos
#' @description
#' Experimento realizado para probar los efectos de 5 dietas en pavos.
#' @details
#' Se asignaron aleatoriamente 6 pavos a cada una de las 5 dietas y los
#' alimentaron individualmente durante un determinado período de tiempo. En el
#' experimento se utilizaron pavos con similar peso inicial.
#'
#' Luego se midió la ganancia de peso (GP) de cada pavo.
#' @docType data
#' @usage data(dieta_pavos)
#' @format
#' A data frame with 30 rows and 2 columns:
#' \describe{
#'   \item{Dieta:}{id de la dieta suministrada.}
#'   \item{GP:}{ganancia de peso (GP) registrada.}
#' }
#' @source --
"dieta_pavos"

# 18 nematodes_durazno----
#' @title Nematodes en durazno
#' @description
#' Experimento realizado para comparar el crecimiento de plantines de durazno.
#' Investigadores suponen que la enfermedad tristeza de los tallos en plantines
#' de árboles de durazno puede estar relacionada con la presencia o ausencia de
#' nemátodes en el suelo.
#'
#' El control de malezas y el tratamiento de suelos usando herbicidas puede ser
#' efectivo en promover el crecimiento de los plantines.
#' @details
#' Se trato el suelo y las malezas con uno de los siguientes tratamientos:
#' \describe{
#'   \item{}{A: Control (sin herbicida).}
#'   \item{}{B: Herbicida con Nemagone (nematicida).}
#'   \item{}{C: Herbicida sin Nemagone (nematicida).}
#' }
#' Los investigadores asignaron al azar 6 de los 18 plantines a cada
#' tratamiento, luego trataron el suelo y las malezas en las áreas de
#' crecimiento con el tratamiento asignado.
#'
#' Al final del estudio, registraron la altura (en cm) de cada plantin.
#' @docType data
#' @usage data(nematodes_durazno)
#' @format
#' A data frame with 18 rows and 2 columns:
#' \describe{
#'   \item{Tratamiento:}{tipo de tratamiento aplicado.}
#'   \item{altura:}{altura del plantin en cm.}
#' }
#' @source --
"nematodes_durazno"

# 19 dietas_novillos----
#' @title Dietas en novillos
#' @description
#' Resultados de un ensayo de nutrición animal donde se evaluaron 4 dietas o
#' raciones para engorde de novillos.
#' @details
#' Para el experimento se contó con 24 novillos de la mismo raza, sexo, y
#' similar edad similar peso inicial. Cada animal fue asignado de manera
#' aleatoria a una de las 4 raciones evaluadas.
#'
#' Luego de un cierto período se midió el aumento de peso (en kg) de cada uno de
#' los animales.
#' @docType data
#' @usage data(dietas_novillos)
#' @format
#' A data frame with 20 rows and 3 columns:
#' \describe{
#'   \item{Dieta:}{tipo de dieta suministrada.}
#'   \item{Animal:}{id del animal.}
#'   \item{peso:}{aumento de peso en kg.}
#' }
#' @source --
"dietas_novillos"

# 20 fertilizante_pastizal----
#' @title Fertilización en \emph{Bouteloua gracilis}
#' @description
#' Ensayo de fertilización en un pastizal de \emph{Bouteloua gracilis} siguiendo un
#' diseño en bloques completos al azar.
#' @details
#' Se evaluaron cinco tratamientos de fertilización (combinaciones de N y P2O5
#' más un control) los cuales fueron asignados a parcelas en cada bloque.
#'
#' Como respuesta se cuantificó la concentración de P en tejido foliar.
#'
#' Los tratamientos:
#' \describe{
#'  \item{}{1- control: sin fertilizar.}
#'  \item{}{2- N50: 50 lb de N.}
#'  \item{}{3- N100: 100 lb de N.}
#'  \item{}{4- N50P75: 50 lb de N + 75 lb de P~2~O~5~.}
#'  \item{}{5- N100P75: 100 lb de N + 75 lb de P~2~O~5~.}
#'  }
#' @docType data
#' @usage data(fertilizante_pastizal)
#' @format
#' A data frame with 25 rows and 3 columns:
#' \describe{
#'   \item{Bloque:}{id del bloque.}
#'   \item{Tratamiento:}{tipo de tratamiento aplicado.}
#'   \item{P:}{concentración de P en tejido foliar.}
#' }
#' @source --
"fertilizante_pastizal"

# 21 fibra_quimico----
#' @title Compuestos químicos en fibra
#' @description
#' Experimento realizado para determinar el efecto de cuatro compuestos químicos
#' diferentes en la resistencia de una fibra.
#' @details
#' Se seleccionaron cinco muestras de fibra, y un diseño de bloque aleatorio. Se
#' ejecutó probando cada tipo de compuesto químico en orden aleatorio en cada
#' muestra de fibra.
#' @docType data
#' @usage data(fibra_quimico)
#' @format
#' A data frame with 20 rows and 3 columns:
#' \describe{
#'   \item{BL:}{id del bloque (muestra de fibra).}
#'   \item{CQ:}{tipo de compuesto químico aplicado.}
#'   \item{RF:}{resistencia de la fibra.}
#' }
#' @source --
"fibra_quimico"

# 22 gladiolos----
#' @title Gladiolos y herbicidas
#' @description
#' Se comparó el efecto de varios herbicidas sobre el peso de las flores de
#' gladiolos.
#' @details
#' El experimento se realizó en un diseño de bloques completos al azar con cuatro tratamientos y cuatro bloques.
#' \describe{
#'   \item{}{1- control (sin herbicida).}
#'   \item{}{2- 2,4D-TCA.}
#'   \item{}{3- DN/CR.}
#'   \item{}{4- SESIN.}
#' }
#' Luego se midió el peso promedio por inflorescencia en onzas.
#' @docType data
#' @usage data(gladiolos)
#' @format
#' A data frame with 16 rows and 3 columns:
#' \describe{
#'   \item{BL:}{id del bloque.}
#'   \item{TR:}{tipo de tratamiento aplicado.}
#'   \item{EH:}{peso promedio por inflorescencia en onzas.}
#' }
#' @source --
"gladiolos"

# 23 invernadero_spartina----
#' @title Crecimiento de \emph{Spartina altemiflora}
#' @description
#' Experimento realizado en invernadero sobre el crecimiento de
#' \emph{Spartina altemiflora} (gramínea perenne), planta ecológicamente importante
#' de las salinas, para evaluar los efectos de la salinidad, el nitrógeno y
#' aireación.
#' @details
#' La variable respuesta es la biomasa, el peso seco de toda la parte aérea de
#' la planta.
#'
#' Cada tratamiento (TR) son diferentes combinaciones de salinidad, el nitrógeno
#' y aireación, con un total de 12 tratamientos.
#' @docType data
#' @usage data(invernadero_spartina)
#' @format
#' A data frame with 48 rows and 3 columns:
#' \describe{
#'   \item{TR:}{tipo de combinacion aplicada.}
#'   \item{BL:}{id del bloque.}
#'   \item{BI:}{bioamasa registrada en peso seco.}
#' }
#' @source --
"invernadero_spartina"

# 24 irrigacion_naranjo----
#' @title Irrigación en naranjos
#' @description
#' Efecto de diferentes tipos de irrigación en el peso de la fruta cosechada en
#' naranjos.
#' @details
#' En un naranjal se llevo a cabo un experimento de irrigación con un diseño de
#' bloques completos aleatorizado en el que se usaron seis tratamientos de
#' irrigación:
#' \describe{
#'   \item{}{G = goteo.}
#'   \item{}{E = por surco.}
#'   \item{}{R = rocío.}
#'   \item{}{A = aspersor.}
#'   \item{}{AR = aspersor + rocío.}
#'   \item{}{AN = anegado.}
#' }
#'
#' Los siguientes datos se refieren al peso en libras de la fruta cosechada en cada parcela.
#' @docType data
#' @usage data(irrigacion_naranjo)
#' @format
#' A data frame with 48 rows and 2 columns:
#' \describe{
#'   \item{BL:}{id del bloque.}
#'   \item{TR:}{tipo de riego utilizado.}
#'   \item{PF:}{peso de la fruta cosechada en libras.}
#' }
#' @source --
"irrigacion_naranjo"

# 25 nabos----
#' @title Ácido ascórbico en nabos
#' @description
#' Estudio realizado para determinar el efecto de lavar y eliminar el exceso de
#' humedad secando o mediante corriente de aire sobre el contenido de ácido
#' ascórbico de nabos.
#' @details
#' Se presentan los datos de los 3 tratamientos
#' \describe{
#'   \item{}{C = control sin lavar.}
#'   \item{}{LC = lavado con agua corriente.}
#'   \item{}{LSA = lavado y secado con absorbente.}
#'   \item{}{LSC = lavado y secado con corriente de aire.}
#' }
#' Los tratamientos fueron asignados al azar dentro de 5 bloques
#' @docType data
#' @usage data(nabos)
#' @format
#' A data frame with 15 rows and 3 columns:
#' \describe{
#'   \item{BL:}{id del bloque.}
#'   \item{TR:}{tipo de lavado y secado aplicado.}
#'   \item{LE:}{contenido de ácido ascórbico.}
#' }
#' @source --
"nabos"

# 26 resist_algodon----
#' @title Resistencia de fibra sintética con algodón
#' @description
#' Experimento en el cual se evalúa la resistencia a la tensión de una fibra
#' sintética que es de interés del fabricante de la misma. Se sospecha que la
#' resistencia se relaciona con el porcentaje de algodón en la fibra.
#' @details
#' Para ello se emplean cinco niveles de porcentaje de algodón (AL), y se
#' ejecutan cinco réplicas en orden aleatorio (bloques).
#' @docType data
#' @usage data(resist_algodon)
#' @format
#' A data frame with 25 rows and 3 columns:
#' \describe{
#'   \item{BL:}{id del bloque.}
#'   \item{AL:}{porcentaje de algodón en la fibra.}
#'   \item{AL_ord:}{porcentaje de algodón transformado a factor ordenado.}
#'   \item{RT:}{resistencia a la tensión registrada.}
#' }
#' @source --
"resist_algodon"

# 27 rollos_tela----
#' @title Resistencia a la tensión de rollos de tela
#' @description
#' Ensayo que evalua la resistencia a la tensión de rollos de algodón,
#' considerando los rollos de tela como bloques.
#' @details
#' Se seleccionan 5 rollos y les aplica los 4 agentes químicos (AQ) de manera
#' aleatoria.
#'
#' Se proporcionan los resultados de la resistencia a la tensión (RT).
#' @docType data
#' @usage data(rollos_tela)
#' @format
#' A data frame with 20 rows and 3 columns:
#' \describe{
#'   \item{BL:}{id del bloque.}
#'   \item{AQ:}{tipo de agente químico aplicado.}
#'   \item{RT}{resistencia a la tensión registrada.}
#' }
#' @source --
"rollos_tela"

# 28 sorgo_urea----
#' @title Dosis de urea en sorgo granífero
#' @description
#' En una estación experimental de la Provincia de la Pampa se realizo un
#' experimento con sorgo granífero.
#' @details
#' Se estudiaron 3 dosis de urea (DO en kg/ha) con un testigo, obteniéndose
#' siguientes rendimientos de grano en Kg por parcela de 20 m^2.
#' @docType data
#' @usage data(sorgo_urea)
#' @format
#' A data frame with 16 rows and 4 columns:
#' \describe{
#'   \item{BL:}{id del bloque.}
#'   \item{DO:}{dosis de urea aplicada.}
#'   \item{DO_ord:}{dosis de urea transformada a factor ordenada.}
#'   \item{RTO:}{rendimiento de grano en kg}
#' }
#' @source --
"sorgo_urea"

# 29 insecticida_poroto----
#' @title Insecticidas en poroto
#' @description
#' Experimento realizado para comparar los efectos de tres insecticidas en una
#' variedad de frijoles (_Phaseolus vulgaris_).
#' @details
#' Para el ensayo disponía de cuatro parcelas dentro del campo experimental.
#' Debido a que dichas parcelas tenían diferencias de fertilidad, drenaje y
#' protección a los vientos, el investigador decidió realizar el experimento
#' siguiendo un DBCA donde cada parcela fue considerada como un bloque.
#'
#' A su vez, cada parcela se dividió en tres hileras distanciadas de modo tal
#' que el efecto de los insecticidas no se superponga.
#' En cada hilera se sembraron 100 semillas y los insecticidas se asignaron
#' aleatoriamente a cada fila dentro de la parcela.
#'
#' Luego de un tiempo se registró el número de plántulas emergidas por fila.
#' @docType data
#' @usage data(insecticida_poroto)
#' @format
#' A data frame with 12 rows and 3 columns:
#' \describe{
#'   \item{Bloque:}{id del bloque.}
#'   \item{Insecticida:}{id del insecticida aplicado.}
#'   \item{emergencia}{número de plántulas emergidas por fila.}
#' }
#' @source --
"insecticida_poroto"

# 30 larvas_cesped----
#' @title Insecticidas en césped
#' @description
#' La larva del género \emph{Tipula sp.} se alimenta de raices y pelos radicales de
#' céspedes produciendo pérdida de plantas y amarillamiento.
#'
#' Un laboratorio llevo a cabo un exeprimento para evaluar la efectividad de
#' cuatro alternativas de control químico.
#' @details
#' Para ampliar el nivel de inferencia del estudio, los investigadores
#' seleccionaron seis sitios experimentales con distintas condiciones de suelo
#' dentro de los cuales asignaron de manera aleatoria los insecticidas a
#' parcelas sembradas con césped. Adicionalmente, en cada sitio una parcela fue
#' dejada sin tratar a modo de control.
#'
#' A la semana siguiente se contó el número de larvas en tres sectores de cada
#' parcela y se registro el promedio de sobrevivientes de cada parcela.
#' @docType data
#' @usage data(larvas_cesped)
#' @format
#' A data frame with 60 rows and 5 columns:
#' \describe{
#'   \item{Sitio:}{id del sitio experimental.}
#'   \item{Parcela:}{id de la parcela.}
#'   \item{Tratamiento:}{id del insecticida aplicado.}
#'   \item{Muestra:}{id de la muestra dentro de la parcela.}
#'   \item{cantidad:}{número de larvas sobrevivientes.}
#' }
#' @source --
"larvas_cesped"

# 31 cana_azucar----
#' @title Variedades de caña de azúcar
#' @description
#' Se estudió la producción de distintas variedades de caña de azucar siguiendo
#' un diseño en cuadrado latino.
#' @details
#' Resultados de producción en kilos por parcela.
#' @docType data
#' @usage data(cana_azucar)
#' @format
#' A data frame with 25 rows and 4 columns:
#' \describe{
#'   \item{F:}{id de la fila.}
#'   \item{C:}{id de la columna.}
#'   \item{VAR:}{variedad de caña de azúcar evaluada.}
#'   \item{RTO:}{producción en kilos por parcela.}
#' }
#' @source --
"cana_azucar"

# 32 hormona_ovario----
#' @title Hormona foliculoestimulante en vacas
#' @description
#' La actividad de la hormona foliculoestimulante en vacas fue medida mediante
#' la respuesta del peso de los ovarios de ratas inmaduras.
#' @details
#' Los factores conocidos que afectan la respuesta son el genotipo y el peso
#' corporal. Asumiendo que la relación entre el peso de los ovarios y el peso
#' corporal es independiente de las diferencias genéticas, se utilizó un diseño
#' Cuadrado Latino donde las filas son las camadas de ratas y las columnas las
#' categorías de peso corporal.
#'
#' Las hormonas fueron inyectadas a las ratas y luego de un período de tiempo se
#' midió el peso del ovario.
#' @docType data
#' @usage data(hormona_ovario)
#' @format
#' A data frame with 16 rows and 4 columns:
#' \describe{
#'   \item{F:}{id de la camada (filas).}
#'   \item{C:}{categoría de peso corporal (columnas).}
#'   \item{HORMONA:}{hormona inyectada.}
#'   \item{PESO:}{peso del ovario medido.}
#' }
#' @source --
"hormona_ovario"

# 33 inyeccion_vaquillas----
#' @title Métodos de inyección en vaquillas
#' @description
#' Se evaluó la respuesta a cuatro dosis (D) diferentes de un producto
#' inyectado en vaquillas Holstein para lograr el incremento en su peso.
#' @details
#' Para controlar el efecto de la genética y el tipo de aplicación, se utilizó
#' un diseño cuadrado latino donde por fila se agruparon las vaquillas según su
#' línea genética y las columnas representan el método de inyección (1 =
#' intravenosa, 2 = intramuscular, 3 = subcutánea I y 4 = subcutánea II).
#'
#' La respuesta se midió en aumento de peso (kg) en un determinado periodo de
#' tiempo.
#'
#' Las dosis fueron:
#' \describe{
#'   \item{}{A: 0 ml}
#'   \item{}{B: 2 ml}
#'   \item{}{C: 4 ml}
#'   \item{}{D: 6 ml}
#' }
#' @docType data
#' @usage data(inyeccion_vaquillas)
#' @format
#' A data frame with 16 rows and 6 columns:
#' \describe{
#'   \item{F:}{línea genética (filas).}
#'   \item{C:}{método de inyección (columnas).}
#'   \item{D:}{dosis aplicada (A, B, C, D).}
#'   \item{RTA:}{aumento de peso en kg.}
#'   \item{D_num:}{dosis aplicada en formato numerico.}
#'   \item{D_ord:}{dosis aplicada como factor ordenado.}
#' }
#' @source --
"inyeccion_vaquillas"

# 34 prolactina_vacas----
#' @title Prolactina en vaquillas
#' @description
#' Se realizó un experimento para medir el pico maximo de prolactina en
#' vaquillas Holstein ante la aplicacion de distintas dosis de la hormona TRH.
#' @details
#' Se utilizaron 3 dosis de la hormona: A = 50 μg, B = 100 μg y C = 150 μg en
#' un DCL. Los factores de bloqueo fueron genética (columnas) y el peso (filas).
#' @docType data
#' @usage data(prolactina_vacas)
#' @format
#' A data frame with 9 rows and 6 columns:
#' \describe{
#'   \item{F:}{factor de bloqueo peso (filas).}
#'   \item{C:}{factor de bloqueo genética (columnas).}
#'   \item{DOSIS:}{dosis de hormona TRH aplicada.}
#'   \item{PICO:}{pico máximo de prolactina medido.}
#'   \item{DOSIS_num:}{dosis aplicada en formato numerico.}
#'   \item{DOSIS_ord:}{dosis aplicada como factor ordenado.}
#' }
#' @source --
"prolactina_vacas"

# 35 tiempo_reaccion----
#' @title Tiempo de reacción en proceso químico
#' @description
#' Se evaluó el tiempo de reaccion de un proceso quimico con cinco ingredientes
#' diferentes en un diseño en cuadrado latino.
#' @details --
#' @docType data
#' @usage data(tiempo_reaccion)
#' @format
#' A data frame with 25 rows and 5 columns:
#' \describe{
#'   \item{F:}{id de la fila.}
#'   \item{C:}{id de la columna.}
#'   \item{INGREDIENTE:}{ingrediente utilizado (A, B, C, D, E).}
#'   \item{TIEMPO:}{tiempo de reacción.}
#' }
#' @source --
"tiempo_reaccion"

# 36 variedad_trigo----
#' @title Rendimiento de variedades de trigo
#' @description
#' Mediante un experimento se evaluó los rendimientos de distintas variedades
#' de trigo en kilogramos por parcela (cada parcela de 42 metros cuadrados).
#' @details
#' Se evaluaron cuatro variedades en un DCL.
#' @docType data
#' @usage data(variedad_trigo)
#' @format
#' A data frame with 16 rows and 4 columns:
#' \describe{
#'   \item{F:}{id de la fila.}
#'   \item{C:}{id de la columna.}
#'   \item{VAR:}{variedad de trigo evaluada.}
#'   \item{REND:}{rendimiento en kg por parcela.}
#' }
#' @source --
"variedad_trigo"

# 37 labores_remolacha----
#' @title Labores culturales en remolacha azucarera
#' @description
#' Se midieron los rendimientos de remolacha azucarera en toneladas por
#' hectárea bajo tres tipos de labores culturales en un diseño en cuadrado
#' latino.
#' @details --
#' @docType data
#' @usage data(labores_remolacha)
#' @format
#' A data frame with 9 rows and 4 columns:
#' \describe{
#'   \item{F:}{id de la fila.}
#'   \item{C:}{id de la columna.}
#'   \item{LAB:}{tipo de labor cultural aplicada.}
#'   \item{RTO:}{rendimiento en toneladas por hectárea.}
#' }
#' @source --
"labores_remolacha"

# 38 raciones_pollos----
#' @title Raciones alimenticias para pollos
#' @description
#' Se probaron 4 raciones alimenticias para pollos, criados en jaula tipo batería de 4 pisos (filas) y 4 casilleros (columnas).
#' @details
#' La variable analizada fué: peso del pollo (kg) a las 8 semanas de edad.
#' @docType data
#' @usage data(raciones_pollos)
#' @format
#' A data frame with 16 rows and 4 columns:
#' \describe{
#'   \item{Pisos:}{número de pisos de la jaula (filas).}
#'   \item{Casilleros:}{número de casilleros (columnas).}
#'   \item{Racion:}{ración alimenticia suministrada.}
#'   \item{Peso:}{peso del pollo en kg a las 8 semanas.}
#' }
#' @source --
"raciones_pollos"

# 39 semillas_trigo----
#' @title Rendimiento de semillas de trigo
#' @description
#' Se realizó un ensayo para evaluar el rendimiento de la semilla de trigo.
#' @details
#' Al plantear este experimento se pensó que podría conseguirse mayor precisión
#' si se controlaba la variabilidad introducida por los tipos de abono e
#' insecticida.
#' El instituto de experimentación agrícola está interesado en estudiar 4 tipos
#' de semilla de trigo, (A, B, C, D) y decide realizar el experimento
#' utilizando un diseño en cuadrado latino. Para ello selecciona 4 niveles para
#' cada una de las variables de bloque:
#' \itemize{
#'   \item Abono: (a1, a2, a3, a4)
#'   \item Insecticida: (i1, i2, i3, i4)
#' }
#' @docType data
#' @usage data(semillas_trigo)
#' @format
#' A data frame with 16 rows and 4 columns:
#' \describe{
#'   \item{Abono:}{tipo de abono utilizado (filas).}
#'   \item{Insecticida:}{tipo de insecticida utilizado (columnas).}
#'   \item{Semilla:}{tipo de semilla de trigo evaluada.}
#'   \item{Rendimiento:}{rendimiento registrado.}
#' }
#' @source --
"semillas_trigo"

# 40 conc_glucosa----
#' @title Concentración de glucosa
#' @description
#' Experimento para determinar el efecto de dos métodos químicos de determinación
#' de glucosa y 3 niveles de glucosa aplicados al suero.
#' @details
#' Se aplicaron las combinaciones de método y nivel de glucosa por triplicado a
#' muestras de suero.
#' @docType data
#' @usage data(Conc_glucosa)
#' @format
#' A data frame with 18 rows and 4 columns:
#' \describe{
#'   \item{Metodo:}{método químico de determinación (1 o 2).}
#'   \item{Nivel:}{nivel de glucosa aplicado (A, B o C).}
#'   \item{Concentracion:}{concentración de glucosa medida.}
#'   \item{repeticion:}{id de la repetición.}
#' }
#' @source --
"conc_glucosa"

# 41 energia_abejas----
#' @title Energía en abejas
#' @description
#' Experimento para determinar el efecto de la temperatura del ambiente y la
#' viscosidad del líquido en el consumo de energía de abejas melíferas al beber.
#' @details
#' Los niveles de temperatura experimentados fueron 20, 30 y 40°C, y la
#' viscosidad del líquido se controló por las concentraciones de sacarosa, que
#' eran de 20, 40 y 60% del total de sólidos disueltos.
#'
#' El entomólogo registró la energía gastada por las abejas en J/s.
#' @docType data
#' @usage data(Energia_abejas)
#' @format
#' A data frame with 27 rows and 6 columns:
#' \describe{
#'   \item{Temp:}{temperatura del ambiente en °C.}
#'   \item{Visc:}{viscosidad del líquido (concentración de sacarosa en %).}
#'   \item{Energia:}{energía gastada por las abejas en J/s.}
#'   \item{Temp_ord:}{temperatura transformada a factor ordenado.}
#'   \item{Visc_ord:}{viscosidad transformada a factor ordenado.}
#'   \item{repeticion:}{id de la repetición.}
#' }
#' @source --
"energia_abejas"

# 42 fijacion_N----
#' @title Fijación de Nitrógeno
#' @description
#' Experimento para determinar el efecto del N y hospedantes (cultivos) en la
#' fijación biológica de N de bacterias Rizhobium.
#' @details
#' Se evaluaron cuatro cultivos (alfalfa, soya, guar y habas) y tres niveles de
#' N (0, 50 y 100 ppm N). Dos plantas de cada cultivo fueron inoculadas con
#' Rhizobium y cultivadas en frascos de Leonard con una de las tres
#' concentraciones de N.
#'
#' La reducción de acetileno refleja la cantidad de nitrógeno que fija la
#' bacteria en la relación simbiótica con la planta (a mayor reducción, mayor
#' actividad).
#' @docType data
#' @usage data(Fijacion_N)
#' @format
#' A data frame with 48 rows and 5 columns:
#' \describe{
#'   \item{Cultivo:}{tipo de cultivo hospedante.}
#'   \item{N:}{nivel de nitrógeno aplicado en ppm.}
#'   \item{acetileno:}{reducción de acetileno medida.}
#'   \item{N_ord:}{nivel de nitrógeno transformado a factor ordenado.}
#'   \item{repeticion:}{id de la repetición.}
#' }
#' @source --
"fijacion_N"

# 43 met_pesados----
#' @title Metales pesados en lodos
#' @description
#' Estudio sobre el efecto de lodos de desagüe en el crecimiento de plantas y
#' la absorción de metales pesados.
#' @details
#' Los niveles de metales en los lodos se probaron según el crecimiento de
#' plantas en ambientes que contienen distintas dosis de lodo (bioensayos) en
#' diferentes ciudades.
#' @docType data
#' @usage data(Met_pesados)
#' @format
#' A data frame with 36 rows and 5 columns:
#' \describe{
#'   \item{Ciudad:}{ciudad donde se realizó el ensayo.}
#'   \item{Dosis:}{dosis de lodo aplicada.}
#'   \item{zinc:}{nivel de zinc medido en las plantas.}
#'   \item{Dosis_ord:}{dosis de lodo transformada a factor ordenado.}
#'   \item{repeticion:}{id de la repetición.}
#' }
#' @source --
"met_pesados"

# 44 sal_cebada----
#' @title Salinidad en cebada
#' @description
#' Experimento con plantas de cebada para medir el efecto del aumento de la
#' salinidad y la edad de la planta en la cantidad de agua consumida.
#' @details
#' Las plantas se cultivaron en soluciones de nutrientes con 3 niveles de
#' salinidad (0, 6 y 12 barios) y se cosecharon a los 14, 21 y 28 días.
#'
#' La medida tomada fue la cantidad de agua consumida por las plantas durante el
#' experimento, expresada en milímetros de agua por cada 100 gramos de peso de
#' la planta seca.
#' @docType data
#' @usage data(Sal_cebada)
#' @format
#' A data frame with 18 rows and 6 columns:
#' \describe{
#'   \item{Salinidad:}{nivel de salinidad en barios.}
#'   \item{Edad:}{edad de la planta al momento de la cosecha en días.}
#'   \item{Consumo:}{cantidad de agua consumida (mm/100g peso seco).}
#'   \item{repeticion:}{id de la repetición.}
#'   \item{Salinidad_ord:}{salinidad transformada a factor ordenado.}
#'   \item{Edad_ord:}{edad transformada a factor ordenado.}
#' }
#' @source --
"sal_cebada"

# 45 sal_suelo----
#' @title Salinidad del suelo
#' @description
#' Experimento para evaluar la relación entre la electrocondutividad (EC) y la
#' salinidad del agua en el suelo con diferentes cantidades de agua y texturas.
#' @details
#' Se incluyeron tres texturas básicas de suelo (arena arcillosa, arcilla y
#' barro), tres niveles de salinidad del agua (2, 8 y 16 dS/m) y tres niveles de
#' contenido de agua en el suelo (0%, 5% y 15%).
#' @docType data
#' @usage data(Sal_suelo)
#' @format
#' A data frame with 54 rows and 7 columns:
#' \describe{
#'   \item{Salinidad:}{salinidad del agua en dS/m.}
#'   \item{Agua:}{contenido de agua en el suelo en %.}
#'   \item{Textura:}{textura del suelo.}
#'   \item{EC:}{electrocondutividad del suelo.}
#'   \item{repeticion:}{id de la repetición.}
#'   \item{Salinidad_ord:}{salinidad transformada a factor ordenado.}
#'   \item{Agua_ord:}{contenido de agua transformado a factor ordenado.}
#' }
#' @source --
"sal_suelo"

# 46 fert_melon----
#' @title Fertilización en melón
#' @description
#' Experimento para comparar dos formas de ubicar el fertilizante (en banda y al
#' voleo) y dos mezclas de fertilizante (A y B) en los rendimientos de melón.
#' @details
#' Los tratamientos fueron aplicados a parcelas pequeñas en un diseño de
#' Cuadrado Latino (filas y columnas) debido a la variabilidad del suelo y
#' pendiente.
#'
#' Tratamientos:
#' \describe{
#'   \item{}{T1: al voleo fert A}
#'   \item{}{T2: al voleo fert B}
#'   \item{}{T3: en banda fert A}
#'   \item{}{T4: en banda fert B}
#' }
#' @docType data
#' @usage data(fert_melon)
#' @format
#' A data frame with 16 rows and 4 columns:
#' \describe{
#'   \item{Fila:}{id de la fila del diseño.}
#'   \item{Column:}{id de la columna del diseño.}
#'   \item{Tratamiento:}{tratamiento aplicado.}
#'   \item{rend:}{peso seco de las plantas de melón.}
#' }
#' @source --
"fert_melon"

# 47 inhibidor_N----
#' @title Inhibidor de nitrificación
#' @description
#' Experimento para evaluar la interacción entre los tiempos de aplicación de
#' nitrógeno al suelo y niveles de un inhibidor de nitrificación.
#' @details
#' El nitrógeno se suministró en tres tiempos: pronto, óptimo y tarde. El
#' inhibidor tuvo dos niveles: ninguno y 0.5 kg/ha.
#'
#' La respuesta es el porcentaje de N que absorbieron las plantas de maíz dulce.
#' @docType data
#' @usage data(inhibidor_N)
#' @format
#' A data frame with 18 rows and 4 columns:
#' \describe{
#'   \item{bloque:}{id del bloque.}
#'   \item{inhibidor:}{nivel de inhibidor de nitrificación (ninguno o 0.5).}
#'   \item{Nsuelo:}{momento de aplicación del nitrógeno (pronto, optimo, tarde).}
#'   \item{Nabsorbido:}{porcentaje de N absorbido por las plantas.}
#' }
#' @source --
"inhibidor_N"

# 48 soja_pd----
#' @title Espaciamiento en soja
#' @description
#' Se comparó el efecto de espaciamiento de cinco surcos sobre el rendimiento de
#' dos variedades de soja.
#' @details
#' El diseño era de parcelas divididas con variedades como tratamientos de
#' parcelas completas en un diseño de bloques completos al azar: los
#' espaciamientos entre surcos (en pulgadas) se aplicaron a subparcelas.
#'
#' La respuesta es el rendimiento en bushels por acre.
#' @docType data
#' @usage data(soja_pd)
#' @format
#' A data frame with 60 rows and 5 columns:
#' \describe{
#'   \item{variedad:}{variedad de soja (parcela principal).}
#'   \item{espaciamiento:}{espaciamiento entre surcos en pulgadas (subparcela).}
#'   \item{bloque:}{id del bloque.}
#'   \item{rendimiento:}{rendimiento en bushels por acre.}
#'   \item{espaciamiento_ord:}{espaciamiento transformado a factor ordenado.}
#' }
#' @source --
"soja_pd"

# 49 semillas_pd----
#' @title Tratamiento de semillas de avena
#' @description
#' Se compararon los rendimientos de cuatro lotes de avena para tres
#' tratamientos químicos de las semillas y un control sin tratamiento.
#' @details
#' Los lotes de semillas (factor A) se distribuyeron aleatoriamente a parcelas
#' completas dentro de cada bloque, los protectores de las semillas (factor B),
#' se asignaron aleatoriamente a las subparcelas dentro de cada parcela
#' completa.
#'
#' Lotes:
#' \describe{
#'   \item{}{Vicland1: infectados por H. victoriae.}
#'   \item{}{Vicland2: no infectados.}
#'   \item{}{Clinton: resistentes a H. victoriae.}
#'   \item{}{Branch: resistentes a H. victoriae.}
#' }
#' @docType data
#' @usage data(semillas_pd)
#' @format
#' A data frame with 64 rows and 4 columns:
#' \describe{
#'   \item{lote:}{lote de semilla (parcela principal).}
#'   \item{bloque:}{id del bloque.}
#'   \item{tratamiento:}{tratamiento químico o control (subparcela).}
#'   \item{rendimiento:}{rendimiento en bushels por acre.}
#' }
#' @source --
"semillas_pd"

# 50 arroz_pd----
#' @title Riego en arroz
#' @description
#' Ensayo de arroz a fin de analizar el efecto del riego (2 láminas distintas) y
#' la variedad (4 variedades) sobre el rendimiento.
#' @details
#' Cada lámina (parcelas principales) se repitió tres veces en orden aleatorio.
#' Luego, se dividió cada parcela en cuatro subparcelas para dar cabida a 4
#' variedades de arroz.
#' @docType data
#' @usage data(arroz_pd)
#' @format
#' A data frame with 24 rows and 4 columns:
#' \describe{
#'   \item{Lamina:}{lámina de riego (parcela principal).}
#'   \item{Variedad:}{variedad de arroz (subparcela).}
#'   \item{Repetición:}{id de la repetición (bloque).}
#'   \item{Rend:}{rendimiento registrado.}
#' }
#' @source --
"arroz_pd"

# 51 cana_pd----
#' @title Fechas de plantación en caña de azúcar
#' @description
#' Se midió el rendimiento en Tn/ha de Azúcar que experimentan tres fechas de
#' plantación y tres métodos para plantar.
#' @details
#' Diseño en parcelas divididas en bloques completamente al azar. Las fechas se
#' asignaron aleatoriamente a las tres parcelas principales de cada bloque, y
#' los 3 métodos se asignaron aleatoriamente a las subparcelas.
#' @docType data
#' @usage data(caña_pd)
#' @format
#' A data frame with 45 rows and 4 columns:
#' \describe{
#'   \item{Fecha:}{fecha de plantación (parcela principal).}
#'   \item{Método:}{método de plantación (subparcela).}
#'   \item{Bloque:}{id del bloque.}
#'   \item{Rend:}{rendimiento en Tn/ha de azúcar.}
#' }
#' @source --
"cana_pd"

# 52 maiz2_pd----
#' @title Abonos en maíz
#' @description
#' Se probó el efecto de seis abonos y dos formas de Aplicación, superficial (1)
#' o Incorporado (2) en maíz.
#' @details
#' Diseño en parcelas divididas (DPD) en bloques completamente al azar en donde
#' las variantes de aplicación se asignaron a las parcelas (principal) y los
#' abonos a las subparcelas.
#' @docType data
#' @usage data(maiz2_pd)
#' @format
#' A data frame with 36 rows and 4 columns:
#' \describe{
#'   \item{Bloque:}{id del bloque.}
#'   \item{Aplicacion:}{forma de aplicación (parcela principal).}
#'   \item{Abono:}{tipo de abono (subparcela).}
#'   \item{Rend:}{rendimiento por parcela en kg.}
#' }
#' @source --
"maiz2_pd"

# 53 trigo_zona_ciclo----
#' @title Trigo en zonas y ciclos
#' @description
#' Se evalúa el rendimiento de trigo (kg/ha) en Norte, Centro y Sur de Santa Fe.
#' @details
#' La adaptación del material genético (fecha y fisiología) hace que en cada
#' zona se prioricen ciclos distintos; por eso Ciclo está anidado en Zona.
#'
#' Anidamiento:
#' \describe{
#'   \item{}{Norte: corto–intermedio}
#'   \item{}{Centro: intermedio–largo}
#'   \item{}{Sur: intermedio–largo}
#' }
#' @docType data
#' @usage data(trigo_zona_ciclo)
#' @format
#' A data frame with 27 rows and 4 columns:
#' \describe{
#'   \item{Zona:}{zona de Santa Fe (Norte, Centro, Sur).}
#'   \item{Ciclo:}{ciclo del trigo (anidado en Zona).}
#'   \item{Rep:}{id de la repetición.}
#'   \item{Rinde:}{rendimiento de trigo en kg/ha.}
#' }
#' @source --
"trigo_zona_ciclo"

# 54 trigo_fungicidas_momentos----
#' @title Fungicidas y momentos en trigo
#' @description
#' Se evalúan tres fungicidas (F1, F2, F3) aplicados en distintos momentos
#' fenológicos del trigo.
#' @details
#' Cada fungicida se aplica en sus propios momentos óptimos, por lo que Momento
#' está anidado en Fungicida. El ensayo es de bloques completos aleatorizados
#' con 4 repeticiones.
#'
#' Aplicación:
#' \describe{
#'   \item{}{F1: Z1, Z7}
#'   \item{}{F2: Z2, Z3, Z4}
#'   \item{}{F3: Z5, Z6}
#' }
#' @docType data
#' @usage data(trigo_fungicidas_momentos)
#' @format
#' A data frame with 84 rows and 4 columns:
#' \describe{
#'   \item{Fungicida:}{fungicida aplicado (F1, F2, F3).}
#'   \item{Momento:}{momento fenológico de aplicación (anidado en Fungicida).}
#'   \item{Bloque:}{id del bloque.}
#'   \item{y:}{rendimiento en kg/ha.}
#' }
#' @source --
"trigo_fungicidas_momentos"

# 55 digest_in_vitro----
#' @title Digestibilidad in vitro
#' @description
#' Se investigó el efecto de la adición de un aditivo para aumentar la
#' digestibilidad de la fibra de un forraje.
#' @details
#' Se prepararon tubos de ensayo con la misma cantidad de forraje y licor
#' ruminal, mientras que las dosis de aditivo (0, 5, 10, 15 g/100 gMS) se
#' asignaron al azar a cada tubo por quintuplicado.
#'
#' Se midió la digestibilidad a las 48 hs.
#' @docType data
#' @usage data(digest_in_vitro)
#' @format
#' A data frame with 20 rows and 4 columns:
#' \describe{
#'   \item{Dosis:}{dosis de aditivo en g/100 gMS.}
#'   \item{Tubo:}{id del tubo de ensayo.}
#'   \item{dig48:}{digestibilidad a las 48 hs en %.}
#'   \item{Dosis_ord:}{dosis transformada a factor ordenado.}
#' }
#' @source --
"digest_in_vitro"
