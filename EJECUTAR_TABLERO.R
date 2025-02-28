
############################################################################
############################################################################
##  Autor: Estación R
##
##  Fecha: 2025-02-27
##
##  Title: Tablero AAIP
##
##  Descripción: Tablero de datos sobre el Índice de Transparencia de la Agencia de Acceso a la Información Pública
##
##  Archivos necesarios: Dataset con el Índice de Transparencia de la AAIP 
##
##  Archivos generados: Tablero de datos en formato HTML
##
##  Versión de R en la que fue desarrollado: R version 4.4.1 (2024-06-14)
##
#############################################################################
#############################################################################

  

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                              Ejecuta el tablero                          ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tool_v <- "0.2.9999"

xfun::Rscript_call(
  rmarkdown::render,
  list(
    input = 'tablero_aaip.Rmd', 
       #output_format = 'flex_dashboard',
       output_file = glue::glue('Índice de Transparencia - AAIP - {tool_v}.html'),
       output_dir = 'output_tablero'
    )
)

