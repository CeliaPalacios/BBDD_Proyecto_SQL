--2. Muestra los nombres de todas las películas con una clasificación por edades de 'R'

SELECT "title" AS "titulo"
FROM "film" AS f 
WHERE "rating" = 'R';

--3. Encuentra los nombre de los actores que tengan un "actor_id" entre 30 y 40

SELECT "first_name" AS "nombre",
	"last_name" AS "apellido" 
FROM "actor" AS a 
WHERE "actor_id" BETWEEN 30 AND 40; 

--4. Obtén las películas cuyo idioma coincide con el idioma original.

SELECT "f"."title" AS "titulo",
	l."name" AS "Idioma"
FROM "film" AS f 
INNER JOIN "language" AS l 
ON "f"."language_id" = "l"."language_id"
WHERE f.language_id = f.original_language_id ;

--5. Ordena las películas por duración de forma ascendente.

SELECT "title" AS "titulo",
		"length" AS "duración"
FROM "film" AS f 
ORDER BY "duración" ASC; 

--6. Encuentra el nombre y apellido de los actores que tengan ‘Allen’ en su apellido

SELECT CONCAT("first_name", ' ', "last_name") AS "nombre_actor"
FROM "actor" AS a 
WHERE "last_name" = 'ALLEN';  

/*
 7. Encuentra la cantidad total de películas en cada clasificación de la tabla “film” 
 y muestra la clasificación junto con el recuento
 */

SELECT "rating" AS "Clasificación", 
	COUNT(*) AS "total_películas"
FROM "film" AS f
GROUP BY "rating"
ORDER BY "total_películas" DESC;

/*
 8. Encuentra el título de todas las películas que son ‘PG-13’ o tienen una duración 
 mayor a 3 horas en la tabla film.
 */

SELECT "title" AS "título"
FROM "film" AS f 
WHERE "rating" = 'PG-13'
OR "length" >= 180 ;

--9. Encuentra la variabilidad de lo que costaría reemplazar las películas

SELECT ROUND(VARIANCE("replacement_cost"), 2) AS "Coste_reemplazo" 
FROM "film" AS f ; 

--10. Encuentra la mayor y menor duración de una película de nuestra BBDD.

SELECT MAX ("length") AS "Duración_máxima",
	   MIN ("length") AS "Duración_mínima"
FROM "film" AS f ; 

--11. Encuentra lo que costó el antepenúltimo alquiler ordenado por día

SELECT "r"."rental_id" AS "alquiler",
		"r"."rental_date" AS "fecha_alquiler", 
		"p"."amount" AS "Costo"
FROM "rental" AS r
INNER JOIN "payment" AS p 
ON "r"."rental_id" = "p"."rental_id" 
ORDER BY "rental_date" DESC
LIMIT 1 OFFSET 2 ;

/*
12. Encuentra el título de las películas en la tabla “film” que no sean ni ‘NC-17’ 
ni ‘G’ en cuanto a su clasificación
*/

SELECT "title" AS "Título",
		"rating" AS "Clasificación" 
FROM "film" AS f 
WHERE "rating" NOT IN ('NC-17', 'G') ;

/*
13. Encuentra el promedio de duración de las películas para cada clasificación de 
la tabla film y muestra la clasificación junto con el promedio de duración
*/

SELECT "title" AS "Título",
	   "rating" AS "Clasificación",
		AVG ("length") AS "Promedio_duración" 
FROM "film" AS f 
GROUP BY "rating", "title" ;

/*
No estoy segura si lo que se pide son las películas con su clásificación 
y su promedio de duración o una agrupación de todas las clasificaciones y 
los promedios de esas. Por lo que he realizado las dos formas.
 */

SELECT "rating" AS "Clasificación",
		COUNT(*) AS "total_películas",
		ROUND(AVG ("length"), 2) AS "Promedio_duración" 
FROM "film" AS f 
GROUP BY "rating" 
ORDER BY "Promedio_duración" DESC ;

