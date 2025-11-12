
# StatDash Pro - Installation des dépendances
# Exécutez ce script pour installer tous les packages nécessaires

required_packages <- c(
  "shiny", "shinydashboard", "DT", "dplyr", "purrr",
  "corrplot", "ggplot2", "plotly", "readxl", "broom",
  "forecast", "car", "shinyjs", "FactoMineR", "factoextra",
  "dbscan", "cluster", "flexdashboard", "Factoshiny",
  "tseries", "dendextend", "ggdendro", "shinydashboardPlus"
)

# Fonction pour installer les packages manquants
install_if_missing <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    message("Installation de ", pkg)
    install.packages(pkg, dependencies = TRUE)
  } else {
    message(pkg, " est déjà installé")
  }
}

# Installation de tous les packages
message("Vérification et installation des packages requis...")
lapply(required_packages, install_if_missing)

# Vérification finale
message("\nVérification finale...")
missing_packages <- required_packages[!sapply(required_packages, requireNamespace, quietly = TRUE)]

if (length(missing_packages) == 0) {
  message("✅ Tous les packages sont installés avec succès!")
} else {
  message("❌ Packages manquants: ", paste(missing_packages, collapse = ", "))
}

