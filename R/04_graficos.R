
######################################## Armo Donas:

### Índice Transparencia
viz_tot_it <- armar_dona(value = df_transparencia_tot$it, 
           font_family = "Inter", text_size = 12) +
  ggtitle(label = "Índice de Transparencia") +
  theme(plot.title = element_text(hjust = 0.5, size = 18, face = "bold"))


### Transparencia Activa
viz_tot_ta <- armar_dona(value = df_transparencia_tot$ta, 
                         font_family = "Inter", text_size = 6) +
  ggtitle(label = "Transparencia Activa") +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"))

### Transparencia proactiva
viz_tot_tp <- armar_dona(value = df_transparencia_tot$tp, 
                         font_family = "Inter", text_size = 6) +
  ggtitle(label = "Transparencia Proactiva") +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"))



viz_tot <- viz_tot_it + (viz_tot_ta / viz_tot_tp)


ggsave(plot = viz_tot, path = "output_graficos", filename = "viz_tot.png",
       height = 7, width = 7)

