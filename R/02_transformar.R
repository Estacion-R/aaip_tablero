
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                        Armo var de periodo                        ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
df_transparencia <- df_transparencia %>% 
  mutate(periodo_mes = parse_number(periodo),
         periodo_anio = str_extract(periodo, "(?<=Trimestre )\\d+"),
         periodo_tot = paste0(periodo_anio, "_", periodo_mes),
         across(.cols = c(starts_with("periodo"), "tipo_de_so", "sujeto_obligado"), as.factor)) %>% 
  relocate(periodo_tot, periodo_anio, periodo_mes, .after = periodo) %>% 
  relocate(it, .after = sujeto_obligado) %>% 
  arrange(periodo_anio, periodo_mes, tipo_de_so, sujeto_obligado)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                        tabla con promedios total                        ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
df_transparencia_tot <- df_transparencia %>% 
  summarise(
    it = mean(it),
    ta = mean(ta),
    tp = mean(tp),
    .by = c("periodo_anio", "periodo_mes"))




##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                          df para interacción con filtros                 ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Armo df para generar interacción con los filtros
shared_df_transparencia <- SharedData$new(df_transparencia)


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                     df para Índice por tipo (TA y TP)                    ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# df_transparencia_x_tipo_trab <- df_transparencia_x_tipo_orig %>% 
#   select(-it) %>% 
#   pivot_longer(cols = c(ta_90_10, tp_90_10))
# 
# # Armo df para generar interacción con los filtros
# shared_df_transparencia_x_tipo <- SharedData$new(df_transparencia_x_tipo_trab)
#   
#   
  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                          df para Índice por dimensión                    ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # Preparo df de TA
df_transparencia_dim_ta <- df_transparencia_dim_ta_orig %>%
  pivot_longer(cols = 4:16,
               names_to = "dimension_nombre",
               values_to = "dimension_valor") %>%
  mutate(tipo_transparencia = "Transparencia Activa") %>%
  rename("indice_gral_valor" = TA)

# # Preparo df de TP
df_transparencia_dim_tp <- df_transparencia_dim_tp_orig %>%
  pivot_longer(cols = 4:10,
               names_to = "dimension_nombre",
               values_to = "dimension_valor") %>%
  mutate(tipo_transparencia = "Transparencia Proactiva") %>%
  rename("indice_gral_valor" = TP)
 
df_transparencia_dimension <- bind_rows(
  df_transparencia_dim_ta,
  df_transparencia_dim_tp) %>% 
  clean_names() %>% 
  select(-indice_gral_valor) %>% 
  mutate(periodo_mes = parse_number(periodo),
         periodo_anio = str_extract(periodo, "(?<=Trimestre )\\d+"),
         periodo_tot = paste0(periodo_anio, "_", periodo_mes),
         across(.cols = c(starts_with("periodo"), "tipo_de_so", "sujeto_obligado"), as.factor),
         dimension_valor = dimension_valor * 100) %>% 
  relocate(periodo_tot, periodo_anio, periodo_mes, .after = periodo, tipo_de_so) %>% 
  arrange(periodo_anio, periodo_mes, tipo_de_so, sujeto_obligado, dimension_nombre)


# Armo df para generar interacción con los filtros
shared_df_transparencia_x_dim <- SharedData$new(df_transparencia_dimension)
