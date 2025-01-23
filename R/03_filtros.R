

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                ghg_targets                               ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Filtro por anio
filtro_anio <- filter_select(
  id = "anio",
  label = "Año",
  sharedData = shared_df_transparencia,
  group = ~ periodo_anio,
  allLevels = FALSE
)

# Filtro por trimestre
filtro_trim <- filter_select(
  id = "trim",
  label = "Trimestre",
  sharedData = shared_df_transparencia,
  group = ~ periodo_mes,
  allLevels = FALSE
)


# Filtro por sujeto obligado
filtro_so <- filter_select(
  id = "so",
  label = "Sujeto Obligado",
  sharedData = shared_df_transparencia,
  group = ~ sujeto_obligado,
  allLevels = FALSE
)

filtro_tipo_so <- filter_select(
  id = "tipo_so",
  label = "Tipo de Sujeto Obligado",
  sharedData = shared_df_transparencia,
  group = ~ tipo_de_so,
  allLevels = FALSE
  )



