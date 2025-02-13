

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                ghg_targets                               ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

################################# Filtros Por Sujeto Obligado #################################
# Filtro por anio
filtro_x_so_anio <- filter_select(
  id = "anio",
  label = "Año",
  sharedData = shared_df_transparencia,
  group = ~ periodo_anio,
  allLevels = FALSE
)

# Filtro por trimestre
filtro_x_so_trim <- filter_select(
  id = "trim",
  label = "Trimestre",
  sharedData = shared_df_transparencia,
  group = ~ periodo_mes,
  allLevels = FALSE
)


# Filtro por sujeto obligado
filtro_x_so_so <- filter_select(
  id = "so",
  label = "Sujeto Obligado",
  sharedData = shared_df_transparencia,
  group = ~ sujeto_obligado,
  allLevels = FALSE
)

filtro_x_so_tipo_so <- filter_select(
  id = "tipo_so",
  label = "Tipo de Sujeto Obligado",
  sharedData = shared_df_transparencia,
  group = ~ tipo_de_so,
  allLevels = FALSE
  )


################################# Filtros Por dimensión #################################


# Filtro por sujeto obligado
filtro_x_dim_so <- filter_select(
  id = "so",
  label = "Sujeto Obligado",
  sharedData = shared_df_transparencia_x_dim, 
  multiple = FALSE,
  group = ~ sujeto_obligado,
  allLevels = FALSE
)

# Filtro por dimension
filtro_x_dim_tipo_transparencia <- filter_select(
  id = "tipo_transp",
  label = "Tipo de Transparencia",
  sharedData = shared_df_transparencia_x_dim, 
  multiple = FALSE,
  group = ~ tipo_transparencia,
  allLevels = FALSE
)
