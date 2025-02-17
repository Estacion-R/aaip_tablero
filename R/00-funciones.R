
format_nmb <- function(value){
  value <- prettyNum(value, big.mark = ',', decimal.mark = '.')
  return(value)
}

armar_tabla_x_so <- function(df, tabla_nro){
  reactable(
    df,
    defaultColDef = colDef(
      na = '-', 
      align = "left",
      vAlign = 'center',
      style = list(fontSize = '0.7rem'),
      headerStyle = list(fontSize = '0.9rem')
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
    columnGroups = list(
      colGroup(name = "Subíndices", columns = c("ta", "tp"))
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
    # theme = reactableTheme(
    #   headerStyle = list(
    #     "&:hover[aria-sort]" = list(background = "hsl(0, 0%, 96%)"),
    #     "&[aria-sort='ascending'], &[aria-sort='descending']" = list(background = "hsl(0, 0%, 96%)"),
    #     borderColor = "#555")
    # ),
    elementId = glue::glue("indice-tabla-{tabla_nro}")
  )
}


armar_tabla_x_dimension <- function(df, tabla_nro){
  reactable(
    df,
    defaultColDef = colDef(
      na = '-', 
      align = "left",
      vAlign = 'center',
      style = list(fontSize = '0.7rem'),
      headerStyle = list(fontSize = '0.9rem')
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
      dimension_nombre = colDef(name = "Dimensión"),
      dimension_valor = colDef(name = "Puntaje",
                               cell = data_bars(df$data(), 
                                                text_position = "above",
                                                number_fmt = scales::number,
                                                max_value = 1, 
                                                bar_height = 10,
                                                fill_color = color_magenta,
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
    defaultSorted = list(dimension_nombre = "asc"),
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



tarjeta_indice_global <- function(titulo, 
                               valor_indice_actual, 
                               valor_indice_anterior, 
                               periodo_anterior, 
                               periodo_actual) {
  
  diferencia_periodo_ant_porc <- (valor_indice_actual - valor_indice_anterior) / valor_indice_anterior * 100
  
  ### Define color and sentence for comparisson between emissions target and actuals
  if(valor_indice_actual >= 0 & valor_indice_actual <= 10){
    target_color <- "green"
    #text_target_status <- "above emissions target (on target)"
    
  } else if(valor_indice_actual < 0) {
    target_color <- c40_colors("green")
    #text_target_status <- "below emissions target (on target)"
    
  } else if(valor_indice_actual >= 10 & valor_indice_actual <= 20){
    target_color <- "yellow"
    #text_target_status <- "above emissions target (close to target)"
    
  } else if(valor_indice_actual > 20){
    target_color <- "red"
    #text_target_status <- "above emissions target (off target)"
  }
  
    texto_valor_indice_actual <- paste0(
      round(valor_indice_actual, 1), 
      "<span style='font-size: 14px;'>/100", "</span>")
  
  div(
    style = "margin: 15px; width: 250px;",
    h2(titulo),
    h3(paste0("Período ", periodo_actual), style = "font-size: 16px; color: #666; margin-bottom: 5px;"),
    
    h1(
      HTML(texto_valor_indice_actual), 
      style = "font-size: 32px; font-weight: bold; margin: 10px 0; color: #333;"
    ),
    div(
      style = paste0("color: ", ifelse(sign(diferencia_periodo_ant_porc) == 1, "red", "green"), "; font-size: 14px;"),
      HTML(paste0(ifelse(sign(diferencia_periodo_ant_porc) == 1, "▲ ", "▼ "), round(diferencia_periodo_ant_porc, 1), "% vs ", periodo_anterior))
    )
    # div(
    #   style = paste0("color: ", ifelse(sign(percent_against_base) == 1, c40_colors("red"), c40_colors("green")), "; font-size: 14px;"),
    #   HTML(paste0(ifelse(sign(percent_against_base) == 1, "▲ ", "▼ "), round(percent_against_base, 1 ), "% vs ", year_base))
    # ),
    # div(
    #   style = paste0("color: ", target_color, "; font-size: 14px;"),
    #   HTML("🎯 ", paste0(round(value_target_latest, 1 ), "% ", text_target_status))
    # )
  )
}

#browsable(tarjeta_indice_global("Índice de Transparencia", 80.5, 78.2, "2020", "2021-T1"))
