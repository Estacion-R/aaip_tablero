

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                        tabla con promedios total                        ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
df_transparencia_tot <- df_transparencia %>% 
  summarise(
    it = mean(it),
    ta = mean(ta),
    tp = mean(tp))


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                          df para interacción con filtros                 ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Armo df para generar interacción con los filtros
shared_df_transparencia <- SharedData$new(df_transparencia %>% 
                                            relocate(it, .after = sujeto_obligado))



##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                          df para Índice por dimensión                    ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Preparo df de TA
df_transparencia_dimension_ta <- df_transparencia_dimension_ta_orig %>% 
  pivot_longer(cols = starts_with("x"),
               names_to = "dimension_nombre",
               values_to = "dimension_valor") %>% 
  mutate(tipo_transparencia = "Transparencia Activa") %>% 
  rename("indice_gral_valor" = ta)

# Preparo df de TP
df_transparencia_dimension_tp <- df_transparencia_dimension_tp_orig %>% 
  pivot_longer(cols = starts_with("x"),
               names_to = "dimension_nombre",
               values_to = "dimension_valor") %>% 
  mutate(tipo_transparencia = "Transparencia Proactiva") %>% 
  rename("indice_gral_valor" = tp)

df_transparencia_dimension <- bind_rows(
  df_transparencia_dimension_ta,
  df_transparencia_dimension_tp
) %>% 
  mutate(dimension_nombre = str_remove_all(dimension_nombre, "x"),
         dimension_nombre = str_replace(dimension_nombre, "_", " - "),
         dimension_nombre = str_replace_all(dimension_nombre, "_", " "),
         dimension_nombre = str_to_sentence(dimension_nombre))
