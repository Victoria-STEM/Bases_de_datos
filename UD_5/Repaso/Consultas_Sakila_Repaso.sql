USE SAKILA;

-- 1. MUESTRA LA PELÍCULA MÁS LARGA.
SELECT
    title as pelicula_mas_larga
FROM film
ORDER BY length DESC
LIMIT 1;

-- 2. MUESTRA LA PELÍCULA CON MENOR DURACIÓN
SELECT
    title as pelicula_mas_corta
FROM film
ORDER BY length ASC
LIMIT 1;

-- 3. MUESTRA LOS DISTINTOS RATING DE EDAD USADOS


-- 4. CUÁNTAS PELÍCULAS DURAN MÁS DE 2H
-- 5. MUESTRA EL NOMBRE DE LAS PELÍCULAS Y SU DURACIÓN EN HORAS (ORDENA DE MENOR A MAYOR DURACIÓN)
-- 6. ¿CUÁNTAS PELÍCULAS CONTIENEN ESCENAS ELIMINADAS?
-- 7. ¿QUÉ PELÍCULAS TIENEN "ALIEN" EN SU NOMBRE? (MUESTRA POR ORDEN ALFABÉTICO)
-- 8. ¿CUÁL ES LA PELÍCULA MÁS LARGA QUE PODEMOS VER POR MENOS DE 1$ (RENTAL_RATE)?
-- 9. ¿CUÁNTAS PELÍCULAS SON DOCUMENTALES? (COLUMNA DESCRIPTION)
-- 10. ¿CUÁL ES EL PRECIO DE REEMPLAZO MEDIO DE LAS PELÍCULAS CON RATING "R"?
-- 11. ¿CUÁNTOS DÍAS TARDARÍAMOS EN VER TODAS LAS PELÍCULAS? ¿Y AÑOS?
-- 12. ¿CUÁLES SON LAS TARIFAS DE ALQUILER (RENTAL RATE)?
-- 13. ¿CUÁNTAS PELÍCULAS DURAN MÁS DE 100 MINUTOS Y TIENEN UN RATING DE PG, R O G?
-- 14. ¿CUÁL ES LA PELÍCULA O PELÍCULAS CON MAYOR DURACIÓN DE LAS QUE CONTIENEN TRAILERS COMO EXTRAS?
-- 15. ¿QUÉ PELÍCULAS ESTÁN PROTAGONIZADAS POR UN ASTRONAUTA Y UN ADMINSTRADOR DE BASES DE DATOS (DESCRIPTION)?
-- 16. ¿CUÁNTO DURAN, DE MEDIA, LAS PELÍCULAS PROTAGONIZADAS POR EL ACTOR 1 (FILM_ACTOR)?
-- 17. ¿CUÁNTO TARDARÍAMOS (EN HORAS) EN VER TODAS LAS PELÍCULAS DE CATEGORÍA 6 (FILM_CATEGORY)?
-- 18. MUESTRA LOS PRECIOS DE ALQUILER (RENTAL_RATE) Y CUÁNTAS PELÍCULAS SE ALQUILAN DE CADA PRECIO.
-- 19. MUESTRA LA DURACIÓN MEDIA DE LAS PELÍCULAS AGRUPADAS POR RATING.
-- 20. MUESTRA LA DURACIÓN MEDIA DE LAS PELÍCULAS SIN ESCENAS ELIMINADAS AGRUPADAS POR RATING.
-- 21. ¿CUÁNTO NOS COSTARÍA REEMPLAZAR (REPLACEMENT_COST) LAS PELÍCULAS DE JENNIFER DAVIS (TABLA ACTOR Y FILM_ACTOR) SI VAMOS AL VIDEOCLUB Y LAS DESTRUIMOS?
-- 22. MUESTRA EL NOMBRE DE LAS PELÍCULAS EN MINÚSCULA
-- 23. CREA UN CÓDIGO CONCATENANDO LAS 4 PRIMERAS LETRAS DE CADA PELÍCULA Y LOS 2 ÚLTIMOS DÍGITOS DE LA FECHA DE LANZAMIENTO.
-- 24. IGUAL QUE EL ANTERIOR PERO EN MINÚSCULA
-- 25. CREA UN CÓDIGO DE ACTOR CONCATENANDO LAS 3 PRIMERAS LETRAS DEL NOMBRE Y LAS 3 PRIMERAS LETRAS DE LOS APELLIDOS DE CADA ACTOR Y DÁNDOLE LA VUELTA A LA CADENA. EN MINÚSCULA.
-- 26. MUESTRA LA DURACIÓN MEDIA DE LAS PELÍCULAS AGRUPADAS POR RATING (REDONDEA 2 DECIMALES)
-- 27. SUPONIENDO QUE RENTAL_DURATION ES LA DURACIÓN EN DÍAS DEL ALQUILER, Y QUE RENTAL_RATE ES EL PRECIO DIARIO DE CADA PELÍCULA, MUESTRA: EL NOMBRE DE LA PELÍCULA, LOS DÍAS DE ALQUILER, EL PRECIO DIARIO, EL PRECIO TOTAL Y UNA COLUMNA QUE DIGA CUÁNTOS BILLETES DE 10 DÓLARES NECESITARÍA PARA ALQUILARLA.
-- 28. SELECCIONA EL TÍTULO DE LAS PELÍCULAS, UNA COLUMNA QUE MUESTRE SI DURA MÁS O MENOS DE 2H, OTRA COLUMNA QUE MUESTRE SI TIENE O NO ESCENAS ELIMINADAS Y OTRA QUE MUESTRE SI TIENE O NO TRAILERS (COLUMNAS BOOLEANAS).
-- 29. SELECCIONA EL TÍTULO DE LAS PELÍCULAS Y UNA COLUMNA QUE MUESTRE SI LA PELÍCULA ES APTA PARA TODOS LOS PÚBLICOS (G, PG Y PG-13).
-- 30. SELECCIONA LA DURACIÓN MÁXIMA DE LAS PELÍCULAS AGRUPADAS POR RENTAL_DURATION.
-- 31. SELECCIONA EL COSTE DE REEMPLAZO MEDIO DE LAS PELÍCULAS AGRUPADAS POR DURACIÓN>120.
-- 32. ¿CUÁL ES EL ACTOR QUE MÁS PELÍCULAS HA HECHO? TABLAS ACTOR Y FILM_ACTOR (USA LIMIT 1).
-- 33. MUESTRA LAS CATEGORÍAS DE PELÍCULA (CÓDIGO DE CATEGORÍA) QUE HAY Y CUÁNTAS PELÍCULAS HAY DE CADA CATEGORÍA.
-- 34. MUESTRA LOS DISTINTOS AÑOS DE LANZAMIENTO PARA LOS QUE TENEMOS PELÍCULAS.
-- 35. MUESTRA EN MINÚSCULA EL NOMBRE Y LOS APELLIDOS DE LOS ACTORES QUE HAN HECHO MÁS DE 15 PELÍCULAS (CUENTA SOLO PELÍCULAS DE MÁS DE 100 MINUTOS).
-- 36. ¿CUÁL ES EL RENTAL_RATE MEDIO DE LAS PELÍCULAS EN LAS QUE APARECE UN FRISBEE?
-- 37. ¿QUÉ ACTOR HA PARTICIPADO EN MÁS PELÍCULAS CON FRISBEE? (USA LIMIT 1).



