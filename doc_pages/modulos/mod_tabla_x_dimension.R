

### Armo tabla
#tabla <- armar_tabla(shared_df_transparencia$data()(withFilter = periodo_tot == "2024_1"), tabla_nro = 1)
tabla_x_dim <- armar_tabla_x_dimension(shared_df_transparencia_x_dim, tabla_nro = 2)

### Armo tarjeta
tarjeta_x_dim <- 
  card(
    card_header("Resultados del Índice por dimensión"),
    layout_sidebar(
      fillable = TRUE, 
      sidebar = sidebar(
        title = "Filtros",
        width = "25%",
        layout_columns(
          filtro_x_dim_so,
          filtro_x_dim_tipo_transparencia
        )
      ),
      tabla_x_dim,
      tagList(
        tags$button(class = "download-button",
                    tagList(fontawesome::fa("download"), "Descargar tabla"),
                    onclick = glue("Reactable.downloadDataCSV('indice-tabla-2', 'tabla_x_tipo_transparencia-{today()}.csv')"))
      )
    ),
    card_footer(
    p("A COMPLETAR",
    br(),
    p("Fuente: AAIP - Dirección Nacional de Evaluación de Políticas de Transparencia")
  )
  )
  )
