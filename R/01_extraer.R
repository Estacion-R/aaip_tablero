
### Cargo base
df_transparencia <- readxl::read_xlsx("data/output_visualizaciones_2024-09-11.xlsx") %>% 
  clean_names()
