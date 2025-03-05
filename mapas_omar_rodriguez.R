install.packages("maps")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
install.packages("RColorBrewer")

# OMAR RODRIGUEZ ALVAREZ
# 48679912-K

# Ejercicio 1
# Dibujamos el mapa de Estados Unidos
Estados_unidos <- map_data("state")
Estados_unidos
ggplot(Estados_unidos,aes(x=long,y=lat,group=group))+
geom_polygon(fill="white",colour="black")

# Veamos cómo dibujar el mapa mundi
mapa_mundo <- map_data("world")
ggplot(mapa_mundo,aes( x= long, y = lat, group = group),) +
geom_polygon( fill = "black", color = "white")

# modificar grafico a gusto
?theme

mapa_mundo <- map_data("world")
p <- ggplot(mapa_mundo, aes( x= long, y = lat, group = group),) +
geom_polygon( fill = "lightblue", color = "white")+
theme(
  axis.line = element_line(size = 3, colour = "pink"),
  axis.text =  element_text(colour = "blue",size=12),
  axis.title = element_blank(),
  axis.ticks = element_line(size = 5),
  panel.background = element_rect(fill=NA)) +
ggtitle( "Mapa del mundo")

# Podemos generar mapas regionales indicando las coordenadas. 
# Para realizar un mapa de España peninsular y Baleares, Portugal, 
# sur de Francia y norte de África podemos indicar las siguientes coordenadas:

p + coord_fixed (xlim = c(-12, 5), 
             ylim = c(35,45),
             ratio = 1.3,)

# OMAR RODRIGUEZ ALVAREZ
# 48679912-K

# Ejercicio 2 a entregar

library("RColorBrewer")
library("ggrepel")
library("dplyr")
library("maps")
library("ggplot2")
library("tidyr")

paises = c("Portugal", "Spain", "France", "Suiza", "Alemania", "Austria", "UK", "Netherlands",
           "Denmark", "Poland", "Italy",  "Croatia", "Slovenia", "Hungary", "Slovakia",  "Czech Republic",
           "Sweden","Finland", "Norway","Estonia", "Lithuania", "Ukraine", "Belarus", "Romania",
           "Belgium", "Bulgaria", "Greece", "Moldova", "Latvia","Luxembourg","Serbia",
           "Bosnia and Herzegovina", "North Macedonia", "Montenegro", "Albania","Irlanda","Kosovo")

capitales <- data.frame( long = c(-9.1333300, -3.70256, 2.3488, 11.71819), 
                                     lat= c(38.71667,40.4165, 48.85341,45.58383),
                                     capitales = c("Lisboa","Madrid", "Paris","Roma")) %>%
  summarise(long = long, lat = lat,region = capitales, group = c(1,1,1,1))

mar <- data.frame( long = c(0, -10, 0.3, -8), 
                                 lat= c(20,45, 60,70),
                                 mares = c("Mar Mediterraneo","Mar Cantabrico", "Mar del Norte","Oceano Atlantico")) %>%
  summarise(long = long, lat = lat,region = mares, group = c(1,1,1,1))

mapa = map_data("world", region = paises)

nombres = map_data("world", region = paises) %>%
  group_by(region) %>%
  summarize(long = mean(long, na.rm = T), lat = mean(lat, na.rm = T), group = group)%>% 
  distinct(region, long,lat, .keep_all=TRUE)

mapa.cols = 45

colores <- colorRampPalette(brewer.pal(8, "Spectral"))(mapa.cols)

ggplot(mapa,aes(x=long, y = lat, group=group, col = group, fill = region)) +
  geom_polygon(color = "white") +
  xlab("Longitud") +
  ylab("Latitud") +
  geom_text(data = nombres, aes(long, lat, label = region, group = group), size = 6)+
  geom_point(data=capitales, aes(long, lat, group = group),color= "red", size=4) +
  geom_text(data = capitales, aes(long, lat, label = region), color = "red", size=4) +
  geom_text(data = mar, aes(long, lat, label = region),  size=4) +
  theme(legend.position = "none",
        panel.background = element_rect(fill=NA),
        axis.text.x = element_text(angle = 20, colour = "blue"),
        axis.text.y = element_text(colour = "orange"),
        axis.title.x = element_text(colour = "red", size = 16)) +
  scale_fill_manual(values = colores)+
  ggtitle( "Mapa Europa", subtitle = "Algunas Capitales")

# FIN

