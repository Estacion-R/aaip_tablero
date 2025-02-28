
# Definimos el contenido del 1er trimestre como un objeto
tarjeta_global <- 
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
      card(
        tarjeta_indice_global(titulo = "Índice de Transparencia", 
                              periodo_actual = "2025 - T2", periodo_anterior = "2025 - T1", 
                              valor_indice_anterior = 70, valor_indice_actual = 75)
      )
    )
  )
    
    #browsable(tarjeta_global_trim1)
    