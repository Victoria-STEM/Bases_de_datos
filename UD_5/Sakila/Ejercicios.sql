USE SAKILA;

-- 1. MUESTRA LA PELÍCULA MÁS LARGA
SELECT
    TITLE,
    length
FROM film
ORDER BY length DESC
LIMIT 1;

-- 2. MUESTRA LA PELÍCULA CON MENOR DURACIÓN
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

--JOIN
-- 38. SELECCIONA UNA LISTA DE LOS ACTORES (CONCATENA NOMBRE Y APELLIDOS) 
-- Y MUESTRA CUÁNTAS PELÍCULAS HA HECHO CADA ACTOR.
SELECT
    concat(ACTOR.FIRST_NAME, " ", ACTOR.LAST_NAME) as actor,
    count(FILM_actor.film_id) AS cantidad_peliculas
FROM ACTOR
JOIN film_actor ON actor.actor_id = FILM_actor.actor_id
GROUP BY actor.actor_id;


-- 39. MUESTRA UNA LISTA DE LAS PELÍCULAS Y SU IDIOMA EN MAYÚSCULA.
SELECT
    film.title,
    language.name
FROM film
JOIN language ON film.language_id = language.language_id;


-- 40. MUESTRA UNA LISTA DE LAS PELÍCULAS Y 
-- LA CANTIDAD DE CADA PELÍCULA QUE TENEMOS EN EL INVENTARIO.
SELECT
    film.title,
    count(*) AS stock
from film
JOIN inventory ON film.film_id = inventory.film_id
GROUP BY film.title;


-- 41. MUESTRA EL NOMBRE Y LOS APELLIDOS DEL USUARIO QUE MÁS PELÍCULAS HA ALQUILADO.
SELECT
    rental.CUSTOMER_ID,
    CONCAT(customer.first_name, " ", customer.last_name) AS Nombre_Apellido,
    COUNT(*) AS cantidad_peliculas_alquiladas
from rental
JOIN customer ON rental.customer_id = customer.customer_id
GROUP BY customer_id
ORDER BY COUNT(*) DESC
LIMIT 1;


-- 42. MUESTRA UNA LISTA DE LAS CATEGORÍAS Y 
-- LA DURACIÓN MEDIA DE LAS PELÍCULAS DE CADA CATEGORÍA.
SELECT
    category.name as category,
    ROUND(AVG(film.length)) AS duracion_media
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.category_id = film.film_id

group by category.category_id;

-- film.film_id
-- film_category.category_id
-- category.category_id

-- 43. MUESTRA LA DIRECCIÓN DE LAS TIENDAS Y CUÁNTAS PELÍCULAS HAY EN CADA UNA.
SELECT
    address.address as direccion,
    COUNT(*) AS numero_peliculas
FROM address
JOIN store ON address.address_id = store.address_id
JOIN inventory ON store.address_id = inventory.store_id 
GROUP BY store.address_id;

-- SELECT
--     store.store_id
-- from store;

-- address.address_id
-- store.address_id,
-- inventory.store_id

-- 44. ¿CUÁL ES LA PELÍCULA DE LA QUE TENEMOS MÁS COPIAS?
SELECT
    f.title,
    count(*) AS stock
from film f
JOIN inventory i ON f.film_id = i.film_id
GROUP BY f.title
ORDER BY count(*) DESC
LIMIT 1;


-- 45. MUESTRA LA DIRECCIÓN DE LAS TIENDAS Y CUÁNTO EN TOTAL HA FACTURADO CADA UNA.

-- Está mal:
SELECT
    address.address as direccion,
    SUM(payment.amount) as facturacion -- era un SUM no n count!
FROM address
JOIN staff ON address.address_id = staff.address_id
JOIN payment ON staff.staff_id = payment.staff_id 
GROUP BY address.address_id;

-- Está bien:
SELECT
    address.address as direccion,
    SUM(payment.amount) as facturacion
FROM payment
join rental on payment.rental_id = rental.rental_id
join inventory on rental.inventory_id = inventory.inventory_id
join store on inventory.store_id = store.store_id
join address on store.address_id = address.address_id
GROUP BY store.store_id;

-- address >> address_id
-- staff >> staff_id
-- staff >> address_id
-- payment >> staff_id


-- 46. MUESTRA UNA LISTA DE LAS PELÍCULAS Y CUÁNTO HAN PAGADO DE MEDIA POR ALQUILARLAS.

-- SELECT
--     film.title as titulo_pelicula,
--     AVG(film.rental_rate) as media_alquiler
-- FROM film
-- JOIN inventory on film.film_id = inventory.film_id
-- JOIN rental ON inventory.inventory_id = rental.inventory_id
-- GROUP BY film.title;

-- SELECT
--     title,
--     rental_rate,
--     rental_id
-- from film;

-- SELECT
--     amount,
--     rental_id
-- from payment;

SELECT
    film.title as peliculas,
    ROUND(AVG(payment.amount), 2) AS media_pago
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY film.film_id;


-- 47. ¿CUÁL HA SIDO LA PELÍCULA MÁS RENTABLE?
SELECT
    film.title as peliculas
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY film.film_id
ORDER BY Sum(payment.amount) DESC
LIMIT 1;


