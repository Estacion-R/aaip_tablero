library(here)

# Libraries
source(here("R/00_librerias.R"))

# Data extraction
source(here("R/01_extraer.R"))

# Data Transformation
source(here("R/02_transformar.R"))

df <- df_transparencia

reactable(
  df %>% 
    relocate(it, .after = sujeto_obligado),
  defaultColDef = colDef(
    na = '-', 
    align = "left",
    vAlign = 'center',
    style = list(fontSize = '0.7rem'),
    headerStyle = list(fontSize = '1rem')
  ),
  columns = list(
    periodo = colDef(show = FALSE),
    sujeto_obligado = colDef(name = "Sujeto Obligado",
                  cell = function(value, index) {
                    #country <- df$data()$country[index]
                    #region <- df$data()$region[index]
                    tipo_de_so <- df$tipo_de_so[index]
                    div(div(style = "font-weight: 600", value),
                        div(style = "font-size: 0.75rem;color:grey", tipo_de_so))}
    ),
    tipo_de_so = colDef(name = "Tipo de Sujeto Obligado", 
                     show = FALSE,
                     #minWidth = names,
                     sticky = "left",
                     #style = sticky_style,
                     #headerStyle = sticky_style
                     ),
    it = colDef(name = "Índice de Transparencia",
                cell = data_bars(df, 
                                 text_position = "above",
                                 number_fmt = scales::number,
                                 max_value = 100, 
                                 background = "lightgrey")),
    ta = colDef(name = "Transparencia Activa",
                cell = data_bars(df, 
                                 text_position = "above",
                                 number_fmt = scales::number,
                                 max_value = 100, 
                                 background = "lightgrey")),
    tp = colDef(name = "Transparencia Proactiva",
                cell = data_bars(df, 
                                 text_position = "above",
                                 number_fmt = scales::number,
                                 max_value = 100, 
                                 background = "lightgrey"))
    # ta = colDef(name = "Transparencia Activa",
    #             #minWidth = values,
    #             #format = colFormat(separators = TRUE, digits = 0),
    #             show = TRUE),
    # tp = colDef(name = "Transparencia Proactiva", 
    #             show = TRUE),
    # it = colDef(name = "Índice de Transparencia", 
    #             show = TRUE)
    # ta = colDef(name = "Transparencia Activa",
    #             cell = gauge_chart(tooltip = TRUE,
    #                                data = df,
    #                                fill_color = c('#D7191C','#FDAE61','#FFFFBF','#A6D96A','#1A9641'),
    #                                background = 'grey',
    #                                bold_text = TRUE,
    #                                text_size = 13,
    #                                show_min_max = TRUE
    #             )
    # ),
    # tp = colDef(name = "Transparencia Proactiva",
    #             cell = gauge_chart(tooltip = TRUE,
    #                                data = df,
    #                                fill_color = c('#D7191C','#FDAE61','#FFFFBF','#A6D96A','#1A9641'),
    #                                background = 'grey',
    #                                bold_text = TRUE,
    #                                text_size = 13,
    #                                show_min_max = TRUE
    #             )
    # ),
    # it = colDef(name = "Índice de Transparencia",
    #             cell = gauge_chart(tooltip = TRUE,
    #                                data = df,
    #                                fill_color = c('#D7191C','#FDAE61','#FFFFBF','#A6D96A','#1A9641'),
    #                                background = 'grey',
    #                                bold_text = TRUE,
    #                                text_size = 13,
    #                                show_min_max = TRUE
    #             )
    # )
  ),
  # Estilo de la tabla
  style = list(fontFamily = "Roboto", fontSize = "0.875rem"),
  borderless = TRUE,
  striped = FALSE,
  bordered = FALSE,
  highlight = TRUE,
  outlined = TRUE,
  wrap = TRUE,
  filterable = FALSE,
  showPageSizeOptions = TRUE,
  theme = reactableTheme(
    headerStyle = list(
      "&:hover[aria-sort]" = list(background = "hsl(0, 0%, 96%)"),
      "&[aria-sort='ascending'], &[aria-sort='descending']" = list(background = "hsl(0, 0%, 96%)"),
      borderColor = "#555")
  ),
  elementId = "indice-tabla"
)
