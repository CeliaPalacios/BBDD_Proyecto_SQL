# BBDD_Proyecto_SQL

Se ha creado una nueva base de datos en DBeaver y se ha añadido la base de datos correspondiente al Proyecto. Un vez realizado esos pasos se ha importado los datos de la base de datos con la que vamos a trabajar y se ha creado el equema/diagrama.

Antes de comenzar ha realizar los enunciados del proyecto, se hace un pre-análisis de los datos que tenemos para saber con que datos vamos a trabajar y que representan.
Con un primer vistazo al diagrama de los datos podemos observar que los datos a analizar propivienen de una tienda que se dedica a vender o alquilar películas y a partir de ahí se divide en la información que se puede obtener de las películas en si y de los datos que se pueden sacar de la tienda, como puede ser los clientes, los empleados, el pago por cada película, etc.

Una vez realizado ese pre-análisis comenzamos a hacer los enunciados del proyecto.

En primer lugar se saca el esquema de la base de datos, una vez hecho esto comenzamos con el análisis de la base de datos a través de los enunciados del proyecto.

Una vez realizado todos los enunciados del proyectos con los datos que se han obtenido de las consultas poder realizar el siguiente análisis:
La relación entre la distribución de las clasificaciones de las películas y la duración de la mismas siendo en ambos casos 'PG-13' la clasificación más común con 223 películas y en la que se encuentran las películas con mayor duración con un promedio de duración de 120,44 y 'G' la clasificación menos común con 178 películas y en la que se encuentra las películas con menor duración con un promedio de duración de 111,05. Estos datos nos dan a entender que hay un enfoque amplio en cuanto a audiencias y en las expectativas de dichas audiencias dependiendo de la clasificación y duración de las películas.
En unos de los enunciados del proyecto no se pudo sacar la información solicitada debido a la falta de datos dentro de la columna 'original_language_id'que se encuentra vacia, lo que indica un problema de calidad en los datos.
Con respecto a los actores y películas vemos que hay actores destacados como 'GINA DEGENERES' con 42 películas o 'WALTER TORN' con 41, aunque en este caso también encontramos que puede haber un duplicado en los datos de los actores o que se tratan de dos actrices con el mismo nombre, pero id diferentes y dependiendo de como se haga la consulta el resultado puede varias de 'SUSAN DAVIS' con 54 películas o id 101 - 'SUSAN DAVIS' con 33 películas y id 110 - 'SUSAN DAVIS' con 21 películas, alterando por tando los resultados que obtenemos.
En cuanto a los alquileres vemos que los meses de verano son los que cuentan con la mayor cantidad de alquileres, lo que refleja un patron estacional. Siendo las categorías más populares a la hora de alquilar películas 'Sport' y 'Animation', lo que podría influir en el inventario de las películas que se encuentren en esas categorías.
Si nos centramos en los clientes observamos que los 5 clientes que más se han gastado no coincide con los que más alquilan, esto sugiere diferentes patrones de comportamiento.
El total generado por la emmpresa es significativo 67.416'51, con un precio promedio de alquiler de 4'2. Siendo la películas más alquilada 'BUCKET BROTHERHOOD', destacando como un claro éxito con respecto a la audiencia.

En conclusión para un mejor análisis de los datos habría que completar los datos de la columna 'original_language_id' y aclarar el caso de 'SUSAN DAVIS' si es un duplicado corregirlo o si se trata de dos actrices diferentes. 
Para optimizar el inventarío habría que priorizar las películas que entren dentro de las categorías de 'Sport' y 'Animation'.
Realizar un analisis más profundo de las diferencias entre clientes que más gastan y los que más alquilan para poder realizar estrategias de fidelización. Y de la correlación entre duración, clasificación y popularidad de las películas para optimizar el catálogo.
Por último aumentar las promociones durante los meses de menor actividad para nivelar los ingresos.