/*
14. Encuentra el título de todas las películas que tengan una duración mayor 
a 180 minutos.
*/

SELECT "title" AS "Título"
FROM "film" AS f 
WHERE "length" > 180 ;

--15. ¿Cuánto dinero ha generado en total la empresa?

SELECT SUM("amount") AS "Dinero_total"
FROM "payment" AS p; 


--16. Muestra los 10 clientes con mayor valor de id.

SELECT CONCAT("first_name", ' ', "last_name") AS "Nombre_cliente"
FROM "customer" AS c 
ORDER BY "customer_id" DESC 
LIMIT 10 ;

/*
17. Encuentra el nombre y apellido de los actores que aparecen en la película con 
título ‘Egg Igby’.
*/

SELECT CONCAT(a."first_name", ' ', a."last_name") AS "Nombre_actores"
FROM "film_actor" AS fa 
INNER JOIN "actor" AS a 
ON fa."actor_id" = a."actor_id"
INNER JOIN "film" AS f 
ON fa."film_id" = f."film_id"
WHERE f."title" = 'EGG IGBY' ;

--18. Selecciona todos los nombres de las películas únicos

SELECT DISTINCT "title" AS "Título_película_único" 
FROM "film" AS f ;

/*
19. Encuentra el título de las películas que son comedias y tienen una duración 
mayor a 180 minutos en la tabla “film”.
*/

SELECT f."title" AS "Título_película"
FROM "film" AS f 
INNER JOIN "film_category" AS fc 
ON f."film_id" = fc."film_id"
INNER JOIN "category" AS c 
ON fc."category_id" = c."category_id" 
WHERE c."name" = 'Comedy'
AND f."length" > 180 ; 

/*
 20. Encuentra las categorías de películas que tienen un promedio deduración superior 
 a 110 minutos y muestra el nombre de la categoría junto con el promedio de duración
 */

SELECT c."name" AS "Categoría",
		ROUND(AVG(f."length"), 2) AS "Promedio_duración" 
FROM "film" AS f 
INNER JOIN "film_category" AS fc 
ON f."film_id" = fc."film_id"
INNER JOIN "category" AS c 
ON fc."category_id" = c."category_id" 
GROUP BY c."name" 
HAVING AVG(f."length") > 110
ORDER BY "Promedio_duración" DESC ;

--21. ¿Cuál es la media de duración del alquiler de las películas?*

SELECT AVG("return_date" - "rental_date") AS "Duración_alquiler"
FROM "rental" AS r 
WHERE return_date IS NOT NULL ;

--22. Crea una columna con el nombre y apellidos de todos los actores y actrices

SELECT CONCAT("first_name", ' ', "last_name") AS "Nombre y apellidos" 
FROM "actor" AS a 
ORDER BY "Nombre y apellidos" ;

--23. Números de alquiler por día, ordenados por cantidad de alquiler de forma descendente

SELECT DATE("rental_date") AS "Fecha_alquiler",
		COUNT("rental_date") AS "Total_alquiler_día" 
FROM "rental" AS r 
GROUP BY DATE("rental_date")
ORDER BY "Total_alquiler_día" DESC ;

--24. Encuentra las películas con una duración superior al promedio

SELECT "title" AS "Nombre_películas"
FROM "film" AS f 
WHERE "length" > (SELECT ROUND(AVG("length"), 2) FROM "film") ;	

--25. Averigua el número de alquileres registrados por mes

SELECT EXTRACT(YEAR FROM "rental_date") AS "Año",
	   EXTRACT(MONTH FROM "rental_date") AS "Mes",
		COUNT(*) AS "Total_alquiler"
FROM "rental" AS r 
GROUP BY "Año", "Mes"
ORDER BY "Año" ;

--26. Encuentra el promedio, la desviación estándar y varianza del total pagado

SELECT ROUND(AVG("amount"), 2) AS "Promedio_Pago",
	   ROUND(STDDEV("amount"), 2) AS "Desviación_Pago",
	   ROUND(VARIANCE("amount"), 2) AS "Varianza_Pago" 