-- 38. SELECCIONA UNA LISTA DE LOS ACTORES (CONCATENA NOMBRE Y APELLIDOS) 
-- Y MUESTRA CUÁNTAS PELÍCULAS HA HECHO CADA ACTOR.
-- ORDENA DE MAYOR A MENOR CANTIDAD DE PELÍCULAS (ACTOR Y FILM_ACTOR).
SELECT
    CONCAT(actor.first_name, " ", actor.last_name) as actor,
    COUNT(*) as numero_peliculas
FROM actor
JOIN film_actor on actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
GROUP by actor.actor_id
ORDER BY numero_peliculas DESC;

SELECT
    CONCAT(a.first_name, " ", a.last_name) as actor,
    COUNT(*) as numero_peliculas
FROM actor as a
JOIN film_actor fa on a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
GROUP by a.actor_id
ORDER BY numero_peliculas DESC;

-- 39. MUESTRA UNA LISTA DE LAS PELÍCULAS Y SU IDIOMA EN MAYÚSCULA.
SELECT
    f.title as peliculas,
    UPPER(l.name) as idioma
from film as f
join language as l on f.language_id = l.language_id;

-- 40. MUESTRA UNA LISTA DE LAS PELÍCULAS Y LA CANTIDAD DE CADA PELÍCULA 
-- QUE TENEMOS EN EL INVENTARIO.
SELECT
    f.title as peliculas,
    COUNT(*) as cantidad_inventario
