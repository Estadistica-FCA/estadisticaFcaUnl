# Lista de Pendientes: Datasets de Estadística Experimental (Estadística II)
Este documento detalla la auditoría de los conjuntos de datos referenciados en los **Trabajos Prácticos (TPs)** y en las **Clases (diapositivas Rmd/Quarto)** de Estadística Experimental. Se contrasta cada conjunto de datos con su incorporación real en el paquete R `estadisticaFcaUnl` (en `data/*.rda` y en `R/datasets_estex.R`).

## 📌 1. Resumen de Pendientes e Incorporaciones

### 🟢 Datasets de TPs Principales: Completados al 100%
Todos los **53 datasets** utilizados en los 8 Trabajos Prácticos principales ya están cargados y documentados en la sección de Estadística Experimental de la librería (`R/datasets_estex.R`).

### 🔴 Pendientes: Datasets Utilizados en las Clases (Diapositivas)
Se detectaron los siguientes datasets en las clases diapositivas que **no** están cargados en el paquete o **no** están documentados:

- **`nutricion`** (usado como `nutricion.xlsx` en clases: `00_repaso_est1.qmd`)
  - **Estado en `data/`**: ❌ Faltante (Pendiente de importar)
  - **Estado de Documentación**: ❌ Faltante (Pendiente de documentar)
  - **Ubicación del archivo de origen**: `No encontrado en carpetas de datos`

- **`trigo`** (usado como `trigo.xlsx` en clases: `00_repaso_est1.qmd`)
  - **Estado en `data/`**: ❌ Faltante (Pendiente de importar)
  - **Estado de Documentación**: ❌ Faltante (Pendiente de documentar)
  - **Ubicación del archivo de origen**: `No encontrado en carpetas de datos`

### 🔴 Pendientes: Datasets en Plantillas o Versiones Completas
Se detectaron los siguientes datasets en archivos plantilla o auxiliares de TPs que no están integrados ni documentados en el paquete:

- **`inhibidor_n_2da`** (referenciado como `inhibidor_N_2da.xlsx` en `TP6_factorial_plantilla.Rmd, TP6_factorial_plantilla2.Rmd, TP6_factorial_plantilla_completa.Rmd`)
  - **Estado en `data/`**: ❌ Faltante (Pendiente de importar)
  - **Estado de Documentación**: ❌ Faltante (Pendiente de documentar)
  - **Ubicación del archivo de origen**: `est2/data/inhibidor_N_2da.xlsx`

- **`herbicidas_soja`** (referenciado como `herbicidas_soja.xlsx` en `TP6_anidado.Rmd`)
  - **Estado en `data/`**: ❌ Faltante (Pendiente de importar)
  - **Estado de Documentación**: ❌ Faltante (Pendiente de documentar)
  - **Ubicación del archivo de origen**: `No encontrado en carpetas de datos`

### 🟡 Pendientes de Decisión: Archivos de Datos Auxiliares NO Utilizados en TPs ni Clases
Existen archivos de datos en `est2/data/` o `est2/clases/data/` que no son referenciados en ningún TP ni diapositiva, pero que podrían cargarse en el paquete para uso futuro. Se detallan a continuación:

