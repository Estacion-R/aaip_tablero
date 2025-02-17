source("R/00_librerias.R")

url_base <- "output_visualizaciones_2025-01-11_simulacion_serie.xlsx"

### Cargo base índices generales
df_transparencia <- readxl::read_xlsx(glue("data/{url_base}"), sheet = 1) %>% 
  clean_names()


### Cargo base por dimensión

# Transparencia Activa
df_transparencia_dim_ta_orig <- readxl::read_xlsx(glue("data/{url_base}"), sheet = 3)

# Transparencia Proactiva
df_transparencia_dim_tp_orig <- readxl::read_xlsx(glue("data/{url_base}"), sheet = 4)