from film as f
join inventory as i on f.film_id = i.inventory_id
GROUP BY f.film_id;

-- 41. MUESTRA EL NOMBRE Y LOS APELLIDOS DEL USUARIO QUE MÁS PELÍCULAS 
-- HA ALQUILADO.
SELECT
    CONCAT(c.first_name, " ", c.last_name) as cliente
from customer as c
join rental as r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 42. MUESTRA UNA LISTA DE LAS CATEGORÍAS Y 
-- LA DURACIÓN MEDIA DE LAS PELÍCULAS DE CADA CATEGORÍA.
SELECT
    c.name as categoria,
    ROUND(AVG(f.length), 2) as duracion_media
FROM category as c
JOIN film_category as fc ON c.category_id = fc.category_id
JOIN film as f ON fc.film_id = f.film_id
group by c.category_id;

-- 43. MUESTRA LA DIRECCIÓN DE LAS TIENDAS Y CUÁNTAS PELÍCULAS HAY EN CADA UNA.
SELECT
    a.address as direccion,
    COUNT(*) as numero_peliculas
from address as a
JOIN store as s on a.address_id = s.address_id
JOIN inventory as i on s.store_id = i.store_id
GROUP BY s.store_id;

-- address -> address_id
-- inventory -> inventory_id, film_id, store_id
-- store -> address_id, store_id

-- 44. ¿CUÁL ES LA PELÍCULA DE LA QUE TENEMOS MÁS COPIAS?
SELECT
    f.title as peliculas
from film as f
join inventory as i on f.film_id = i.inventory_id
GROUP BY f.film_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 45. MUESTRA LA DIRECCIÓN DE LAS TIENDAS Y CUÁNTO EN TOTAL HA FACTURADO CADA UNA.
SELECT
    a.address as direccion,
    SUM(p.amount) as facturacion
from address as a
JOIN store as s ON a.address_id = s.address_id
JOIN inventory as i ON s.store_id = i.store_id
JOIN rental as r ON i.inventory_id = r.inventory_id
JOIN payment as p ON r.rental_id = p.rental_id
GROUP by s.store_id;

-- address -> address_id
-- store -> store_id, address_id
-- inventory -> inventory_id, film_id, store_id
-- rental -> rental_id, inventory_id
-- payment -> payment_id, staff_id, rental_id

-- 46. MUESTRA UNA LISTA DE LAS PELÍCULAS Y CUÁNTO HAN PAGADO DE MEDIA POR ALQUILARLAS.
SELECT
    f.title as peliculas,
    ROUND(AVG(p.amount), 2) as precio_medio
from film as f
join inventory as i on f.film_id = i.film_id
join rental as r on i.inventory_id = r.inventory_id
join payment as p on r.rental_id = p.rental_id
group by f.film_id;


-- film -> film_id
-- inventory -> inventory_id, store_id, film_id
-- rental -> rental_id, inventory_id, customer_id, staff_id
-- payment -> payment_id, rental_id, customer_id, staff_id

-- 47. ¿CUÁL HA SIDO LA PELÍCULA MÁS RENTABLE?
SELECT
    f.title as pelicula
from film as f
join inventory as i on f.film_id = i.film_id
join rental as r on i.inventory_id = r.inventory_id
join payment as p on r.rental_id = p.rental_id
group by f.film_id
ORDER BY SUM(p.amount) DESC
LIMIT 1;

