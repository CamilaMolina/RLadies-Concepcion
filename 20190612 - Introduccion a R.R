
## Introducción a R

"'
Hola!! Bienvenid@ al primer taller de R-Ladies Concepción!, queremos que te
sientas cómod@ y con la libertad de plantearnos cualquier tipo de duda, estamos
para apoyarte!

Si tienes el programa R o RStudio instalado en tu ordenador, daremos inicio al
procedimiento, en caso contrario, puedes dar aviso a una de las coordinadoras y
te ayudaremos con la instalación.


RStudio es un entorno de desarrollo integrado para el lenguaje de programación R,
dedicado a la computación estadística y gráficos.
Incluye una consola y editor de sintaxis (script) que apoya la ejecución de código.

R es un lenguaje de programación especialmente indicado para el análisis estadístico,
sin embargo, actualmente es ampliamente utilizado por diversas disciplinas en muchas ámbitos.

* R fue inicialmente diseñado por Robert Gentleman y Ross Ihaka, miembros del departamento de Estadística
de la Universidad de Auckland, en Nueva Zelanda.

Una de las grandes ventajas de R es que hoy en día es fruto del esfuerzo de miles de personas en todo el
mundo que colaboran en su desarrollo.

El código de R está disponible como software libre bajo las condiciones de la licencia GNU/GPL.

Además, pretenden que RStudio sea tan sencillo e intuitivo como sea posible para proporcionar un
entorno amigable, tanto para los ya experimentados como para los nuevos usuarios de R.

