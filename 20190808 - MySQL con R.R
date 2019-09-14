#install.packages("RMariaDB")
library(RMariaDB)
localuserpassword <- "0586"
#library(RMariaDB)
# The connection method below uses a password stored in a variable.  
# To use this set localuserpassword="The password of newspaper_search_results_user" 

storiesDb <- dbConnect(RMariaDB::MariaDB(), user='newspaper_search_results_user', password=localuserpassword, dbname='newspaper_search_results', host='localhost')
dbListTables(storiesDb)
dbDisconnect(storiesDb)


{r}
summary(con)

#Función dbGetInfo, esta función puede ser usada para acceder a la 
#información sobre la base de dato con la cual tenemos establecida una conexión. 
{r}
dbGetInfo(con)

#Lista de tabla, una vez que hayamos establecido conexión exitosa con una base de 
#datos de MySQL, podemos usar la función dbListTables(). Esta función sirve para 
#acceder a las listas de tablas que están presente en una particular base de datos. 
#Para ello necesitamos específicar el nombre del objeto de conexión para la cual 
#estamos buscando la lista de tablas.

{r}
dbListTables(con)

#Como puedes ver existen 4 tablas en la base de datos a la cual establecimos 
#conexión a través del paquete RMySQL. En la función, no hemos especificado 
#el nombre de la base de datos, pero tenemos el nombre del objeto de conexión 
#de MySQL que hemos creado cuando nos conectamos a la base de datos.

#Listas de campo o columnas**
Para conseguir listas de campos o columnasde una particular tabla de base de dato, podemos usar la función dbListField(). Necesitamos especificar el nombre del objeto de conexión a MySQL, así como el nombre de la tabla. Si la tabla existe in la base de datos, los nombres de los campos serán retornados. 
Ejemplo: lista de campo en la tabla city
```{r}
dbListFields(con, "city")
```
El nombre de la tabla debe ser encerrado en simple o doble comillas y el nombre del campo será retornado como un vector de character.

#Testear tipos de datos**
Para testear el tipo de dato de un un objeto, podemos usar la función dbDataType() 
```{r}
dbDataType(RMySQL::MySQL(), "a")
dbDataType(RMySQL::MySQL(), 1:5)
dbDataType(RMySQL::MySQL(), 1.5)
```
Necesitamos especificar los detalles del driver, así como, el objeto para testear el tipo de dato de SQL.

-**Consulta de datos**
  Existen 3 diferentes métodos de consulta de datos desde la base de datos:
  -*Importar completa la base de datos*
  ```{r}
dbReadTable()
```
-*Enviar consulta y recuperar resultados usando*
  ```{r}
dbGetQuery()
```
-*Enviar consulta usando la funcion dbSendQuery() y recuperar resultados usando dbFetch()*
  ```{r}
dbSendQuery()
dbFetch()
```
-**Importar Tablas**
  La funcion dbReadTable() puede ser usada para extraer tablas enteras desde la base de data de 
MySQL. Podemos usar este mètodo solamente si la tabla no es muy grande. Necesitamos especìficamente el nombre del objeto de conexiòn de MySQL y la tabla. El nombre de la tabla debe ser encerrado en comillas simples o dobles.
```{r}
rdReadTable(con, "trial")
```
-**Importar filas**
  La funciòn dbQuery() puede ser usada para extraer filas especificas de una tabla. Podemos usar este mètodo cuando queramos importar filas que reùnan ciertas condiciones desde una gran tabla almacenada en la base de datos. Necesitamos especificar el nombre del objeto de conexiòn de MySQL y consulta. La consulta debe ser encerrada en comillas simples o dobles.
```{r}
dbGetQuery(con, "SELECT * FROM trial LIMIT 5;")
```
Esta funciòn envìa la consulta y recupera los resultados desde  la tabla en la base de datos

-**Importar datos in lotes**
  Podemos importar data en lotes. Para lograr esto, usaremos 2 diferentes funciones:
  dbFetch():  Recuperar datos desde la base de datos. Usaremos esta funciòn la cual recuperarà datos desde de la consulta que fue ejecutada por dbSendQuery()
dbSendQuery(): enviarà la cdonsulta pero no extraerà algùn dato. Recuperar datos desde la base de datos.
como puedes ver, este mètodo trabaja en dos estados. 

-* Extraer datos en lote*
  ```{r}
query <- dbSendQuery(con, "SELECT * FROM trial;")
data <- dbFetch(query, n = 5)
```

Almacenamos el resultado de la consulta de la fuknciòn dbSendQuery() en un objeto  'query'. El objeto de conexiòn de MySQL y la consulta de SQL son los inputs a esta funciòn. Siguiente, recuperamos el dato usando la funciòn dbFetch(). Los inputs para esta funciòn  son los resultados de la dbSendQuery() y el nùmero de filas para ser recuperado. Las filas recuperadas son almacenadas  en un nuevo objeto 'data'.

-**Consulta de informaciòn**
  La funciòn dbGetInfo() recupera informaciòn sobre consulta  que ha sido enviada por ejecutar la funciòn dbSendQuery().
```{r}
res <- dbSendQuery(con, "SELECT * FROM trial;")
dbGetInfo(res)






























