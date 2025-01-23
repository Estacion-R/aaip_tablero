# Carga de paquetes
library(plotly)
library(dplyr)
library(tidyr)
library(crosstalk)
library(htmltools)
library(bslib)

# Datos con casos reales y ajustados
df_transparencia_serie <- data.frame(
  periodo = rep(c("2do Trimestre 2024 (Abril - Junio)",
                  "4to Trimestre 2024 (Octubre - Diciembre)",
                  "1er Trimestre 2025 (Enero - Marzo)"), each = 1),
  periodo_tot = rep(c("2024_2", "2024_4", "2025_1"), each = 1),
  periodo_anio = c("2024", "2024", "2025"),
  periodo_mes = c("2", "4", "1"),
  tipo_de_so = rep("Entes del Sector Público Nacional", 3),
  sujeto_obligado = rep("Agencia de Planificación (APLA)", 3),
  it = c(44.2, 43.5, 77.9), # Índice total (altura de la barra)
  ta = c(43.3, 43.1, 84.1), # Categoría TA
  tp = c(51.7, 47.2, 22.2)  # Categoría TP
)

# Crear etiquetas abreviadas para el período
df_transparencia_serie <- df_transparencia_serie %>%
  mutate(periodo_abreviado = case_when(
    periodo == "2do Trimestre 2024 (Abril - Junio)" ~ "2024 - T2",
    periodo == "4to Trimestre 2024 (Octubre - Diciembre)" ~ "2024 - T4",
    periodo == "1er Trimestre 2025 (Enero - Marzo)" ~ "2025 - T1",
    TRUE ~ periodo
  ))

# Transformar los datos para apilar `TA` y `TP`
df_long <- df_transparencia_serie %>%
  pivot_longer(cols = c(ta, tp), names_to = "tipo_indice", values_to = "valor")

# Crear un objeto SharedData para habilitar filtros dinámicos
shared_data <- SharedData$new(df_long)

# Filtro interactivo por sujeto obligado
filtro_so <- filter_select(
  id = "sujeto_obligado_filter",
  label = "Sujeto Obligado",
  sharedData = shared_data,
  group = ~sujeto_obligado
)

# Gráfico interactivo de barras apiladas con etiquetas abreviadas para el eje x
grafico_serie_tiempo <- plot_ly(shared_data) %>%
  add_trace(
    x = ~periodo_abreviado,  # Usar las etiquetas abreviadas
    y = ~valor,
    color = ~tipo_indice,  # Diferencia los segmentos por tipo de índice (TA y TP)
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

# Armar tarjeta con el gráfico, filtro y botón de descarga
tarjeta_serie_tiempo <- card(
  card_header("Agencia de Acceso a la Información Pública / Índice de Transparencia (IT)"),
  layout_sidebar(
    fillable = TRUE,
    sidebar = sidebar(
      title = "Filtros",
      width = "25%",
      layout_columns(
        filtro_so  # Filtro interactivo
      ),
      tags$button(
        "Descargar gráfico",
        class = "btn btn-primary",
        style = "margin-top: 10px;",
        onclick = "Plotly.downloadImage(document.getElementById('grafico'), {format: 'png', filename: 'grafico_filtrado'})"
      )  # Botón de descarga
    ),
    tagList(
      grafico_serie_tiempo %>% htmltools::browsable() %>% tagAppendAttributes(id = "grafico")
    )
  )
)

# Renderizar la tarjeta
browsable(
  tagList(
    tags$head(
      tags$title("Barras Apiladas con Botón de Descarga"),
      tags$script(HTML("
        $(document).ready(function() {
          document.getElementById('sujeto_obligado_filter').getElementsByClassName('selectized')[0].selectize.setValue('Agencia de Planificación (APLA)', false);
        });
      "))  # Incluir el JavaScript para preselección
    ),
    tarjeta_serie_tiempo
  )
)
