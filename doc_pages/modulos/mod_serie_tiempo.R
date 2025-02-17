# Carga de paquetes
library(plotly)
library(dplyr)
library(tidyr)
library(crosstalk)
library(htmltools)
library(bslib)

# Datos de ejemplo con dos trimestres
df_transparencia_serie <- df_transparencia %>% 
  mutate(periodo_abreviado = paste0(periodo_anio, " - T", periodo_mes))


# Crear un objeto SharedData para habilitar filtros dinámicos
shared_data <- SharedData$new(df_transparencia_serie)

# Filtro de selección de sujeto obligado
filtro_so <- filter_select(
  id = "sujeto_obligado_filter",
  label = "Sujeto Obligado",
  sharedData = shared_data, 
  multiple = FALSE, 
  allLevels = FALSE,
  group = ~sujeto_obligado
)

# Crear el gráfico estilo lollipop (sin línea de conexión)
grafico_it_lollipop <- plot_ly(shared_data) %>%
  # Líneas verticales (Lollipop)
  add_segments(
    x = ~periodo_abreviado, 
    xend = ~periodo_abreviado, 
    y = 0, 
    yend = ~it,
    line = list(color = "#008585", width = 2, dash = "solid"),  # Líneas minimalistas
    hoverinfo = "none"
  ) %>%
  # Puntos (Lollipop) con etiquetas
  add_trace(
    x = ~periodo_abreviado, 
    y = ~it, 
    type = "scatter",
    mode = "markers+text",  # Puntos con etiquetas
    marker = list(size = 10, color = "#008585"),  # Puntos en verde principal
    text = ~it,  # Mostrar el valor del índice
    textposition = "top center",  # Posición de la etiqueta sobre el punto
    textfont = list(size = 12, color = "#333333"),  # Estilo de la etiqueta
    hoverinfo = "text",
    hovertext = ~paste("Período:", periodo_abreviado, "<br>Índice de Transparencia:", it)
  ) %>%
  layout(
    title = "Evolución del Índice de Transparencia por Sujeto Obligado",
    xaxis = list(title = "Período"),
    yaxis = list(title = "Índice de Transparencia (IT)", range = c(0, 100)),
    showlegend = FALSE,
    plot_bgcolor = "white"
  )

# Armar tarjeta con el gráfico y el filtro
tarjeta_serie_tiempo <- card(
  card_header("Agencia de Acceso a la Información Pública / Índice de Transparencia (IT)"),
  layout_sidebar(
    fillable = TRUE,
    sidebar = sidebar(
      title = "Filtros",
      width = "25%",
      layout_columns(
        filtro_so  # Filtro interactivo
      )
    ),
    tagList(
      grafico_it_lollipop %>% 
        htmltools::browsable() %>% 
        tagAppendAttributes(id = "grafico")
    )
  )
)

# Renderizar la tarjeta con preselección en el filtro
# browsable(
#   tagList(
#     tags$head(
#       tags$title("Barras Apiladas con Preselección"),
#       tags$script(HTML("
#         $(document).ready(function() {
#           // Preseleccionar 'Agencia de Planificación (APLA)' en el filtro
#           document.getElementById('sujeto_obligado_filter').getElementsByClassName('selectized')[0].selectize.setValue('Agencia de Planificación (APLA)', false);
#         });
#       "))  # Incluir el JavaScript para preselección
#     ),
#     tarjeta_serie_tiempo
#   )
# )
