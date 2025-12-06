#' @title Instalar desde miniCRAN
#' @description Función que instala los paquetes especificados desde un
#' repositorio local
#' @param pkgs Espera un vector de caracteres con los paquetes a instalar
#' @param repo_path Espera un string con la ruta donde instalar el repositorio.
#' Si no se especifica se toma el del script donde se está ejecutando
#' @param install Parámetro de debug que permite correr la función sin
#' descargar nada
#' @return Retorna una lista con la ruta del repositorio, el tipo de paquetes
#' descargados, los paquetes exitosos y los que dieron error
#' @details Primero chequea que se halla ingresado una lista de paquetes y el SO
#' en el que opera
#' Luego chequea si se especifico la ruta donde deberá descargarse el
#' repositorio, si no lo está utiliza la del scrip donde es está ejecutando
#' Seguido de esto chequea cuales de los paquetes indicados están dentro del
#' repositorio
#' Por ultimo instala los paquetes validos y retorna un informe con la ruta del
#' repositorio, los paquetes validos y los invalidos
#' @examples pkgs <- c(
#'     "rmarkdown", "moments", "pacman", "rio", "tidyverse",
#'     "emmeans", "car", "DescTools", "agricolae", "multcomp", "multcompView",
#'     "ggplot2"
#' )
#' \dontrun{
#' install.local_repo(pkgs)
#' }
#' @importFrom rstudioapi getSourceEditorContext
#' @importFrom utils available.packages install.packages
#' @export
install.local_repo <- function(pkgs = NULL, repo_path = NULL, install = T) {
    # require(rstudioapi) este import esta manejado por Roxygen
    if (install == T && is.null(pkgs)) {
        stop("Debera ingresar una lista valida de paquetes a instalar")
    }

    # Obtiene el SO en que opera
    sys <- Sys.info()[["sysname"]]

    # Si no se especifica una ruta obtiene la del script donde se está ejecutando
    if (is.null(repo_path)) {
        full_path <- dirname(getSourceEditorContext()$path)

        # Verificar si termina con "local_repo/"
        if (!grepl("local_repo/?$", full_path)) {
            if (!grepl("/$", full_path)) {
                full_path <- paste0(full_path, "/")
            }
            full_path <- paste0(full_path, "local_repo/")
        }
    } else {
        full_path <- repo_path
    }

    # Agregar file:///
    if (!grepl("^file://", full_path)) {
        full_path <- paste0("file:///", full_path)
    }

    tipo_pkg <- switch(sys,
        Windows = "win.binary",
        Linux = "source",
        Darwin = "source",
        stop("Sistema operativo no soportado.")
    )

    # Chequea si el directorio es correcto y obtiene los paquetes disponibles
    disponibles <- tryCatch(
        {
            rownames(available.packages(repos = full_path, type = tipo_pkg))
        },
        error = function(e) {
            warning("No se pudo acceder al repositorio: ", e$message)
            character(0)
        }
    )

    # Si hay paquetes para instalar, verifica cuáles están en el repositorio
    if (!is.null(pkgs)) {
        pkgs_invalidos <- setdiff(pkgs, disponibles)
        pkgs_validos <- intersect(pkgs, disponibles)

        if (length(pkgs_invalidos) > 0) {
            warning(
                "Los siguientes paquetes no se encontraron en el repositorio:\n",
                paste(pkgs_invalidos, collapse = ", ")
            )
        }

        if (install && length(pkgs_validos) > 0) {
            install.packages(pkgs_validos, repos = full_path, type = tipo_pkg)
        } else if (install && length(pkgs_validos) == 0) {
            message("No se instalaron paquetes: ninguno disponible en el repositorio.")
        }
    } else {
        pkgs_invalidos <- NULL
        pkgs_validos <- NULL
    }

    return(invisible(list(
        path = full_path, type = tipo_pkg, pkgs_inst = pkgs_validos,
        pkg_err = pkgs_invalidos
    )))
}
