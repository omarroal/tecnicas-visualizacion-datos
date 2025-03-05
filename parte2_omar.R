## MAPA DE ESPAÑA
install.packages("ggplot2")
install.packages("maps")
install.packages("dplyr")
install.packages("tidyr")
install.packages("RColorBrewer")
install.packages("ggrepel")

library(ggrepel)
library(ggplot2)
library (maps)
library (dplyr)
library (tidyr)
library (RColorBrewer)

mapa_mundo <- map_data("world")

ciudades <- c("Barcelona", "Madrid", "Valencia")
coordenadas <- data.frame( long = c(2.1589900, -3.70256,-0.37739 ), 
                           lat= c(41.38879,40.4165, 39.46975),
                           stringsAsFactors = F) 

coordenadas$ciudades <- ciudades   

mapa_mundo %>%
  ggplot() +
  ## BORDE DEL MAPA
  geom_polygon(aes(x= long, y = lat, group = group),
               fill = "#FFDAB9",
               color = "#FFA500",
               linetype = 2)+
               ## parecido a linetype = "dotdash") +
  theme_minimal() +
  theme(
    axis.line = element_blank(),
    axis.text = element_blank(),
    axis.title = element_blank(),
    axis.ticks = element_blank()) +
  ggtitle("España",
          subtitle = "Algunas capitales")+
  labs(title = "España",
       subtitle = "Algunas capitales",
       )+
  theme(plot.title = element_text(family = "serif",              # Familia de fuente del título
                                  face = "bold",                 # Estilo de fuente
                                  color = "orange",             # Color de la fuente
                                  size = 20,                     # Tamaño de la fuente
                                  hjust = 1,                     # Ajuste horizontal
                                  vjust = 1,                   # Ángulo de la fuente
                                  lineheight = 1,                # Espacio entre líneas
                                  margin = margin(20, 15, 0, 10)), # Márgenes (t, r, b, l)
        plot.subtitle = element_text(hjust = 1, margin = margin(5, 15, 20, 10)))+
  coord_fixed (xlim= c(-12,5),
               ylim= c(35,45),
               ratio = 1.3) +
  geom_point(data=coordenadas, aes(long, lat),
             color= "blue", size=2) +
  geom_text_repel(data = coordenadas,aes(long, lat, label = ciudades),
                  color= "#FF7F00")


  