# <- Sirve para realizar comentarios en la consola.
Esto se puede realizar anteponiendo el símbolo Hash (#) antes de tu código sin que se ejecuten los comandos.

El editor (Script), permite escribir, ejecutar y modificar las líneas de código y guardarlas para el futuro.

Para ejecutar los códigos en RStudio se logra haciendo click en Run (Parte superior derecha del Script) o
se puede ejecutar desde el editor, colocando el cursor en tu línea de comando (R script) presionando (ctrl + enter)
o desde MAC (cmd + enter).

## Algo importante es que R es sensible a las mayúsculas y minúsculas, es decir, se debe respetar la sintaxis tal cual es.'"

################################################
##           R como calculadora                #
################################################

# Comenzaremos haciendo nuestra primera suma, para esto no es necesario instalar o abrir ningún paquete,
#podemos sumar cualquier número sin necesidad de asignar nombres a éstos, para demostrarlo necesitamos
#que elijas tus números favoritos la suma de tus números es la siguiente:

inserta tu n° favorito 1 + inserta tu n° favorito 2

# Algunos ejemplos sobre las operaciones que puedes realizar con R.

#Suma y resta
2+2
2-2

#División
8 / 2

#Multiplicación
2 * 2

#División entera, se devuelve la parte entera solamente
5%/%2

#Módulo, resto de dividir un número por otro
5%%2

#Potenciaciación
2^3

#Número exponencial
exp(2)

#Raíz cuadrada
sqrt(4)

#Un valor absoluto
abs(-5)

# Valor de pi
pi

#Factorial de un número
factorial(1:5)
factorial(5)

###########################################################
# Cosultas y ayuda                                        #
###########################################################

# Y también se puede pedir ayuda e información sobre paquetes o algunas con las siguientes instrucciones

help(pi)
help(abs)

?pi

# Se despliega en un recuadro la información que has pedido, lo puedes intentar con lo que estimes conveniente :)

###########################################################
#   Inicio Vectores                                       #
###########################################################

# La estructura más básica en R es un vector. incluso si es un número singular como lo vimos en los ejemplos anteriores.
# Un vector es básicamente una secuencia o un set de valores, los cuales pueden ser de tipo numérico, carácter o lógico.
#Se asigna con " <- " y siempre antes de los paréntesis debe ir "c", como se muestra en los siguientes ejemplos.

x <- c(1, 2, 3, 4, 5)
y <- c("a", "b", "c", "d", "e")
z <- c(TRUE, TRUE, FALSE, TRUE, FALSE)

# De esta manera, se puede llamar el vector desde ahora
x
y
z

# Podemos crear un vector en forma abreviada y podemos realizar operaciones de suma de vectores.
#Para esto podemos crear vectores usando: operadores (+,-,*, etc).

x <- 1:5 #Podemos generar un vector secuencial sólo agregando el ("número inicial:número final.")
x

y <- c(6, 7, 8, 9, 10)
y

z <- x + y
z

# Puedes ver claramente en los fragmentos de códigos anteriores que solo sumamos dos vectores
# Usando solo el operador + se puede obtener el resultado. Esto es conocido como vectorización.

MultpVectores <- c(1,3,5,7,9) * 2

# Para sacar la raíz cuadrada del vector la función sqrt

RaízVector <- sqrt(c(1,4,9,16))
RaízVector

# Valores especiales en los vectores

#Desde el comienzo en tus datos te encontrarás tratando con un montón de datos desordenados y sucios
#en el proceso de análisis de datos.

#Es importante recordar algunos de los valores especiales en R para que no te sorprendas cuando te
#aparezcan en la consola.

1/0
Inf # si aparece Inf en la consola quiere enunciar Infinito, en este caso es por Indefinición o indeterminació al dividir por 0.

0/0
NaN # si aparece NaN quiere decir que "No es un Número". Puede ser un vector categorial.

Inf/NaN

Inf/Inf

log(Inf)

Inf + NA
# si aparece NA indica un valor perdido o no disponible.

# los siguientes fragmentos de códigos muestran algunos tests "lógicos" para R sobre estos valores especiales
#y sus resultados. Hay que recodar que FALSE y TRUE son tipo de datos de valor lógico, similares a otros
#lenguajes de programación.

vec <- c(0, Inf, NaN, NA)

is.finite (vec)

is.nan(vec)

is.na(vec)

is.infinite(vec)

# Estas funciones son bastante autoexplicativas por sus propios nombres.
#Ellas claramente indican cuales valores son infinitos y cuales son para "NaN y NA".

#En el siguiente fragmento de códigos usaremos "seq" para realizar funciones que sirve para realizar vectores.

a <- c(2.5:4.5, 6,7, c(8, 9, 10), c(12:15))
a

b <- vector("numeric", 5)
b

c <- vector("logical", 5)
c

d <- logical(5)
d

# "seq" es una función que crea secuencias

seq(1,10)

seq(1, 10, 2)

seq(10)


#Una de las mas importantes operaciones que podemos hacer sobre vectores está relacionado con subconjuntos e
#indexación de vectores para acceder a elementos específicos. Frecuentemente, se utiliza esta función cuando
#queremos correr algún código sobre algún punto específico de la data.

#Los siguientes ejemplos muestran algunas formas con las cuales podemos indexar y hacer subconjunto de vectores.

vec <- c("R", "Python", "Julia", "Haskell", "Java", "Scala")

## ¿Qué hacen las siguientes sintaxis?

vec[1]

vec[-1]

vec[2:4]

vec[c(1, 3, 5)]

nums <- c(5, 8, 10, NA, 3, 11)
nums

which.min(nums) # índice del mínimo de elementos

which.max(nums) #índice de máximo de elementos

nums[which.min(nums)] # el elemento mínimo

nums [which.max(nums)] # el elemento máximo

which(is.na(nums)) #

#Nonbramiento de vectores
#Esta es una ingeniosa característica de R donde puedes etiquetar acada elemento de un vector
#para hacer mas legible o mas fácil la interpretación de los datos.
#Existen dos formas en que se pueden etiquetar los vectores. Ambas dan los mismos resutados:

# Forma 1

c(first = 1, second = 2, third = 3, fourth = 4, fifth = 5)

#Forma 2

positions <- c(1,2,3,4,5)
names(positions)

names (positions) <- c("first", "second", "third", "fourth", "fifth")
positions

names(positions)

positions[c("second", "fourth")]

#######################################
#                MATRICES             #
#######################################

# Una matriz es un arreglo bidimensional de números.
# Hay varias maneras de definir una matriz en R. Si es una matriz pequeña podemos utilizar la siguiente sintaxis:

## Primero creamos el vector que queremos utilizar en la matriz.
datos <- c(1,2,3,4,5,6,7,8,9)

A <- matrix(datos, nrow = 3, ncol = 3, byrow = TRUE)

# Con el argumento nrow hemos indicado el número de filas de nuestra matriz,
# con ncol el número de columnas;
#a continuación hemos puesto los valores que forman la matriz (los valores del 1 al 9), y le hemos pedido a R
#que use esos valores para rellenar la matriz A por filas (byrow=TRUE).

#La matriz A construída:

A

#Comprobar como queda la matriz con byrow=FALSE

A <- matrix(datos, nrow = 3, ncol = 3, byrow = FALSE)

A

## Podemos nombrar cada columna
colnames(A) <- c("first", "second", "third")
A
rownames(A) <- c("R", "Julia","Python")
A

#Si disponemos de varios vectores de la misma longitud que queremos utilizar como filas (o columnas)
#de una matriz, podemos utilizar la función rbind() para unirlos por filas, o la función cbind() para
#unirlos por columnas, como vemos en el siguiente ejemplo:

vector1 <- c(1, 2, 3, 4)
vector2 <- c(5, 6, 7, 8)
vector3 <- c(9, 10, 11, 12)

M1 <- cbind(vector1, vector2, vector3) # Unimos por columnas
M1

# Utilizando rbind, compara el resultado con la matriz M1 anterior.

M2 <- rbind(vector1, vector2, vector3) # Unimos por filas
M2

#Se pueden seleccionar partes de una matriz utilizando los índices de posición [fila, columna] entre corchetes.
#El siguiente ejemplo ilustra la forma de hacerlo:

A[2,3]   # Se selecciona el valor de la fila 2, columna 3

A[2,]    # Se selecciona la fila 2 completa

A[,3]    # Se selecciona la columna 3 completa

A[1,2:3] # Se seleccionan el segundo y tercer valor de la fila 1

dim(A) #Permite conocer las dimensiones de la matriz, cuantas columnas y filas tiene el arreglo.


#Operaciones con matrices
#La función diag() extrae la diagonal principal de una matriz:

diag(A)

#También permite crear matrices diagonales:

diag(c(1,2,3,4))

## Multiplicación de matrices.

M1 %*% M2

## Transponer una matriz

M1
t(M1)

## suma de matrices
M1 + t(M2)



