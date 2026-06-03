# Auditoría de Set de Datos: Trabajos Prácticos vs. Librería `estadisticaFcaUnl`

Este documento contiene un análisis exhaustivo de los archivos de datos utilizados en los **8 Trabajos Prácticos (TPs) válidos** (del TP1 al TP8, excluyendo versiones previas o de plantilla) de la cátedra de estadística básica, comparados con el estado de carga y documentación actual de la librería R `estadisticaFcaUnl`.

---

## Resumen Ejecutivo
Tras leer y analizar cada uno de los archivos R Markdown de los trabajos prácticos, se ha determinado lo siguiente:
- **TP1 y TP2**: Utilizan mayormente datos ya cargados en la sección de **Estadística Básica** (`R/datasets_estb.R`).
- **TP3 y TP4**: No utilizan archivos de datos externos (son ejercicios teóricos de distribuciones de probabilidad con datos textuales).
- **TP5, TP6, TP7 y TP8**: Utilizan una gran cantidad de archivos `.xlsx` y `.csv` locales. **Ninguno de estos archivos de datos está cargado en la sección de Estadística Básica** de la librería. 
- **Casos especiales**: El archivo `caballos.xlsx` (TP5) está cargado en la librería, pero en la sección de **Estadística Experimental** (`R/datasets_estex.R`). Existen otros datasets en la librería que son similares pero tienen nombres o estructuras ligeramente diferentes (ej. `dieta_cerdos` en la librería vs. `cerdos` en los TPs, `semillas_trigo` en la librería vs. `semilla_trigo` en los TPs).

---

## Tabla Comparativa de Datos de Trabajos Prácticos

A continuación se muestra la tabla detallada con cada set de datos utilizado, los ejercicios correspondientes (usando la nomenclatura `ej[N]-[Sección]-TP[M]`), su nombre normalizado en R y si ya está cargado y documentado en la sección de **Estadística Básica** de la librería.

