library(here)

# Libraries
source(here("R/00_librerias.R"))

# Data extraction
source(here("R/01_extraer.R"))

# Data Transformation
source(here("R/02_transformar.R"))

df <- SharedData$new(df_transparencia)

armar_tabla(df = df, tabla_nro = 1)
