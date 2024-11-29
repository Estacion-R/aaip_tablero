
format_nmb <- function(value){
  value <- prettyNum(value, big.mark = ',', decimal.mark = '.')
  return(value)
}

armar_tabla <- function(df){
  reactable(
    df,
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
                                 tipo_de_so <- df$data()$tipo_de_so[index]
                                 #tipo_de_so <- df$tipo_de_so[index]
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
      ta = colDef(name = "Transparencia Activa",
                  cell = gauge_chart(tooltip = TRUE,
                                     data = df$data(),
                                     fill_color = c('#D7191C','#FDAE61','#FFFFBF','#A6D96A','#1A9641'),
                                     background = 'grey',
                                     bold_text = TRUE,
                                     text_size = 13,
                                     show_min_max = TRUE
                  )
      ),
      tp = colDef(name = "Transparencia Proactiva",
                  cell = gauge_chart(tooltip = TRUE,
                                     data = df$data(),
                                     fill_color = c('#D7191C','#FDAE61','#FFFFBF','#A6D96A','#1A9641'),
                                     background = 'grey',
                                     bold_text = TRUE,
                                     text_size = 13,
                                     show_min_max = TRUE
                  )
      ),
      it = colDef(name = "Índice de Transparencia",
                  cell = gauge_chart(tooltip = TRUE,
                                     data = df$data(),
                                     fill_color = c('#D7191C','#FDAE61','#FFFFBF','#A6D96A','#1A9641'),
                                     background = 'grey',
                                     bold_text = TRUE,
                                     text_size = 13,
                                     show_min_max = TRUE
                  )
      )
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
}
