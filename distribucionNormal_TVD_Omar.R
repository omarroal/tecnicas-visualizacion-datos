library(dplyr)
library(ggplot2)
library(tidyverse)

## OMAR RODRIGUEZ ALVAREZ
## 48679912-K

# Funciones para pintar los dos huecos de P
pintar1 <- function(x){ y <- dnorm(x) 
  y[x>(-0.5) | x<(-1)] <- NA 
  return(y)
}
# P(-0,5<X<0)
pintar2 <- function(x){
  y <- dnorm(x)
  y[x<0.5 | x>1] <- NA 
  return(y) }

ggplot(data.frame(x=c(-2,2)),aes(x=x))+ 
  stat_function(fun=dnorm, lty=2)+  
    geom_segment(x =0, y = 0,xend = 0, yend = 0.4, lty=1,color="red",lwd=0.5)+ 
    geom_hline(yintercept = 0, color = "red", lwd = 1, lty = 1)+
    stat_function(fun = pintar2, geom = "area", fill = "blue")+ 
    stat_function(fun = pintar1, geom = "area", fill = "pink")+ 
    stat_function(fun = dnorm, args = list(mean = 1, sd = 1))+
    geom_segment(x =1, y = 0,xend = 1, yend = 0.4, linetype=1,color ="black",lwd=0.5)+ 
    annotate("text", x = -1, y = 0.35, label = "P(-0,5<X<0)", colour = "black", size =3)+ 
    theme(axis.text.x= element_text(colour = "blue",size=10,angle = 90), 
axis.text.y= element_text(colour = "blue",size=8), axis.title.x= element_text(size=8, face="bold"), axis.title.y= element_text(size=8, face="bold"),
plot.title = element_text( size = 10, hjust=0.01,face="bold"), axis.ticks.y = element_blank(), 
panel.background = element_blank())+
  
# flecha
annotate('curve', x=-1, y=0.34, xend=-1, yend=0.15, color='red',curvature=0.5,arrow = arrow(length = unit(0.03, "npc")))+ 

# Titulos  
ggtitle('Distribución Normal')+ 
    theme(plot.title = element_text(hjust = 0.5))+ #centrar titulo del grafico
    xlab('Valores de x')+
    ylab('Probabilidad')