FROM "payment" AS p ;

--27. ¿Qué películas se alquilan por encima del precio medio?

SELECT "title" AS "Nombre_película"
FROM "film" AS f 
WHERE "rental_rate" > (SELECT ROUND(AVG("rental_rate"), 2) FROM "film") ; 

--28. Muestra el id de los actores que hayan participado en más de 40 películas

SELECT "actor_id" AS "Actor",
		COUNT("film_id") AS "Total_Películas"
FROM "film_actor" AS fa 
GROUP BY "actor_id"
HAVING COUNT("film_id") > 40 ; 

/*
 29. Obtener todas las películas y, si están disponibles en el inventario,
mostrar la cantidad disponible
 */

SELECT f."title" AS "Película",
		COUNT(i."inventory_id") - COUNT(r."rental_id") AS "Inventario_disponible" 	
FROM "film" AS f 
LEFT JOIN "inventory" AS i
ON f."film_id" = i."film_id"
LEFT JOIN "rental" AS r
ON i."inventory_id" = r."inventory_id" AND r."return_date" IS NULL 
GROUP BY f."film_id", f."title"
ORDER BY f."title" ;

--30. Obtener los actores y el número de películas en las que ha actuado

SELECT CONCAT(a."first_name", ' ', a."last_name") AS "Nombre_actores",
		COUNT(fa."film_id") AS "Total_películas"
FROM "film_actor" AS fa 
INNER JOIN "actor" AS a 
ON fa."actor_id" = a."actor_id"
GROUP BY "first_name", "last_name"
ORDER BY "Total_películas" DESC ;

SELECT "actor_id" AS "id_actor", 
	CONCAT("first_name", ' ', "last_name") AS "Actores" 
FROM actor AS a 
WHERE first_name = 'SUSAN' 
AND last_name = 'DAVIS' ;

/*
 31. Obtener todas las películas y mostrar los actores que han actuado en
ellas, incluso si algunas películas no tienen actores asociados.
 */

SELECT f."title" AS "Películas",
		CONCAT(a."first_name", ' ', a."last_name") AS "Nombre_actores"
FROM "film" AS f 
LEFT JOIN "film_actor" AS fa 
ON fa."film_id" = f."film_id"
LEFT JOIN "actor" AS a 
ON a."actor_id" = fa."actor_id" 
ORDER BY "Películas", "Nombre_actores" ;

/*
 32. Obtener todos los actores y mostrar las películas en las que han
actuado, incluso si algunos actores no han actuado en ninguna película
 */

SELECT CONCAT(a."first_name", ' ', a."last_name") AS "Nombre_actores",
		f."title" AS "Películas"
FROM "actor" AS a
RIGHT JOIN "film_actor" AS fa 
ON a."actor_id" = fa."actor_id"
RIGHT JOIN "film" AS f
ON fa."film_id" = f."film_id"
ORDER BY "Nombre_actores", "Películas" ;

/*
 33. Obtener todas las películas que tenemos y todos los registros de
alquiler
 */

SELECT f."title" AS "Título",
	   f."rental_rate" AS "Precio_Alquiler",
       r."rental_id" AS "id_Alquiler", 
       r."rental_date" AS "Fecha_alquiler", 
       r."return_date" AS "Fecha_devolución", 
       f."rental_duration" AS "Duración_Alquiler",
       r."customer_id" AS "id_Cliente"
FROM "film" AS f 
LEFT JOIN "inventory" AS i 
ON f."film_id" = i."film_id"
LEFT JOIN "rental" AS r 
ON i."inventory_id" = r."inventory_id"
ORDER BY "Título", "Fecha_alquiler" ;

--34. Encuentra los 5 clientes que más dinero se hayan gastado con nosotros

SELECT 	c."customer_id" AS "id_Cliente",
	   CONCAT(c."first_name", ' ', c."last_name") AS "Clientes",
	   SUM(p."amount") AS "Total_gasto"	
