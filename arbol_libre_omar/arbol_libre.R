# CARGAMOS E INSTALAMOS LIBRERIAS
install.packages("rpart.plot")
install.packages("rpart")
library(rpart)
library(rpart.plot)

# OMAR RODRIGUEZ ALVAREZ
# 48679912-K

# CAMBIAR RUTA DE LOS DATOS
# Arboles de decision
# Establecer o cambiar la ruta del directorio
setwd("/Users/omarrodriguez/Desktop/arboles_tvd") 

# Cargar datos de manera predeterminada
pacientes <- read.csv("Pacientes2.csv")

# VER EL CSV DE DATOS 
# CSV CON ENFERMEDADES
# View(pacientes)

# VARIABLE CATEGORICA DE LOS DATOS: ENFERMEDAD
# EL RESTO VARIABLES DE TIPO ENTERO

# METODO PREDICTIVO MEDIANTE PRUEBA Y ENTRENAMIENTO CON 75% DE LOS DATOS
# VER DATOS CON SUS ATRIBUTOS/VARIABLES 
str(pacientes)

# conjunto aleatorio de 750 numeros, escogemos los datos para entrenar el modelo
# CONJUNTO ALEATORIO DE DATOS !!
filas_para_entrenar <- sample(1:985, 750)

# todas las columnas para crear el archivo de prueba
archivo_entrenamiento <- pacientes[filas_para_entrenar, ]

# Graficamos el arbol con rplot
# MODELO PREDICTIVO CON VARIABLE A PREDECIR = ENFERMEDAD
arbol_enfermedad <- rpart(Enfermedad ~., data=archivo_entrenamiento)
rpart.plot(arbol_enfermedad, type=2, extra=104)

# Archivo para entrenar el arbol de decisiones con las modificaciones
write.csv(archivo_entrenamiento, "/Users/omarrodriguez/Desktop/arboles_TVD/arbol_decision_tvd.csv" )

# INFORMACION!!
# SE TRATA DE UN ARBOL QUE SE GENERA ALEATORIAMENTE 
# MEDIANTE PREDICCIONES Y RELACIONES DE LAS ENFERMEDADES QUE PONE EN LOS ATRIBUTOS/VARIABLES
# MEDIANTE PREGUNTAS DE LAS VARIABLES RAMA POR RAMA
# PODEMOS VER LAS VARIABLES CON 0-1 Y LA TOMA DE DECISIONES


