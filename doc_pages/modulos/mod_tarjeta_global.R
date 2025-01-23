
# Definimos el contenido del 1er trimestre como un objeto
tarjeta_global_trim1 <- 
  card_body(
    layout_column_wrap(
      width = 1/2,
      card(
        "Indicadores clave del 1er trimestre",
        "DECIDIR QUÉ PONER AQUÍ"
      ),
      tags$div(
        style = "display: flex; justify-content: center; align-items: center; height: 100%;",
        tags$img(
          src = "../output_graficos/viz_tot.png",  # Ruta al gráfico
          style = "max-width: 80%; height: auto;"  # Escalado responsivo
        )
      )
    ),
    
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
