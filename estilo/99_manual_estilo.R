
### PALETA Agencia
# Verde principal 
color_verde_principal <- "#008585"
color_verde_secundario <- "#28af8c"
color_gris <- "#868686"
color_naranja <-"#eb9547"
color_magenta <- "#e4418e"
color_violeta <- "#6b579e"
color_celeste <- "#23ace4"


theme_set(
  theme_minimal(
    #base_size = 14,
    base_family = "Roboto"
  )
)



options(reactable.language = reactableLang(
  pageSizeOptions = "Mostrar {rows}",
  searchPlaceholder = "Buscar...",
  noData = "No se han encontrado entradas",
  pageInfo = "{rowStart} a {rowEnd} de {rows} filas",
  pagePrevious = "\u276e",
  pageNext = "\u276f",
  pagePreviousLabel = "Próxima",
  pageNextLabel = "Anterior"
))
