
### Cargo base índices generales
df_transparencia <- readxl::read_xlsx("data/output_visualizaciones_2024-09-11.xlsx", sheet = 1) %>% 
  clean_names()


### Cargo base por dimensión

# Transparencia Activa
df_transparencia_dimension_ta_orig <- readxl::read_xlsx("data/output_visualizaciones_2024-09-11.xlsx", sheet = 2) %>% 
  clean_names()

# Transparencia Proactiva
df_transparencia_dimension_tp_orig <- readxl::read_xlsx("data/output_visualizaciones_2024-09-11.xlsx", sheet = 3) %>% 
  clean_names()