FROM "payment" AS p
LEFT JOIN "customer" AS c
ON p."customer_id" = c."customer_id" 
GROUP BY c."customer_id", c."first_name", c."last_name" 
ORDER BY "Total_gasto" DESC 
LIMIT 5 ;

--35. Selecciona todos los actores cuyo primer nombre es 'Johnny'

SELECT CONCAT("first_name", ' ', "last_name") AS "Nombre"
FROM "actor" AS a 
WHERE "first_name" = 'JOHNNY' ;

--36. Renombra la columna “first_name” como Nombre y “last_name” como Apellido

ALTER TABLE "customer"
RENAME COLUMN "first_name" TO Nombre;

ALTER TABLE "customer"
RENAME COLUMN "last_name" TO Apellido;

ALTER TABLE "actor"
RENAME COLUMN "first_name" TO Nombre;

ALTER TABLE "actor"
RENAME COLUMN "last_name" TO Apellido;

ALTER TABLE "staff"
RENAME COLUMN "first_name" TO Nombre;

ALTER TABLE "staff"
RENAME COLUMN "last_name" TO Apellido;


--37. Encuentra el ID del actor más bajo y más alto en la tabla actor

SELECT MIN("actor_id") AS "Más_bajo",
       MAX("actor_id") AS "Más_alto"
FROM "actor" AS a ;

--38. Cuenta cuántos actores hay en la tabla “actor"

SELECT COUNT(*) AS "total_actores" 
FROM "actor" AS a ;

--39. Selecciona todos los actores y ordénalos por apellido en orden ascendente

SELECT CONCAT("nombre", ' ', "apellido") AS "Actores" 
FROM "actor" AS a 
ORDER BY "apellido" ASC ;

--40. Selecciona las primeras 5 películas de la tabla “film”

SELECT "title" AS "Películas" 
FROM "film" AS f 
LIMIT 5 ;

/*
 41. Agrupa los actores por su nombre y cuenta cuántos actores tienen el mismo nombre. 
¿Cuál es el nombre más repetido?
 */

SELECT "nombre" , 
		COUNT(*) AS "cantidad" 
FROM "actor" AS a 
GROUP BY "nombre"
ORDER BY "cantidad" DESC ;

-- LOS NOMBRES MÁS REPETIDOS SON KENNETH, PENELOPE Y JULIA, QUE SE REPITEN 4 VECES


--42. Encuentra todos los alquileres y los nombres de los clientes que los realizaron

SELECT r.rental_id AS "id_alquiler",
		CONCAT(c."nombre", ' ', c."apellido") AS "cliente"
FROM "rental" AS r 
LEFT JOIN "customer" AS c 
ON r."customer_id" = c."customer_id" ;

/*
 43. Muestra todos los clientes y sus alquileres si existen, incluyendo aquellos 
que no tienen alquileres.
 */

SELECT  c."customer_id" AS "id_cliente",
		CONCAT(c."nombre", ' ', c."apellido") AS "Clientes",
		r."rental_id" AS "id_alquiler" 
FROM "customer" AS c 
RIGHT JOIN "rental" AS r 
ON c."customer_id" = r."customer_id" 
ORDER BY "id_cliente" ;

/*
 44. Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor esta 
consulta? ¿Por qué? Deja después de la consulta la contestación
 */

SELECT  f."title" AS "Película",
		c."name" AS "Categoria"
FROM "film" AS f 
CROSS JOIN "category" AS c 
 
/*
 * No, está consulta no aporta un valor significativo. Al ser un CROSS JOIN genera 
 * un producto cartesiano, lo que incluye todas las combinaciones posible entre las 
 * filas de ambas tablas, generando una tabla de gran tamaño en la que no se 
 * reflejan las relaciones reales entre películas y categorías.
 * 
 * Para ver bien esa relación tenemos "film_category" que asocia cada película con sus 
 * categorías correspondientes y al usar CROSS JOIN se ignoran esas relaciones, 
 * generando combinaciones irrelevantes que puede resultar confusas y dar 
 * resultados innecesarios.
 */

