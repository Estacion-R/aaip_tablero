
format_nmb <- function(value){
  value <- prettyNum(value, big.mark = ',', decimal.mark = '.')
  return(value)
}

armar_tabla <- function(df, tabla_nro){
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
      periodo_tot = colDef(show = FALSE),
      periodo_anio = colDef(name = "Año",
                            width = 60),
      periodo_mes = colDef(name = "Trimestre", 
                           width = 60),
      sujeto_obligado = colDef(name = "Sujeto Obligado",
                               cell = function(value, index) {
                                 tipo_de_so <- df$data()$tipo_de_so[index]
                                 #tipo_de_so <- df$tipo_de_so[index]
                                 div(div(style = "font-size: 0.8rem;font-weight: 600", value),
                                     div(style = "font-size: 0.7rem;color:grey", tipo_de_so))}
      ),
      tipo_de_so = colDef(name = "Tipo de Sujeto Obligado", 
                          show = FALSE,
                          #minWidth = names,
                          sticky = "left",
                          #style = sticky_style,
                          #headerStyle = sticky_style
      ),
      it = colDef(name = "Índice de Transparencia",
                  cell = data_bars(df$data(), 
                                   text_position = "above",
                                   number_fmt = scales::number,
                                   max_value = 100, 
                                   bar_height = 25,
                                   fill_color = color_violeta,
                                   background = "lightgrey")),
      ta = colDef(name = "Transparencia Activa",
                  cell = data_bars(df$data(), 
                                   text_position = "above",
                                   number_fmt = scales::number,
                                   max_value = 100, 
                                   bar_height = 10,
                                   fill_color = color_magenta,
                                   background = "lightgrey")),
      tp = colDef(name = "Transparencia Proactiva",
                  cell = data_bars(df$data(), 
                                   text_position = "above",
                                   number_fmt = scales::number,
                                   max_value = 100, 
                                   bar_height = 10,
                                   fill_color = color_celeste,
                                   background = "lightgrey"))
    ),
    # Estilo de la tabla
    style = list(fontFamily = "Roboto", fontSize = "0.875rem"),
    borderless = TRUE,
    striped = FALSE,
    bordered = FALSE,
    highlight = TRUE,
    outlined = TRUE,
    wrap = TRUE,
    defaultSorted = list(it = "desc", ta = "desc", tp = "desc", tipo_de_so = "asc", sujeto_obligado = "asc"),
    filterable = FALSE,
    showPageSizeOptions = TRUE,
    theme = reactableTheme(
      headerStyle = list(
        "&:hover[aria-sort]" = list(background = "hsl(0, 0%, 96%)"),
        "&[aria-sort='ascending'], &[aria-sort='descending']" = list(background = "hsl(0, 0%, 96%)"),
        borderColor = "#555")
    ),
    elementId = glue::glue("indice-tabla-{tabla_nro}")
  )
}




#### Gráfico de Dona

armar_dona <- function(value, font_family, text_size = 12) {
  
  # Armo formato para gráfico tipo "pie"
  df <- tibble(x = 1, y = value) %>% 
    mutate(y_negative = 1 - y) %>% 
    pivot_longer(cols = -x) 
  
  # Doy formato al valor
  big_number_text_label <- format(round(value, digits = 1), 
                                  big.mark = ".", 
                                  decimal.mark = ",")
  ## Armo gráfico
  ggplot(df,
         aes(x = x,
             y = value,
             fill = name)) +
    geom_col(show.legend = FALSE) +
    coord_polar(theta = "y",
                direction = -1) +
    xlim(c(-2, 2)) +
    scale_fill_manual(values = c(ifelse(value <= 30, "red", 
                                        ifelse(value > 30 & value <= 60, "orange", "green")), "grey90")) +
    
    # Set theme_void() to remove grid lines and everything else from the plot
    theme_void() +
    
    # Add the big number in the center of the hole
    annotate("text",
             label = big_number_text_label,
             family = font_family,
             fontface = "bold",
             color = ifelse(value <= 30, "red", 
                            ifelse(value > 30 & value <= 60, "orange", "green")),
             size = text_size,
             x = -2,
             y = 0)
  
}
