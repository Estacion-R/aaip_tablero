

### Armo tabla
#tabla <- armar_tabla(shared_df_transparencia$data()(withFilter = periodo_tot == "2024_1"), tabla_nro = 1)
tabla <- armar_tabla(shared_df_transparencia, tabla_nro = 1)

### Armo tarjeta
tarjeta_x_so <- 
  card(
    card_header("Resultados del Índice por sujeto obligado"),
    layout_sidebar(
      fillable = TRUE, 
      sidebar = sidebar(
        title = "Filtros",
        width = "25%",
        layout_columns(
        "Período"
        ),
        layout_columns(
          col_widths = c(6, 6),
          filtro_anio,
          filtro_trim
        ),
        layout_columns(
          filtro_tipo_so
        ),
        layout_columns(
          filtro_so
        )
      ),
      tabla,
      tagList(
        tags$button(class = "download-button",
                    tagList(fontawesome::fa("download"), "Descargar tabla"),
                    onclick = glue("Reactable.downloadDataCSV('indice-tabla-1', 'tabla_x_sujeto_obligado-{today()}.csv')"))
      )
    )
  )
