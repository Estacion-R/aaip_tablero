
ghg_inventories <- df_gpc_master_tracker |> 
  filter(use_in_dashboard == "Yes") |> 
  rename("protocol_newsource" = "inventory_protocol") |> 
  summarise(n_inventories = n(),
            .by = c("city", "protocol_newsource"))

lista <- list()
for (i in unique(ghg_inventories$protocol_newsource)) {
  
  lista[i] <- list(ghg_inventories |> 
                  filter(protocol_newsource == i))
}


openxlsx::write.xlsx(x = lista, file = "output/GHG inventories.xlsx")
