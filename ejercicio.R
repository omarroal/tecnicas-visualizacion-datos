install.packages("party")
install.packages('rpart')
install.packages('rpart.plot')
install.packages('rattle') 
install.packages('titanic') 
install.packages('tidyverse')
library(rpart) 
library(rpart.plot)
library(rattle) 
library(titanic) 
library(party)
library(tidyverse)

# Cargar librerias de datos
data("titanic_train") 
head(titanic_train)
# view(titanic_train)

# Modelar el arbol con decisiones
arbol <- rpart(
  formula = Survived ~ Sex + Age + Pclass,
  data = titanic_train, 
  method = 'class'
)

# graficamos el arbol
fancyRpartPlot(arbol)

# prediciendo el arbol
pred_arbol <- predict(arbol, type = 'class')
titanic_pred <- cbind(titanic_train, pred_arbol)

# sobrevivirá pasajero masculino de 4 años de edad
predict(object = arbol, 
        newdata = data.frame(Sex = 'male', 
                             Age = 5,
                             Pclass = 3
                             ),
        type = 'class')

# SOLUCIÓN 
# 1
# 1
# Levels: 0 1


