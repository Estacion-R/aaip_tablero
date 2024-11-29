

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                ghg_targets                               ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# 
# # send the group to the filtering selection box
filtro_so <- filter_select(
  id = "so",
  label = "Sujeto Obligado",
  sharedData = shared_df_transparencia,
  group = ~ sujeto_obligado
)
# 
# country_filter <- filter_select(
#   id = "country",
#   label = "Country",
#   sharedData = shared_df_targets,
#   group = ~ country
# )
# 
# region_filter <- filter_select(
#   id = "region",
#   label = "Region",
#   sharedData = shared_df_targets,
#   group = ~ region
# )
# 
# 
# #...............................df...............................
# tb_city_targets <- df_targets_clean |> 
#   right_join(df_cities) |> 
#   group_by(city) |> 
#   mutate(row_val = row_number(),
#          has_cap = case_when(is.na(overview) & row_val == 1 ~ "❌",
#                              !is.na(overview) & row_val == 1 ~ "✅"),
#          reduction_value = case_when(reduction_value == "Net zero / carbon neutrality by 2,050" ~ 100,
#                                      .default = as.numeric(reduction_value)))
# 
# 
# 
# #............................Shared df...........................
# # set up a group of SharedData objects
# shared_df_summary <- SharedData$new(tb_city_targets|> 
#                                       select(city, country, region, has_cap, target_year, target_conditionality,
#                                              reduction_value, year_of_implementation))
# 
# 
# #............................Filters.............................
# # send the group to the filtering selection box
# city_filter_summary <- filter_select(
#   id = "city",
#   label = "City",
#   sharedData = shared_df_summary,
#   group = ~ city
# )
# 
# country_filter_summary <- filter_select(
#   id = "country",
#   label = "Country",
#   sharedData = shared_df_summary,
#   group = ~ country
# )
# 
# region_filter_summary <- filter_select(
#   id = "region",
#   label = "Region",
#   sharedData = shared_df_summary,
#   group = ~ region
# )
# 
# conditionality_filter_summary <- filter_select(
#   id = "target_conditionality",
#   label = "Target Conditionality",
#   sharedData = shared_df_summary,
#   group = ~ target_conditionality
# )
# 
# year_imp_filter_summary <- filter_select(
#   id = "year_of_implementation",
#   label = "Year of implementation",
#   sharedData = shared_df_summary,
#   group = ~ year_of_implementation
# )
# 
# year_target_summary <- filter_select(
#   id = "target_year",
#   label = "Target year",
#   sharedData = shared_df_summary,
#   group = ~ target_year
# )
# 
# 
