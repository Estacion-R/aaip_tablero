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

# Transformar los datos para apilar `ta` y `tp`
df_long <- df_transparencia_serie %>%
  pivot_longer(cols = c(ta, tp), names_to = "tipo_indice", values_to = "valor") %>% 
  mutate(
    tipo_indice = factor(tipo_indice, levels = c("tp", "ta"),
                         labels = c("Transparencia Proactiva", "Transparencia Activa"))
  )

# Crear un objeto SharedData para habilitar filtros dinámicos
shared_data <- SharedData$new(df_long)

# Filtro interactivo por sujeto obligado
filtro_so_unico <- filter_select(
  id = "sujeto_obligado_filter",
  label = "Sujeto Obligado",
  sharedData = shared_data, 
  multiple = FALSE, 
  allLevels = FALSE,
  group = ~sujeto_obligado
)

# Gráfico interactivo de barras apiladas con etiquetas abreviadas para el eje x
grafico_serie_tiempo <- plot_ly(shared_data) %>%
  add_trace(
    x = ~periodo_abreviado,  # Usar las etiquetas abreviadas
    y = ~valor,
    color = ~tipo_indice,  # Diferencia los segmentos por tipo de índice (TA y TP)
    colors = c("Transparencia Activa" = "#D81B60", "Transparencia Proactiva" = "#1E88E5"),  # Colores manuales
    type = "bar",
    text = ~paste(
      "Sujeto Obligado:", sujeto_obligado,
      "<br>Período:", periodo_abreviado,
      "<br>Tipo de Índice:", tipo_indice,
      "<br>Valor del Índice (IT):", round(it, 2),
      "<br>Segmento:", round(valor, 2)
    ),
    hoverinfo = "text",
    textposition = "none"  # Elimina texto sobre las columnas
  ) %>%
  layout(
    barmode = "stack",  # Barras apiladas
    title = "Composición por Sujeto Obligado, Período y Tipo de Índice",
    xaxis = list(title = "Período"),
    yaxis = list(title = "Valor Total (IT)")
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
        filtro_so_unico  # Filtro interactivo
      )
    ),
    tagList(
      grafico_serie_tiempo %>% htmltools::browsable() %>% tagAppendAttributes(id = "grafico")
    )
  )
)

# Renderizar la tarjeta con preselección en el filtro
browsable(
  tagList(
    tags$head(
      tags$title("Barras Apiladas con Preselección"),
      tags$script(HTML("
        $(document).ready(function() {
          // Preseleccionar 'Agencia de Planificación (APLA)' en el filtro
          document.getElementById('sujeto_obligado_filter').getElementsByClassName('selectized')[0].selectize.setValue('Agencia de Planificación (APLA)', false);
        });
      "))  # Incluir el JavaScript para preselección
    ),
    tarjeta_serie_tiempo
  )
)
