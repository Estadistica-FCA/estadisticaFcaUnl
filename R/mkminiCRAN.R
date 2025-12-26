#' @title Chequear lista de mirrors
#' @description Función que chequea una lista de mirrors y elige el optimo
#' @param mirrors Vector de caracteres. Espera los mirrors a chequear
#' @return Devuelve una url de un mirror valida
#' @details Recorre la lista de mirrors en orden y chequea que funciona.
#' Si funciona lo retorna.
#' Si no funciona pasa al siguiente, si ninguno funciona devuelve error
check_mirrors <- function(mirrors) {
    for (url in mirrors) {
        test_url <- file.path(url, "src", "contrib", "PACKAGES")
        ok <- tryCatch(
            {
                con <- url(test_url)
                readLines(con, n = 1)
                close(con)
                TRUE
            },
            error = function(e) FALSE
        )

        if (ok) {
            cli::cli_alert_success("Usando mirror: {.url {url}}")
            return(c(CRAN = url))
        } else {
            cli::cli_alert_danger("Fall\u00F3 mirror: {.url {url}}")
        }
    }
    cli::cli_abort("Ning\u00FAn mirror disponible.")
}

#' @title Armar miniCRAN local
#' @description Función que arma un miniCRAN de manera local
#' @param pkgs Vector de caracteres. Espera los paquetes a instalar
#' @param path String. Espera la ruta donde deberá armarse el miniCRAN
#' @param so Vector de caracteres. Espera los sistemas operativos a
#' utilizar. Por defecto incluye los tres más importantes
#' @param mirrors Vector de caracteres. Puede especificarse una lista de mirrors a utilizar. Si no se
#' especifica usa los que trae por defecto
#' @return Devuelve una vector con los paquetes instalados+
#' @details Primero chequea el mirror a utilizar.
#' Luego crea el directorio donde almacenar el repositorio.
#' Luego obtiene las dependencias de los paquetes de acuerdo al SO a utilizar
#' Por ultimo descarga los paquetes necesarios y retorna un vector con los
#' paquetes descargados.
#' @examples
#' pkgs <- c(
#'     "rmarkdown", "moments", "pacman", "rio", "tidyverse", "emmeans",
#'     "car", "DescTools", "agricolae", "multcomp", "multcompView", "ggplot2"
#' )
#' path <- "/home/path_to_repo"
#' \dontrun{
#' mkminiCRAN(pkgs, path)
#' }
#' @importFrom miniCRAN pkgDep makeRepo
#' @importFrom rstudioapi getSourceEditorContext
#' @importFrom cli cli_alert_success cli_alert_danger cli_abort
#' @export
mkminiCRAN <- function(pkgs, path = NULL, so = c("windows", "linux", "macos"),
                       mirrors = NULL) {
    # require(miniCRAN) manejado por Roxygen
    # require(rstudioapi) manejado por Roxygen
    # Mirrors por defecto
    if (is.null(mirrors)) {
        mirrors <- c(
            "https://cran.rstudio.com",
            "https://cloud.r-project.org",
            "https://cran.ma.imperial.ac.uk",
            "https://cran.csiro.au"
        )
    }
    # Obtiene el primer mirror que funcione
    mirror <- check_mirrors(mirrors)

    # Crear el directorio del repositorio
    if (is.null(path)) {
        base_path <- paste0(dirname(getSourceEditorContext()$path), "/local_repo")
    } else {
        base_path <- paste0(path, "/local_repo")
    }
    dir.create(base_path, recursive = TRUE, showWarnings = FALSE)
    pkgList_src <- c()
    pkgList_win <- c()
    # Crear repositorio para mac y linux
    if (any(c("linux", "macos") %in% tolower(so))) {
        pkgList_src <- pkgDep(pkgs, type = "source", repos = mirror)
        makeRepo(pkgList_src, path = base_path, repos = mirror, type = "source")
    }
    # Crear repositorio para windows
    if ("windows" %in% tolower(so)) {
        pkgList_win <- pkgDep(pkgs, type = "win.binary", repos = mirror)
        makeRepo(pkgList_win, path = base_path, repos = mirror, type = "win.binary")
    }
    # Retornar la lista de paquetes instalados
    return(invisible(unique(c(pkgList_src, pkgList_win))))
}