-- 48. MUESTRA UNA LISTA DE LOS CLIENTES Y CUÁNTO DINERO HA GASTADO CADA UNO.
SELECT
    CONCAT(c.first_name, " ", c.last_name) as cliente,
    SUM(p.amount) as gasto
from customer as c
join payment as p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;

-- customer -> customer_id, store_id, address_id
-- payment -> payment_id, rental_id, customer_id, staff_id
-- film -> film_id
-- inventory -> inventory_id, store_id, film_id
-- rental -> rental_id, inventory_id, customer_id, staff_id


-- 49. ¿QUIÉN HA SIDO EL CLIENTE MÁS RENTABLE?
SELECT
    CONCAT(c.first_name, " ", c.last_name) as cliente
from customer as c
join payment as p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY SUM(p.amount) DESC
LIMIT 1;

-- 50. ¿HAY ALGUNA PELÍCULA PARA LA QUE NO TENGAMOS NINGUNA COPIA?
SELECT
    f.title as pelicula,
    i.inventory_id as COPIA
from film as f
LEFT JOIN inventory as i on f.film_id = i.film_id
WHERE i.inventory_id IS NULL;

-- film -> film_id
-- inventory -> inventory_id, store_id, film_id
-- customer -> customer_id, store_id, address_id
-- payment -> payment_id, rental_id, customer_id, staff_id
-- rental -> rental_id, inventory_id, customer_id, staff_id

-- 51. MUESTRA UNA LISTA DE LAS PELÍCULAS QUE NOS FALTAN EN LA TIENDA 2.
SELECT
    f.title as pelicula,
    i.inventory_id as COPIA
from film as f
LEFT JOIN inventory as i on f.film_id = i.film_id
LEFT JOIN store as s on i.store_id = s.store_id
WHERE i.inventory_id IS NULL AND s.store_id = 2;

-- film -> film_id
-- inventory -> inventory_id, store_id, film_id
-- store -> store_id, address_id
-- customer -> customer_id, store_id, address_id
-- payment -> payment_id, rental_id, customer_id, staff_id
-- rental -> rental_id, inventory_id, customer_id, staff_id



-- REHACER A PARTIR DE AQUI !!!



-- 52. ¿CUÁL ES EL ACTOR MÁS FAMOSO?
SELECT
    CONCAT(ACTOR.FIRST_NAME, " ", ACTOR.LAST_NAME) AS ACTOR
FROM RENTAL RENT
JOIN INVENTORY INV ON RENT.INVENTORY_ID=INV.INVENTORY_ID
JOIN FILM ON INV.FILM_ID=FILM.FILM_ID
JOIN FILM_ACTOR FA ON FA.FILM_ID=FILM.FILM_ID
JOIN ACTOR ON FA.ACTOR_ID=ACTOR.ACTOR_ID
GROUP BY ACTOR.ACTOR_ID
ORDER BY  COUNT(*) DESC
LIMIT 1;

-- actor -> actor_id
-- film_actor -> actor_id, film_id
-- film -> film_id
-- payment -> payment_id, rental_id, customer_id, staff_id
-- rental -> rental_id, inventory_id, customer_id, staff_id
-- store -> store_id, address_id
-- customer -> customer_id, store_id, address_id
-- inventory -> inventory_id, store_id, film_id

-- 53. ¿CUÁL ES LA PELÍCULA MÁS ALQUILADA EN LA TIENDA 2?
SELECT
    film.title as pelicula
FROM film
JOIN inventory on film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.film_id
ORDER BY COUNT(*) DESC
limit 1;


-- 54. ¿DESDE QUÉ PAÍS NOS HAN ALQUILADO MÁS PELÍCULAS?
SELECT


-- 55. MUESTRA LA DIRECCIÓN DE CADA TIENDA Y LA CANTIDAD DE USUARIOS INACTIVOS.
-- 56. ¿CUÁNTOS USUARIOS SIN TELÉFONO TENEMOS?
-- 57. MUESTRA UN LISTADO DE LAS CATEGORÍAS Y CUÁNTO DINERO HEMOS GANADO CON CADA UNA DE ELLAS.