--45. Encuentra los actores que han participado en películas de la categoría 'Action'

SELECT DISTINCT 
	a."actor_id" AS "id_actor",
	CONCAT(a."apellido", ' ', a."nombre") AS "Actores"
FROM "actor" AS a 
LEFT JOIN "film_actor" AS fa  
ON a."actor_id" = fa."actor_id" 
LEFT JOIN "film" AS f 
ON fa."film_id" = f."film_id" 
LEFT JOIN "film_category" AS fc 
ON f."film_id" = fc."film_id" 
LEFT JOIN "category" AS c 
ON fc."category_id" = c."category_id"
WHERE c."name" = 'Action' 
ORDER BY "Actores" ; 

--46. Encuentra todos los actores que no han participado en películas

SELECT CONCAT(a."nombre", ' ', a."apellido") AS "Actores"
FROM "actor" AS a 
LEFT JOIN "film_actor" AS fa 
ON a."actor_id" = fa."actor_id" 
WHERE fa.film_id IS NULL 
ORDER BY "Actores" ;

/*
 47. Selecciona el nombre de los actores y la cantidad de películas en las que 
han participado.
 */

SELECT  CONCAT(a."nombre", ' ', a."apellido") AS "Actores",
		COUNT(fa."film_id") AS "Cantidad_películas"
FROM "actor" AS a 
LEFT JOIN "film_actor" AS fa 
ON a."actor_id" = fa."actor_id"
GROUP BY a."actor_id", a."nombre", a."apellido" 
ORDER BY "Cantidad_películas" DESC , "Actores" ;

/*
 48. Crea una vista llamada “actor_num_peliculas” que muestre los nombres de los 
actores y el número de películas en las que han participado
 */

CREATE VIEW actor_num_peliculas AS 
SELECT CONCAT(a."nombre", ' ', a."apellido") AS "Actores",
		COUNT(fa."film_id") AS "Cantidad_películas"
FROM "actor" AS a 
LEFT JOIN "film_actor" AS fa 
ON a."actor_id" = fa."actor_id"
GROUP BY a."actor_id", a."nombre", a."apellido" 
ORDER BY "Cantidad_películas" DESC , "Actores" ;

SELECT *
FROM actor_num_peliculas 

--49. Calcula el número total de alquileres realizados por cada cliente

SELECT  CONCAT(c."nombre", ' ', c."apellido") AS "Clientes",
		COUNT(r."rental_id") AS "Total_alquileres"
FROM "customer" AS c 
LEFT JOIN "rental" AS r 
ON c."customer_id" = r."customer_id" 
GROUP BY c."customer_id", c."nombre", c."apellido" 
ORDER BY "Total_alquileres" DESC ;

--50. Calcula la duración total de las películas en la categoría 'Action'

SELECT  c."name" AS "Categoria",
		SUM(f."length") AS "Duración_total"
FROM "film" AS f 
LEFT JOIN "film_category" AS fc 
ON f."film_id" = fc."film_id"
LEFT JOIN "category" AS c
ON fc."category_id" = c."category_id" 
WHERE c."name" = 'Action' 
GROUP BY c."name" ;

/*
 51. Crea una tabla temporal llamada “cliente_rentas_temporal” para almacenar el 
total de alquileres por cliente
 */

WITH cliente_rentas_temporal AS (
	SELECT  
		CONCAT(c."nombre", ' ', c."apellido") AS "Clientes",
		COUNT(r."rental_id") AS "Total_alquileres"
	FROM "customer" AS c 
	LEFT JOIN "rental" AS r 
	ON c."customer_id" = r."customer_id" 
	GROUP BY c."customer_id", c."nombre", c."apellido" 
	ORDER BY "Total_alquileres" DESC , "Clientes" 
)
SELECT * FROM cliente_rentas_temporal ;

