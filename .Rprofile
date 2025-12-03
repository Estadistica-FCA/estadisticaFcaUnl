if (interactive() && Sys.getenv("TERM_PROGRAM") == "vscode") {
    if ("httpgd" %in% .packages(all.available = TRUE)) {
        options(vsc.plot = FALSE)
        options(device = function(...) {
            httpgd::hgd()
            .vsc.browser(httpgd::hgd_url(), viewer = "Beside")
        })
    }
    # Configurar ayuda para que se abra en navegador externo
    options(vsc.helpPanel = "Two")

    source(file.path(Sys.getenv("HOME"), ".vscode-R", "init.R"))
}
