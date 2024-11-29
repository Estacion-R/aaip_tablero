

# bslib::bs_themer()
# thematic::thematic_rmd(
#   font = "auto",
#   # To get the dark bg on the geom_raster()
#   sequential = thematic::sequential_gradient(fg_low = FALSE, fg_weight = 0, bg_weight = 1)
# )
theme_set(theme_bw(base_size = 20))


# Style parameters
#add_css()

xaringanExtra::use_panelset()
xaringanExtra::style_panelset_tabs(inactive_opacity = 1,
                                   foreground = "honeydew", background = "seagreen")


# Style for freeze columns
sticky_style <- list(backgroundColor = "#f7f7f7",
                     borderRight = "1px solid #eee",
                     fontSize = '14px')


years <- 100
names <- 110
values <- 130