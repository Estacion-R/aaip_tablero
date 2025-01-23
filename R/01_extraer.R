source("R/00_librerias.R")

### Cargo base índices generales
df_transparencia <- readxl::read_xlsx("data/output_visualizaciones_2025-01-11_simulacion_serie.xlsx", sheet = 1) %>% 
  clean_names()


### Cargo base por dimensión

# Transparencia Activa
df_transparencia_x_tipo_orig <- readxl::read_xlsx("data/output_visualizaciones_2024-12-05.xlsx", sheet = 2) %>% 
  clean_names()

# Transparencia Proactiva
df_transparencia_dimension_tp_orig <- readxl::read_xlsx("data/output_visualizaciones_2024-09-11.xlsx", sheet = 3) %>% 
  clean_names()
