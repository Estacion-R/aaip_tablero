library(ggplot2)
library(plotly)
library(dplyr)
library(tidyr)

library(ggplot2)
library(plotly)
library(dplyr)
library(tidyr)

# Create the ggplot object
grafico <- df_transparencia_tot %>% 
  filter(periodo_anio == 2025) %>%
  filter(periodo_mes == 2) %>% 
  pivot_longer(cols = c(it, ta, tp), names_to = "tipo_indice", values_to = "valor") %>%
  mutate(tipo_indice = factor(tipo_indice, levels = rev(c("it", "ta", "tp")),
                              labels = rev(c("Índice de Transparencia", "Transparencia Activa", "Transparencia Proactiva")))) %>%
  ggplot(aes(x = valor, 
             y = tipo_indice,
             fill = tipo_indice)) +
  geom_col() +
  scale_fill_manual(values = c("Índice de Transparencia" = color_violeta, 
                               "Transparencia Activa" = color_magenta, 
                               "Transparencia Proactiva" = color_celeste)) +
  theme(legend.position = "bottom")  # Move legend to the bottom

# Convert to plotly and remove mode bar
ggplotly(grafico) %>%
  layout(
    legend = list(orientation = "h", x = 0.5, xanchor = "center"),  # Center legend below chart
    margin = list(b = 80)  # Add bottom margin for legend spacing
  ) %>%
  config(displayModeBar = FALSE)  # Hide the Plotly menu bar


# Definimos el contenido del 1er trimestre como un objeto
tarjeta_global_trim1 <- 
  card_body(
    layout_column_wrap(
      width = 1/2,
      card(
        tags$div(
          style = "display: flex; justify-content: center; align-items: center; height: 100%;",
          tags$img(
            src = "doc_pages/img/indice_medicion.png",  # Ruta al gráfico
            style = "max-width: 80%; height: auto;"  # Escalado responsivo
          )
        )
      ),
      
      
      # Convert ggplot to ggplotly
      ggplotly(grafico) %>%
        layout(
          legend = list(orientation = "h", x = 0.5, xanchor = "center"),  # Center legend below chart
          margin = list(b = 80)  # Add bottom margin for legend spacing
        ) %>%
        config(displayModeBar = FALSE)  # Hide the Plotly menu bar
    )
      
    
    # Segunda fila: Tabla y barra lateral
    # layout_column_wrap(
    #   width = 1,
    #   card(
    #     card_header("Transparencia"),
    #     card_body("TArjeta 1"), 
    #     card_body("TArjeta 2")
    #   )
    # )
  )

browsable(tarjeta_global_trim1)
