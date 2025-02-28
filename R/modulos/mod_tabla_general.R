

### Armo tabla
#tabla <- armar_tabla(shared_df_transparencia$data()(withFilter = periodo_tot == "2024_1"), tabla_nro = 1)
tabla <- armar_tabla_x_so(shared_df_transparencia, tabla_nro = 1)

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
          filtro_x_so_anio,
          filtro_x_so_trim
        ),
        layout_columns(
          filtro_x_so_tipo_so
        ),
        layout_columns(
          filtro_x_so_so
        )
      ),
      tabla,
      tagList(
        tags$button(class = "download-button",
                    tagList(fontawesome::fa("download"), "Descargar tabla"),
                    onclick = glue("Reactable.downloadDataCSV('indice-tabla-1', 'tabla_x_sujeto_obligado-{today()}.csv')"))
      )
    ),
    card_footer(
    p("ADMINISTRACIÓN CENTRAL (AC) Y DESCONCENTRADA (D). AC: Son la Jefatura de Gabinete, los Ministerios y
    las Secretarías con rango de ministerio. D: Son entidades con competencia técnica específica que dependen de un organismo central. DESCENTRALIZADOS: Organismos con personería jurídica y patrimonio sujetos al control administrativo del Poder Ejecutivo. EMPRESAS PÚBLICAS: Organismos donde el Estado participa en el capital o en la formación de decisiones. ENTES DEL SECTOR PÚBLICO NACIONAL: Organización estatal no empresarial donde el Estado controla el patrimonio y/o las decisiones, incluyendo entidades públicas no estatales. UNIVERSIDADES: Establecimientos universitarios con financiamiento del estado
    nacional.)",
    br(),
    p("Fuente: AAIP - Dirección Nacional de Evaluación de Políticas de Transparencia")
  )
  )
  )
