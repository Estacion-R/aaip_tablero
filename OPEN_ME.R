

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                              Run the Dashboard                           ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tool_v <- "1.0"

xfun::Rscript_call(
  rmarkdown::render,
  list(
    input = 'main_dashboard.Rmd', 
       #output_format = 'flex_dashboard',
       output_file = glue::glue(' Puntaje Índice de Transparencia - AAIP - {tool_v}.html'),
       output_dir = 'output_dashboard'
    )
)

 
# library(magick)
# logo <- image_read("style/img/c40_logo.svg")
# logo_scaled <- image_scale(logo,'45x')
# image_write(logo_scaled, "style/img/c40_logo_45x.svg")