| Archivo | Ubicación(es) de Origen | ¿En `data/*.rda`? | ¿Documentado? |
| :--- | :--- | :---: | :---: |
| `anidado.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `apios.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `apios2.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `bacterias_volumen.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `cerdos.xlsx` | `est2/data/` | Sí (cerdos.rda) | Sí (datasets_estb.R) |
| `consumo_combustible.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `crecim_virus.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `escarabajos.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `escarabajos2.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `fardos_dia.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `fert_colza.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `flores_alfalfa.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `fungicida_papa.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `glifosato.xlsx` | `est2/data/` | Sí (glifosato.rda) | Sí (datasets_estb.R) |
| `glifosato2.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `grava_suelos.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `irrigacion_arandanos.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `jitomates.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `maiz_pd.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `nochero_maiz.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `nuevo.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `penetrometro.xlsx` | `est2/data/` | Sí (penetrometro.rda) | Sí (datasets_estb.R) |
| `penetrometro2.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `raciones_cerdos.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `rizhobium_trebol.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `semillas_mani.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `siembra_trigo.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `sorgo_pd.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `trigo_nitrogeno.xlsx` | `est2/data/` | ❌ No | ❌ No |
| `vitamina_cerdos.xlsx` | `est2/data/` | ❌ No | ❌ No |

---
## 📊 2. Tabla Detallada: Datasets Usados en Clases
Esta tabla muestra el estado de todos los datasets referenciados en las clases diapositivas de Estadística Experimental:

| Dataset (Normalizado) | Referencia | Clase(s) Diapositiva(s) | ¿En paquete `data/`? | ¿Documentado? |
| :--- | :--- | :--- | :---: | :---: |
| `almacenamiento_carne` | `almacenamiento_carne.xlsx` | 02_ANOVA_DCA.Rmd, 03_supuestos_ANOVA.Rmd, 04_comp_medias.Rmd | Sí (almacenamiento_carne.rda) | Sí (datasets_estex.R) |
| `camarones` | `camarones.xlsx` | 06_factorial_fijos.Rmd | Sí (camarones.rda) | Sí (datasets_estex.R) |
| `cangrejo_ermitanio` | `cangrejo_ermitanio.xlsx` | 03_supuestos_ANOVA.Rmd | Sí (cangrejo_ermitanio.rda) | Sí (datasets_estex.R) |
| `cebada_salinidad` | `cebada_salinidad.xlsx` | 06_factorial_fijos.Rmd | Sí (cebada_salinidad.rda) | Sí (datasets_estex.R) |
| `cemento` | `cemento.xlsx` | 06_factorial_fijos.Rmd | Sí (cemento.rda) | Sí (datasets_estex.R) |
| `cesped_compactacion` | `cesped_compactacion.xlsx` | 07_Splitplot.Rmd, 07_Splitplot_pa.Rmd | Sí (cesped_compactacion.rda) | Sí (datasets_estex.R) |
| `cesped_golf` | `cesped_golf.xlsx` | 07_Splitplot.Rmd | Sí (cesped_golf.rda) | Sí (datasets_estex.R) |
| `citricos` | `citricos.xlsx` | 06_factorial_fijos.Rmd | Sí (citricos.rda) | Sí (datasets_estex.R) |
| `competencia` | `competencia.xlsx` | 04_comp_medias.Rmd | Sí (competencia.rda) | Sí (datasets_estex.R) |
| `corderos_des` | `corderos.xlsx` | 06_factorial_fijos.Rmd | Sí (corderos_des.rda) | Sí (datasets_estex.R) |
| `densidad_trigo_riego_suelo` | `densidad_trigo_riego_suelo.xlsx` | 05_DBCA_DCL.Rmd | Sí (densidad_trigo_riego_suelo.rda) | Sí (datasets_estex.R) |
| `fert_trigo_bajo_riego` | `fert_trigo_bajo_riego.xlsx` | 05_DBCA_DCL.Rmd | Sí (fert_trigo_bajo_riego.rda) | Sí (datasets_estex.R) |
| `forestal_alt` | `forestal_alt.xlsx` | 07_Splitplot_pa.Rmd | Sí (forestal_alt.rda) | Sí (datasets_estex.R) |
| `lodos` | `lodos.xlsx` | 06_factorial_fijos.Rmd | Sí (lodos.rda) | Sí (datasets_estex.R) |
| `nutricion` | `nutricion.xlsx` | 00_repaso_est1.qmd | ❌ No | ❌ No |
| `trigo` | `trigo.xlsx` | 00_repaso_est1.qmd | ❌ No | ❌ No |

---
## 📊 3. Tabla Detallada: Datasets Usados en TPs Principales
Esta tabla muestra la lista completa de datasets referenciados en los 8 TPs principales de Estadística Experimental y su estado actual en la librería:

| Dataset (Normalizado) | Referencia en TP | Trabajo Práctico (TP) | En `data/*.rda` | Documentado |
| :--- | :--- | :--- | :---: | :---: |
| `ace_codornices` | `ace_codornices.xlsx` | TP1_2_muestras.Rmd | Sí (ace_codornices.rda) | Sí (datasets_estex.R) |
| `arroz_pd` | `arroz_pd.xlsx` | TP7_parcelas_divididas.Rmd | Sí (arroz_pd.rda) | Sí (datasets_estex.R) |
| `caballos` | `caballos.xlsx` | TP2_DCA_anova.Rmd, TP3_analisis_residuales.Rmd, TP4_comparacion_de_medias_completo.rmd | Sí (caballos.rda) | Sí (datasets_estex.R) |
| `cana_azucar` | `cana_azucar.xlsx` | TP5_DCL.Rmd | Sí (cana_azucar.rda) | Sí (datasets_estex.R) |
| `cana_pd` | `caña_pd.xlsx` | TP7_parcelas_divididas.Rmd | Sí (cana_pd.rda) | Sí (datasets_estex.R) |
| `conc_glucosa` | `Conc_glucosa.xlsx` | TP6_factorial.Rmd | Sí (conc_glucosa.rda) | Sí (datasets_estex.R) |
| `conservante_frutilla` | `conservante_frutilla.xlsx` | TP2_DCA_anova.Rmd, TP3_analisis_residuales.Rmd | Sí (conservante_frutilla.rda) | Sí (datasets_estex.R) |
| `dieta_cerdos` | `dieta_cerdos.xlsx` | TP2_DCA_anova.Rmd, TP3_analisis_residuales.Rmd, TP4_comparacion_de_medias_completo.rmd | Sí (dieta_cerdos.rda) | Sí (datasets_estex.R) |
| `dieta_pavos` | `dieta_pavos.xlsx` | TP2_DCA_anova.Rmd, TP3_analisis_residuales.Rmd, TP4_comparacion_de_medias_completo.rmd | Sí (dieta_pavos.rda) | Sí (datasets_estex.R) |
| `dietas_novillos` | `dietas_novillos.xlsx` | TP4_comparacion_de_medias_completo.rmd | Sí (dietas_novillos.rda) | Sí (datasets_estex.R) |
| `digest_in_vitro` | `digest_in_vitro.xlsx` | TP4_comparacion_de_medias_completo.rmd | Sí (digest_in_vitro.rda) | Sí (datasets_estex.R) |
| `dms_ensilaje` | `dms_ensilaje.xlsx` | TP1_2_muestras.Rmd | Sí (dms_ensilaje.rda) | Sí (datasets_estex.R) |
| `energia_abejas` | `Energia_abejas.xlsx` | TP6_factorial.Rmd | Sí (energia_abejas.rda) | Sí (datasets_estex.R) |
| `estrogeno` | `estrogeno.xlsx` | TP2_DCA_anova.Rmd, TP3_analisis_residuales.Rmd, TP4_comparacion_de_medias_completo.rmd | Sí (estrogeno.rda) | Sí (datasets_estex.R) |
| `fert_melon` | `fert_melon.xlsx` | TP6_factorial.Rmd | Sí (fert_melon.rda) | Sí (datasets_estex.R) |
| `fertilizante_pastizal` | `fertilizante_pastizal.xlsx` | TP5_DBCA.Rmd | Sí (fertilizante_pastizal.rda) | Sí (datasets_estex.R) |
| `fibra_quimico` | `fibra_quimico.xlsx` | TP5_DBCA.Rmd | Sí (fibra_quimico.rda) | Sí (datasets_estex.R) |
| `fijacion_n` | `Fijacion_N.xlsx` | TP6_factorial.Rmd | Sí (fijacion_N.rda) | Sí (datasets_estex.R) |
| `gallinas` | `gallinas.xlsx` | TP2_DCA_anova.Rmd, TP3_analisis_residuales.Rmd, TP4_comparacion_de_medias_completo.rmd | Sí (gallinas.rda) | Sí (datasets_estex.R) |
| `gladiolos` | `gladiolos.xlsx` | TP5_DBCA.Rmd | Sí (gladiolos.rda) | Sí (datasets_estex.R) |
| `guayule` | `guayule.xlsx` | TP1_2_muestras.Rmd | Sí (guayule.rda) | Sí (datasets_estex.R) |
| `hibridos_maiz` | `hibridos_maiz.xlsx` | TP2_DCA_anova.Rmd, TP3_analisis_residuales.Rmd, TP4_comparacion_de_medias_completo.rmd | Sí (hibridos_maiz.rda) | Sí (datasets_estex.R) |
| `hormona_ovario` | `hormona_ovario.xlsx` | TP5_DCL.Rmd | Sí (hormona_ovario.rda) | Sí (datasets_estex.R) |
| `inhibidor_n` | `inhibidor_N.xlsx` | TP6_factorial.Rmd | Sí (inhibidor_N.rda) | Sí (datasets_estex.R) |
| `insecticida_poroto` | `insecticida_poroto.xlsx` | TP5_DBCA.Rmd | Sí (insecticida_poroto.rda) | Sí (datasets_estex.R) |
| `invernadero_spartina` | `invernadero_spartina.xlsx` | TP5_DBCA.Rmd | Sí (invernadero_spartina.rda) | Sí (datasets_estex.R) |
| `inyeccion_vaquillas` | `inyeccion_vaquillas.xlsx` | TP5_DCL.Rmd | Sí (inyeccion_vaquillas.rda) | Sí (datasets_estex.R) |
| `irrigacion_naranjo` | `irrigacion_naranjo.xlsx` | TP5_DBCA.Rmd | Sí (irrigacion_naranjo.rda) | Sí (datasets_estex.R) |
| `labores_remolacha` | `labores_remolacha.xlsx` | TP5_DCL.Rmd | Sí (labores_remolacha.rda) | Sí (datasets_estex.R) |
| `larvas_cesped` | `larvas_cesped.xlsx` | TP5_DBCA.Rmd | Sí (larvas_cesped.rda) | Sí (datasets_estex.R) |
| `lechuga` | `lechuga.xlsx` | TP2_DCA_anova.Rmd, TP3_analisis_residuales.Rmd, TP4_comparacion_de_medias_completo.rmd | Sí (lechuga.rda) | Sí (datasets_estex.R) |
| `maiz2_pd` | `maiz2_pd.xlsx` | TP7_parcelas_divididas.Rmd | Sí (maiz2_pd.rda) | Sí (datasets_estex.R) |
| `met_pesados` | `Met_pesados.xlsx` | TP6_factorial.Rmd | Sí (met_pesados.rda) | Sí (datasets_estex.R) |
| `nabos` | `nabos.xlsx` | TP5_DBCA.Rmd | Sí (nabos.rda) | Sí (datasets_estex.R) |
| `nectar_trebol_rojo` | `nectar_trebol_rojo.xlsx` | TP1_2_muestras.Rmd | Sí (nectar_trebol_rojo.rda) | Sí (datasets_estex.R) |
| `nematodes_durazno` | `nematodes_durazno.xlsx` | TP2_DCA_anova.Rmd, TP3_analisis_residuales.Rmd, TP4_comparacion_de_medias_completo.rmd | Sí (nematodes_durazno.rda) | Sí (datasets_estex.R) |
| `peso_vaquillonas` | `peso_vaquillonas.xlsx` | TP2_DCA_anova.Rmd, TP3_analisis_residuales.Rmd, TP4_comparacion_de_medias_completo.rmd | Sí (peso_vaquillonas.rda) | Sí (datasets_estex.R) |
| `ph_laboratorio` | `pH_laboratorio.xlsx` | TP2_DCA_anova.Rmd, TP3_analisis_residuales.Rmd | Sí (pH_laboratorio.rda) | Sí (datasets_estex.R) |
| `prolactina_vacas` | `prolactina_vacas.xlsx` | TP5_DCL.Rmd | Sí (prolactina_vacas.rda) | Sí (datasets_estex.R) |
| `raciones_pollos` | `raciones_pollos.xlsx` | TP5_DCL.Rmd | Sí (raciones_pollos.rda) | Sí (datasets_estex.R) |
| `resist_algodon` | `resist_algodon.xlsx` | TP5_DBCA.Rmd | Sí (resist_algodon.rda) | Sí (datasets_estex.R) |
| `rollos_tela` | `rollos_tela.xlsx` | TP5_DBCA.Rmd | Sí (rollos_tela.rda) | Sí (datasets_estex.R) |
| `sal_cebada` | `Sal_cebada.xlsx` | TP6_factorial.Rmd | Sí (sal_cebada.rda) | Sí (datasets_estex.R) |
| `sal_suelo` | `Sal_suelo.xlsx` | TP6_factorial.Rmd | Sí (sal_suelo.rda) | Sí (datasets_estex.R) |
| `semillas_pd` | `semillas_pd.xlsx` | TP7_parcelas_divididas.Rmd | Sí (semillas_pd.rda) | Sí (datasets_estex.R) |
| `semillas_trigo` | `semillas_trigo.xlsx` | TP5_DCL.Rmd | Sí (semillas_trigo.rda) | Sí (datasets_estex.R) |
| `soja_pd` | `soja_pd.xlsx` | TP7_parcelas_divididas.Rmd | Sí (soja_pd.rda) | Sí (datasets_estex.R) |
| `sorgo_urea` | `sorgo_urea.xlsx` | TP5_DBCA.Rmd | Sí (sorgo_urea.rda) | Sí (datasets_estex.R) |
| `tiempo_reaccion` | `tiempo_reaccion.xlsx` | TP5_DCL.Rmd | Sí (tiempo_reaccion.rda) | Sí (datasets_estex.R) |
| `tomate` | `tomate.xlsx` | TP2_DCA_anova.Rmd, TP3_analisis_residuales.Rmd, TP4_comparacion_de_medias_completo.rmd | Sí (tomate.rda) | Sí (datasets_estex.R) |
| `trebol_rizhobium` | `trebol_rizhobium.xlsx` | TP2_DCA_anova.Rmd, TP3_analisis_residuales.Rmd, TP4_comparacion_de_medias_completo.rmd | Sí (trebol_rizhobium.rda) | Sí (datasets_estex.R) |
| `variedad_trigo` | `variedad_trigo.xlsx` | TP5_DCL.Rmd | Sí (variedad_trigo.rda) | Sí (datasets_estex.R) |
| `vita_vaquillas` | `vitA_vaquillas.xlsx` | TP1_2_muestras.Rmd | Sí (vitA_vaquillas.rda) | Sí (datasets_estex.R) |