-- 48. MUESTRA UNA LISTA DE LOS CLIENTES Y CUÁNTO DINERO HA GASTADO CADA UNO.
SELECT
    CONCAT(customer.first_name, " ", customer.last_name) AS nombre_cliente,
    SUM(payment.amount) AS gastos_por_cliente
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY payment.customer_id;


-- 49. ¿QUIÉN HA SIDO EL CLIENTE MÁS RENTABLE?
SELECT
    CONCAT(customer.first_name, " ", customer.last_name) AS cliente,
    SUM(payment.amount) AS ingresos_generados
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY payment.customer_id
ORDER BY SUM(payment.amount) DESC
LIMIT 1;


-- 50. ¿HAY ALGUNA PELÍCULA PARA LA QUE NO TENGAMOS NINGUNA COPIA?
SELECT
    -- inventory.inventory_id AS numero_inventario,
    film.title As titulo_pelicula
from film
LEFT JOIN inventory ON film.film_id = inventory.film_id 
WHERE inventory.inventory_id IS NULL;

-- 51. MUESTRA UNA LISTA DE LAS PELÍCULAS QUE NOS FALTAN EN LA TIENDA 2.
SELECT
    inventory.inventory_id AS numero_inventario,
    inventory.store_id AS ID_tienda,
    film.title As titulo_pelicula
from film
LEFT JOIN inventory ON film.film_id = inventory.film_id
WHERE inventory.inventory_id IS NULL AND inventory.store_id = 2;


-- 52. ¿CUÁL ES EL ACTOR MÁS FAMOSO?
SELECT 
    CONCAT(actor.first_name, " ", actor.last_name) AS actor,
    COUNT(film_actor.film_id) AS numero_peliculas 
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY COUNT(film_actor.film_id) DESC
LIMIT 1;

-- 53. ¿CUÁL ES LA PELÍCULA MÁS ALQUILADA EN LA TIENDA 2?
-- SELECT
--     film.title AS titulo,
--     COUNT(rental.inventory_id) AS veces_alquilada
-- from film
-- JOIN rental on inventory.inventory_id = rental.inventory_id
-- JOIN inventory on film.film_id = inventory.film_id
-- GROUP BY film.film_id;

SELECT
    film.title AS titulo,
    COUNT(rental.inventory_id) AS veces_alquilada
from rental
JOIN inventory on rental.inventory_id = inventory.inventory_id
JOIN film on inventory.film_id = film.film_id
GROUP BY film.film_id
ORDER BY COUNT(rental.inventory_id) DESC
LIMIT 1;

-- rental >> rental_id, inventory_id
-- inventory > film_id
-- film >> film_id

-- 54. ¿DESDE QUÉ PAÍS NOS HAN ALQUILADO MÁS PELÍCULAS?
SELECT
    country.country AS pais
FROM country
JOIN city on country.country_id = city.country_id
JOIN address on city.city_id = address.city_id
JOIN store ON address.address_id = store.address_id
JOIN inventory On store.store_id = inventory.store_id
JOIN rental on inventory.inventory_id = rental.inventory_id
group by country.country_id
ORDER by COUNT(rental.rental_id) DESC
LIMIT 1;

-- SELECT
--     rental_id
-- from rental;

-- country > country_id
-- city > country_id, city_id
-- address > address_id, city_id
-- store > address_id, store_id

-- inventory > inventory_id, store_id
-- rental > customer_id, inventory_id, rental_id 


-- 55. MUESTRA LA DIRECCIÓN DE CADA TIENDA Y LA CANTIDAD DE USUARIOS INACTIVOS.
SELECT
    address.address as direccion_tienda,
    count(customer.active) as usuarios_inactivos
from address
LEFT JOIN customer on address.address_id = customer.address_id
LEFT JOIN store on customer.address_id = store.address_id 
group by address.address_id
WHERE customer.active = 0;

-- SELECT
--     active
-- from customer;

-- address >> address_id
-- customer >> customer, address_id
-- store >> address_id

-- 56. ¿CUÁNTOS USUARIOS SIN TELÉFONO TENEMOS?
SELECT
    COUNT(address.phone) AS usuarios_sin_telefono
from address
LEFT JOIN customer ON address.address_id = customer.address_id
WHERE address.phone IS NULL;

-- address > address_id, city_id
-- customer > customer_id, store_id, address_id
SELECT
    phone
from address;

-- 57. MUESTRA UN LISTADO DE LAS CATEGORÍAS Y CUÁNTO DINERO 
-- HEMOS GANADO CON CADA UNA DE ELLAS.
SELECT
    category.name AS nombre_categorias,
    SUM(payment.amount) AS ganacias_obtenidas
from category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film on film_category.film_id = film.film_id
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN payment ON rental.rental_id = payment.rental_id 
GROUP BY category.category_id;

-- category > category_id
-- film_category > category_id, film_id
-- film > film_id
-- inventory > inventory_id, film_id, store_id
-- rental > rental_id, inventory_id, customer_id, staff_id
-- payment > payment_id, customer_id, rental_id, staff_id