| Archivo de Datos (TP) | Nombre en R (Normalizado) | Trabajos Prácticos y Ejercicios | Estado en la Librería | Notas / Ubicación |
| :--- | :--- | :--- | :---: | :--- |
| **`pesada_terneros.xlsx`** | `pesada_terneros` | ej5-TP1 | **Sí** | Sección Estadística Básica (`datasets_estb.R`) |
| **`superficies_EAP.txt`** | `superficies_EAP` | ej6-TP1, ej16-TP1 | **Sí** | Sección Estadística Básica (`datasets_estb.R`) |
| **`pesada_novillos.xlsx`** | `pesada_novillos` | ej7-TP1 | **Sí** | Sección Estadística Básica (`datasets_estb.R`) |
| **`tambos_2008-2015.xls`** | `tambos_2008_2015` | ej8-TP1 | **Sí** | Sección Estadística Básica (`datasets_estb.R`) |
| **`ryegrass.txt`** | `ryegrass` | ej9-TP1 | **Sí** | Sección Estadística Básica (`datasets_estb.R`) |
| **`Lotes_BA.xls`** | `lotes_BA` | ej10-TP1 | **Sí** | Sección Estadística Básica (`datasets_estb.R`) |
| **`riesgo_arbolado.xlsx`** | `riesgo_arbolado` | ej11-TP1 | **Sí** | Sección Estadística Básica (`datasets_estb.R`) |
| **`productores.xlsx`** | `productores` | ej19-TP2 | **Sí** | Sección Estadística Básica (`datasets_estb.R`) |
| **`especies.xlsx`** | `especies` | ej20-TP2 | **No** | Pendiente de incorporación total **done**|
| **`plantacion.xlsx`** | `plantacion` | ej1-IC-TP5 | **No** | Pendiente de incorporación total **done**|
| **`plantacion_dap.xlsx`** | `plantacion_dap` | ej2-IC-TP5 | **No** | Pendiente de incorporación total **done**|
| **`caballos.xlsx`** | `caballos` | ej3-IC-TP5 | **No** | **Cargado en Estadística Experimental** (`datasets_estex.R`) **se cambio el nombre a pulsaciones_caballos** y no se modifico el ejercicio correspondiente|
| **`molinos.xlsx`** | `molinos` | ej4-IC-TP5 | **No** | Pendiente de incorporación total **done** |
| **`alimento.xlsx`** | `alimento` | ej8-IC-TP5 | **No** | Pendiente de incorporación total **done** |
| **`maiz.xlsx`** | `maiz` | ej9-IC-TP5 | **No** | Pendiente. *Nota: Existe `maiz2_pd` en Experimental.* **done** |
| **`corderos.xlsx`** | `corderos` | ej14-IC-TP5 | **No** | Pendiente de incorporación total **done** |
| **`sorgo.xlsx`** | `sorgo` | ej1-PH-TP5 | **No** | Pendiente. *Nota: Existe `sorgo_urea` en Experimental.* **done** |
| **`ovejas.xlsx`** | `ovejas` | ej3-PH-TP5 | **No** | Pendiente de incorporación total **done** |
| **`balanceado_cerdos.xlsx`** | `balanceado_cerdos` | ej4-PH-TP5 | **No** | Pendiente. *Nota: Existe `dieta_cerdos` en Experimental.* **done**|
| **`pezoneras.xlsx`** | `pezoneras` | ej5-PH-TP5 | **No** | Pendiente de incorporación total **done**|
| **`establecimientos.xlsx`** | `establecimientos` | ej6-PH-TP5 | **No** | Pendiente de incorporación total **done**|
| **`neumaticos_tractores.xlsx`**| `neumaticos_tractores`| ej9-PH-TP5 | **No** | Pendiente de incorporación total **done**|
| **`glifosato.xlsx`** | `glifosato` | ej11-PH-TP5, ej17-PH-TP6| **No** | Pendiente de incorporación total **done**|
| **`barrenador.xlsx`** | `barrenador` | ej15-PH-TP5, ej19-PH-TP6| **No** | Pendiente de incorporación total **done**|
| **`penetrometro.xlsx`** | `penetrometro` | ej16-PH-TP5, ej9-PH-TP6 | **No** | Pendiente de incorporación total **done**|
| **`TRC.xlsx`** | `TRC` | ej1-IC-TP6 | **No** | Pendiente de incorporación total. Se agregó pero no se modifico el ejercicio correspondiente. **done**|
| **`concentracion_insecticida.xlsx`**| `concentracion_insecticida`| ej4-IC-TP6 | **No** | Pendiente de incorporación total **done**|
| **`neumaticos.xlsx`** | `neumaticos` | ej1-PH-TP6 | **No** | Pendiente de incorporación total. Se agregó pero no se modifico el ejercicio correspondiente. **done**|
| **`peso_balanceado.xlsx`** | `peso_balanceado` | ej3-PH-TP6 | **No** | Pendiente de incorporación total **done** |
| **`raciones.xlsx`** | `raciones` | ej4-PH-TP6 | **No** | Pendiente. *Nota: Existe `raciones_pollos` en Experimental.* **done** |
| **`cerdos.xlsx`** | `cerdos` | ej5-PH-TP6 | **No** | Pendiente. *Nota: Existe `dieta_cerdos` en Experimental.* **done** |
| **`ganancia_novillos.xlsx`** | `ganancia_novillos` | ej6-PH-TP6 | **No** | Pendiente de incorporación total **done** |
| **`N_suelo.xlsx`** | `N_suelo` | ej7-PH-TP6 | **No** | Pendiente de incorporación total **done** |
| **`efectividad_sembradora.xlsx`**| `efectividad_sembradora`| ej10-PH-TP6 | **No** | Pendiente de incorporación total **done** |
| **`lesiones_hojas.xlsx`** | `lesiones_hojas` | ej11-PH-TP6 | **No** | Pendiente de incorporación total **done** |
| **`dieta_bufalos.xlsx`** | `dieta_bufalos` | ej12-PH-TP6 | **No** | Pendiente de incorporación total **done** |
| **`colesterol.xlsx`** | `colesterol` | ej13-PH-TP6 | **No** | Pendiente de incorporación total **done** |
| **`MS_girasol.xlsx`** | `MS_girasol` | ej16-PH-TP6 | **No** | Pendiente de incorporación total **done** |
| **`dietas_pollos.xlsx`** | `dietas_pollos` | ej18-PH-TP6 | **No** | Pendiente de incorporación total **done** |
| **`germinacion.xlsx`** | `germinacion` | ej1-TP7 | **No** | Pendiente de incorporación total **done** |
| **`algodon.xlsx`** | `algodon` | ej2-TP7 | **No** | Pendiente. *Nota: Existe `resist_algodon` en Experimental.* **done** |
| **`educacion.xlsx`** | `educacion` | ej3-TP7 | **No** | Pendiente de incorporación total **done** |
| **`semilla.xlsx`** | `semilla` | ej4-TP7 | **No** | Pendiente de incorporación total **done** |
| **`albumen.xlsx`** | `albumen` | ej5-TP7 | **No** | Pendiente de incorporación total **done** |
| **`insectos.xlsx`** | `insectos` | ej6-TP7 | **No** | Pendiente de incorporación total **done** |
| **`monedas.xlsx`** | `monedas` | ej7-TP7 | **No** | Pendiente de incorporación total **done** |
| **`capturados.xlsx`** | `capturados` | ej8-TP7 | **No** | Pendiente de incorporación total **done** |
| **`susceptibilidad.xlsx`** | `susceptibilidad` | ej9-TP7 | **No** | Pendiente de incorporación total **done** |
| **`actividad.xlsx`** | `actividad` | ej10-TP7 | **No** | Pendiente de incorporación total **done** |
| **`razas.xlsx`** | `razas` | ej11-TP7 | **No** | Pendiente de incorporación total **done** |
| **`semillas.xlsx`** | `semillas` | ej12-TP7 | **No** | Pendiente. *Nota: Existe `semillas_pd`/`_trigo` en Experimental.* **done** |
| **`arvejas.xlsx`** | `arvejas` | ej13-TP7 | **No** | Pendiente de incorporación total **done** |
| **`agua_forrajera.xlsx`** | `agua_forrajera` | ej1-TP8 | **No** | Pendiente de incorporación total **done** |
| **`area_trigo.xlsx`** | `area_trigo` | ej2-TP8 | **No** | Pendiente de incorporación total **done** |
| **`coleoptero.xlsx`** | `coleoptero` | ej3-TP8 | **No** | Pendiente de incorporación total **done** |
| **`P_maiz.xlsx`** | `P_maiz` | ej4-TP8 | **No** | Pendiente de incorporación total **done** |
| **`lluvia_forraje.xlsx`** | `lluvia_forraje` | ej5-TP8 | **No** | Pendiente de incorporación total **done** |
| **`hileras_maiz.xlsx`** | `hileras_maiz` | ej6-TP8 | **No** | Pendiente de incorporación total **done** |
| **`calificaciones.xlsx`** | `calificaciones` | ej7-TP8 | **No** | Pendiente de incorporación total **done** |
| **`semilla_trigo.xlsx`** | `semilla_trigo` | ej8-TP8 | **No** | Pendiente. *Nota: Existe `semillas_trigo` en Experimental.* **done** |
| **`huevos.xlsx`** | `huevos` | ej9-TP8 | **No** | Pendiente de incorporación total **done** |
| **`pollos.xlsx`** | `pollos` | ej10-TP8 | **No** | Pendiente. *Nota: Existe `raciones_pollos` en Experimental / `lisina_pollos` en Básica.* **done** |
| **`fungicida.xlsx`** | `fungicida` | ej11-TP8 | **No** | Pendiente. *Nota: Existe `trigo_fungicidas_momentos` en Experimental.* **done** |
| **`proteina_caseina.xlsx`** | `proteina_caseina` | ej12-TP8 | **No** | Pendiente de incorporación total **done** |
| **`dosis_tomate.xlsx`** | `dosis_tomate` | ej13-TP8 | **No** | Pendiente. *Nota: Existe `tomate` en Experimental.* **done** |

---
> [!NOTE]
> Las secciones indicadas con **IC** corresponden a la sección de **Intervalos de Confianza** en los TPs que tienen dos divisiones metodológicas principales (TP5 e Inferencia en Una Muestra, TP6 e Inferencia en Dos Muestras), y **PH** corresponde a **Prueba de Hipótesis**. Aclaracion en el 2025 este TP se dividio en dos partes quedando un total de 9 TPs aunque aqui no esta reflejado debera tenerse en cuenta al momento de hacer el merge.
