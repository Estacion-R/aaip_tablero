# Cargar librerías necesarias
library(plotly)
library(dplyr)
library(crosstalk)

# Datos de ejemplo
df_transparencia <- data.frame(
  periodo_abreviado = c("2024 - T2", "2024 - T3", "2025 - T1", "2025 - T2"),
  sujeto_obligado = c("Administración de Parques Nacionales", "Administración de Parques Nacionales", 
                      "Administración de Parques Nacionales", "Administración de Parques Nacionales"),
  it = c(82, 76, 79, 85) # Índice de Transparencia
)

# Crear objeto de datos compartidos para filtros
shared_data <- SharedData$new(df_transparencia)

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

# Mostrar gráfico
grafico_it_lollipop
