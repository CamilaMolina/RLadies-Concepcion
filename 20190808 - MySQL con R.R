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

#Funci�n dbGetInfo, esta funci�n puede ser usada para acceder a la 
#informaci�n sobre la base de dato con la cual tenemos establecida una conexi�n. 
{r}
dbGetInfo(con)

#Lista de tabla, una vez que hayamos establecido conexi�n exitosa con una base de 
#datos de MySQL, podemos usar la funci�n dbListTables(). Esta funci�n sirve para 
#acceder a las listas de tablas que est�n presente en una particular base de datos. 
#Para ello necesitamos espec�ficar el nombre del objeto de conexi�n para la cual 
#estamos buscando la lista de tablas.

{r}
dbListTables(con)

#Como puedes ver existen 4 tablas en la base de datos a la cual establecimos 
#conexi�n a trav�s del paquete RMySQL. En la funci�n, no hemos especificado 
#el nombre de la base de datos, pero tenemos el nombre del objeto de conexi�n 
#de MySQL que hemos creado cuando nos conectamos a la base de datos.

#Listas de campo o columnas**
Para conseguir listas de campos o columnasde una particular tabla de base de dato, podemos usar la funci�n dbListField(). Necesitamos especificar el nombre del objeto de conexi�n a MySQL, as� como el nombre de la tabla. Si la tabla existe in la base de datos, los nombres de los campos ser�n retornados. 
Ejemplo: lista de campo en la tabla city
```{r}
dbListFields(con, "city")
```
El nombre de la tabla debe ser encerrado en simple o doble comillas y el nombre del campo ser� retornado como un vector de character.

#Testear tipos de datos**
Para testear el tipo de dato de un un objeto, podemos usar la funci�n dbDataType() 
```{r}
dbDataType(RMySQL::MySQL(), "a")
dbDataType(RMySQL::MySQL(), 1:5)
dbDataType(RMySQL::MySQL(), 1.5)
```
Necesitamos especificar los detalles del driver, as� como, el objeto para testear el tipo de dato de SQL.

-**Consulta de datos**
  Existen 3 diferentes m�todos de consulta de datos desde la base de datos:
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
MySQL. Podemos usar este m�todo solamente si la tabla no es muy grande. Necesitamos espec�ficamente el nombre del objeto de conexi�n de MySQL y la tabla. El nombre de la tabla debe ser encerrado en comillas simples o dobles.
```{r}
rdReadTable(con, "trial")
```
-**Importar filas**
  La funci�n dbQuery() puede ser usada para extraer filas especificas de una tabla. Podemos usar este m�todo cuando queramos importar filas que re�nan ciertas condiciones desde una gran tabla almacenada en la base de datos. Necesitamos especificar el nombre del objeto de conexi�n de MySQL y consulta. La consulta debe ser encerrada en comillas simples o dobles.
```{r}
dbGetQuery(con, "SELECT * FROM trial LIMIT 5;")
```
Esta funci�n env�a la consulta y recupera los resultados desde  la tabla en la base de datos

-**Importar datos in lotes**
  Podemos importar data en lotes. Para lograr esto, usaremos 2 diferentes funciones:
  dbFetch():  Recuperar datos desde la base de datos. Usaremos esta funci�n la cual recuperar� datos desde de la consulta que fue ejecutada por dbSendQuery()
dbSendQuery(): enviar� la cdonsulta pero no extraer� alg�n dato. Recuperar datos desde la base de datos.
como puedes ver, este m�todo trabaja en dos estados. 

-* Extraer datos en lote*
  ```{r}
query <- dbSendQuery(con, "SELECT * FROM trial;")
data <- dbFetch(query, n = 5)
```

Almacenamos el resultado de la consulta de la fuknci�n dbSendQuery() en un objeto  'query'. El objeto de conexi�n de MySQL y la consulta de SQL son los inputs a esta funci�n. Siguiente, recuperamos el dato usando la funci�n dbFetch(). Los inputs para esta funci�n  son los resultados de la dbSendQuery() y el n�mero de filas para ser recuperado. Las filas recuperadas son almacenadas  en un nuevo objeto 'data'.

-**Consulta de informaci�n**
  La funci�n dbGetInfo() recupera informaci�n sobre consulta  que ha sido enviada por ejecutar la funci�n dbSendQuery().
```{r}
res <- dbSendQuery(con, "SELECT * FROM trial;")
dbGetInfo(res)






