/*
 52. Crea una tabla temporal llamada “peliculas_alquiladas” que almacene las películas 
que han sido alquiladas al menos 10 veces
 */

WITH peliculas_alquiladas AS (
	SELECT  f."title" AS "Películas",
		COUNT(r."rental_id") AS "Total_alquiladas"
	FROM "film" AS f 
	LEFT JOIN "inventory" AS i ON f."film_id" = i."film_id"
	LEFT JOIN "rental" AS r ON i."inventory_id" = r."inventory_id" 
	GROUP BY f.title 
	HAVING COUNT(r."rental_id") >= 10 
	ORDER BY "Total_alquiladas" DESC
)
SELECT * FROM peliculas_alquiladas;

/*
 53. Encuentra el título de las películas que han sido alquiladas por el cliente con 
el nombre ‘Tammy Sanders’ y que aún no se han devuelto. Ordena los resultados 
alfabéticamente por título de película
 */

SELECT  f."title" AS "Título_Película"
FROM "film" AS f 
LEFT JOIN "inventory" AS i 
ON f."film_id" = i."film_id"
LEFT JOIN "rental" AS r 
ON i."inventory_id" = r."inventory_id"
LEFT JOIN "customer" AS c 
ON r.customer_id = c.customer_id 
WHERE c.nombre = 'TAMMY'
AND c."apellido" = 'SANDERS' 
AND r.return_date IS NULL 
ORDER BY "Título_Película" ;

/*
 54. Encuentra los nombres de los actores que han actuado en al menos una película 
que pertenece a la categoría ‘Sci-Fi’. Ordena los resultados alfabéticamente 
por apellido.
 */

SELECT DISTINCT CONCAT(a."apellido", ' ', a."nombre") AS "Actores"
FROM "actor" AS a 
LEFT JOIN film_actor AS fa 
ON a.actor_id = fa.actor_id 
LEFT JOIN film AS f 
ON fa.film_id = f.film_id 
LEFT JOIN film_category AS fc 
ON f.film_id = fc.film_id 
LEFT JOIN category AS c 
ON fc.category_id = c.category_id 
WHERE c."name" = 'Sci-Fi'
ORDER BY "Actores" ;

/*
 55. Encuentra el nombre y apellido de los actores que han actuado en películas que 
se alquilaron después de que la película ‘Spartacus Cheaper’ se alquilara por primera 
vez. Ordena los resultados alfabéticamente por apellido.
 */

-- Primero averiguamos cuando se alquiló por primera ver 'Spartacus Cheaper'--> 7/8/05

WITH Primer_Alquiler_SpartacusCheaper AS (
	SELECT MIN(r.rental_date) AS "Primer_fecha_alquiler"
	FROM "rental" AS r 
	LEFT JOIN "inventory" AS i ON r."inventory_id" = i."inventory_id"
	LEFT JOIN  "film" AS f ON i."film_id" = f."film_id"
	WHERE f.title = 'SPARTACUS CHEAPER'
)
SELECT DISTINCT  
	CONCAT(a."apellido", ' ', a."nombre") AS "Actores"
FROM "actor" AS a
LEFT JOIN "film_actor" AS fa ON a."actor_id" = fa."actor_id" 
LEFT JOIN "film" AS f ON fa."film_id" = f."film_id" 
LEFT JOIN "inventory" AS i ON f."film_id" = i."film_id" 
LEFT JOIN "rental" AS r ON i."inventory_id" = r."inventory_id" 
WHERE r."rental_date" > (SELECT * FROM Primer_alquiler_SpartacusCheaper)
ORDER BY "Actores" ;

/*
 56. Encuentra el nombre y apellido de los actores que no han actuado en ninguna 
película de la categoría ‘Music'
 */

SELECT DISTINCT 
	CONCAT(a."nombre", ' ', a."apellido") AS "Actores"
FROM "actor" AS a
LEFT JOIN "film_actor" AS fa ON a."actor_id" = fa."actor_id"
LEFT JOIN "film" AS f ON fa."film_id" = f."film_id"
LEFT JOIN "film_category" AS fc ON f."film_id" = fc."film_id"
LEFT JOIN "category" AS c ON fc."category_id" = c."category_id" 
WHERE c."name" NOT IN ('Music') 
ORDER BY "Actores";

--57. Encuentra el título de todas las películas que fueron alquiladas por más de 8 días

SELECT "title" AS "Películas" 
FROM "film" AS f 
WHERE rental_duration > 8 ;

/*
 58. Encuentra el título de todas las películas que son de la misma categoría que
 ‘Animation'
 */

SELECT f."title" AS "Películas" 
FROM "film" AS f 
LEFT JOIN "film_category" AS fc ON f."film_id" = fc."film_id" 
LEFT JOIN "category" AS c ON fc."category_id" = c."category_id" 
WHERE c."name" = 'Animation' 
ORDER BY "Películas" ;

/*
 59. Encuentra los nombres de las películas que tienen la misma duración que la 
película con el título ‘Dancing Fever’. Ordena los resultados alfabéticamente 
por título de película
 */

SELECT "title" AS "Películas"
FROM "film" AS f 
WHERE length = (
	SELECT "length" AS "Duración"
	FROM "film" AS f 
	WHERE "title" = 'DANCING FEVER' 
)
ORDER BY "Películas" ;

/*
 60. Encuentra los nombres de los clientes que han alquilado al menos 7 películas 
distintas. Ordena los resultados alfabéticamente por apellido
 */

SELECT CONCAT(c."apellido", ' ', c."nombre") AS "Clientes"
FROM "customer" AS c 
LEFT JOIN "rental" AS r ON c."customer_id" = r."customer_id" 
GROUP BY c."customer_id" , c."apellido", c."nombre"
HAVING COUNT(DISTINCT r."rental_id") > 7
ORDER BY "Clientes" ;

/*
 61. Encuentra la cantidad total de películas alquiladas por categoría y muestra el 
nombre de la categoría junto con el recuento de alquileres
 */

SELECT c."name" AS "Categorías",
	COUNT(r.rental_id) AS "Total_alquiladas"
FROM rental AS r 
LEFT JOIN inventory AS i ON r.inventory_id = i.inventory_id 
LEFT JOIN film AS f ON i.film_id = f.film_id 
LEFT JOIN film_category AS fc ON f.film_id = fc.film_id 
LEFT JOIN category AS c ON fc.category_id = c.category_id 
GROUP BY  c."name"
ORDER BY "Total_alquiladas" DESC ;

--62. Encuentra el número de películas por categoría estrenadas en 2006

SELECT c."name" AS "Categorías",
	COUNT(f.film_id) AS "Total_películas"
FROM "film" AS f 
LEFT JOIN "film_category" AS fc ON f."film_id" = fc."film_id" 
LEFT JOIN "category" AS c ON fc."category_id" = c."category_id" 
WHERE YEAR (f.release_year) = 2006 
GROUP BY c."name" 
ORDER BY "Total_películas" DESC ;

--63. Obtén todas las combinaciones posibles de trabajadores con las tiendas que tenemos

SELECT s.staff_id AS "id_empleados",
	CONCAT(s."apellido", ' ', s."nombre") AS "Empleados",
	s2.store_id AS "id_tiendas"
FROM "staff" AS s 
CROSS JOIN "store" AS s2
ORDER BY "id_empleados" ;

/*
 64. Encuentra la cantidad total de películas alquiladas por cada cliente y
muestra el ID del cliente, su nombre y apellido junto con la cantidad de
películas alquiladas
 */

SELECT c.customer_id AS "id_cliente",
	CONCAT(c."nombre", ' ', c."apellido") AS "Clientes",
	COUNT(r.rental_id) AS "Total_alquiladas"
FROM "customer" AS c 
LEFT JOIN "rental" AS r ON c."customer_id" = r."customer_id" 
GROUP BY c.customer_id 
ORDER BY "Total_alquiladas" DESC ;







