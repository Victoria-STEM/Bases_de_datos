USE tv;

-- Ejercicios de práctica para JOIN, LEFT JOIN y RIGHT JOIN

-- 1. Obtener los títulos de todos los programas junto con el nombre 
-- del canal en el que se transmiten.

SELECT
    programa.titulo AS programa,
    canal.nombre as canal
from programa
LEFT JOIN canal on programa.canal_id = canal.id
WHERE programa.titulo is not null; -- ?

-- programa > id, canal_id
-- emision > id, canal_id

-- 2. Listar todos los programas con su categoría correspondiente.

SELECT
    programa.titulo as programa,
    categoria.nombre as categoria
from programa
LEFT JOIN categoria ON programa.categoria_id = categoria.id
WHERE programa.titulo is not null;


-- 3. Mostrar los presentadores y los programas que conducen.
-- la clave esta en que solo hay un presentador con una categoria asociado a un programa.
-- El resto de presentadores estan asocieados a especialidades/categorias que no tiene programas asignados.

SELECT
    presentador.nombre as presentador,
    programa.titulo as programa
from programa
JOIN programa_presentador ON programa_presentador.programa_id = programa.id
JOIN presentador ON presentador.id = programa_presentador.presentador_id;

-- programa > id, categoria_id, canal_id
-- presentador > id, especialidad
-- categoria > nombre, id


-- 4. Obtener todos los programas y sus emisiones, 
-- incluyendo aquellos que aún no han sido transmitidos.
SELECT
    programa.titulo as programa,
    emision.fecha as emision
from programa
LEFT JOIN emision on programa.id = emision.programa_id
where programa.titulo is not null; -- ?? no se si es necesario el not null...


-- 5. Listar todos los espectadores y los programas que han calificado, 
-- incluyendo espectadores sin calificaciones.

SELECT
    espectador.nombre as espectadore,
    programa.titulo as programas
from espectador
left JOIN opinion on espectador.id = opinion.espectador_id
left JOIN programa ON opinion.programa_id = programa.id
where espectador.nombre is not null;

-- select 
--     nombre
-- from espectador;


-- 6. Obtener las empresas que han colocado publicidad, junto con los productos publicitados.
SELECT
    empresa,
    producto
from publicidad;


-- 7. Listar las emisiones, incluyendo aquellas que aún no tienen programa asignado.
SELECT
    emision.fecha as emision,
    programa.titulo as programa
from emision
LEFT JOIN programa On emision.programa_id = programa.id;


-- 8. Mostrar todos los programas y, si existen, las opiniones que han recibido.
SELECT
    programa.titulo as programa,
    opinion.comentario as opiniones
from programa
left join opinion on programa.id = opinion.programa_id;

-- 9. Obtener todos los canales y los programas que transmiten, 
-- asegurando que aparezcan los canales sin programas asignados.
SELECT
    canal.nombre as canal,
    programa.titulo as programa
from canal
LEFT JOIN programa on canal.id = programa.canal_id;

SELECT
    nombre,
    id
from canal;

-- 10. Listar las productoras junto con los programas que han producido, 
-- incluyendo aquellas que no tienen programas asignados.
SELECT
    productora.nombre as productora,
    programa.titulo as programa
from productora
LEFT JOIN programa ON productora.id = programa.productora_id;

-- 11. Obtener todos los programas y, si existen, los guionistas que participaron en ellos.
SELECT
    programa.titulo as programa,
    guionista.nombre as guionista
FROM programa
LEFT JOIN programa_guionista ON programa.id = programa_guionista.programa_id
JOIN guionista ON programa_guionista.guionista_id = guionista.id;

-- 12. Mostrar las emisiones, incluyendo aquellas que no tienen un canal asociado.
SELECT
    emision.fecha as emision,
    canal.nombre as canal
from emision
LEFT JOIN canal on emision.canal_id = canal.id;

-- 13. Listar todos los programas junto con los canales en los que se transmitieron, 
-- incluyendo programas sin canal registrado.
SELECT
    programa.titulo as programa,
    canal.nombre as canal
FROM programa
LEFT JOIN canal on programa.canal_id = canal.id;


-- 14. Mostrar las opiniones y los programas relacionados, asegurando que se incluyan las opiniones sin programa.
SELECT
    opinion.comentario as opiniones,
    programa.titulo as programa
from opinion
LEFT JOIN programa ON opinion.programa_id = programa.id;

-- 15. Obtener todos los espectadores y, si existen, las opiniones que han realizado.
SELECT
    espectador.nombre as espectador,
    opinion.calificacion as calificacion,
    opinion.comentario as comentario
FROM espectador
LEFT JOIN opinion ON espectador.id = opinion.espectador_id;

-- 16. Mostrar las productoras y los programas producidos, incluyendo programas sin productora asignada.


-- 17. Obtener todos los programas y sus respectivas categorías, incluyendo categorías sin programas asignados.

-- 18. Listar las publicidades y los programas en los que aparecen, incluyendo publicidades no relacionadas con programas.

-- 19. Obtener todos los canales y los programas asociados, incluyendo canales sin programas.

-- 20. Listar las emisiones y los programas correspondientes, incluyendo emisiones sin programas.

-- 21. Obtener todos los programas junto con su canal, categoría y presentador.

-- 22. Listar las emisiones con la información del programa, canal y productora.

-- 23. Obtener los espectadores con las calificaciones que han dado y los programas correspondientes.

-- 24. Listar las opiniones con los datos del espectador, el programa y el canal en el que se transmitió.

-- 25. Obtener las emisiones con los datos completos: fecha, programa, categoría, canal, productora y presentador.

-- 26. Mostrar las opiniones con detalles completos del espectador, programa, canal, categoría y guionista.

-- 27. Obtener las publicidades con la empresa, producto, programa, el canal donde aparecen y el presentador del programa.

-- 28. Listar las emisiones con la información del programa, el canal en el que se emitió y las opiniones que recibió.

-- 29. Obtener los programas con sus respectivos guionistas, canales donde se transmiten y productoras asociadas.

-- 30. Mostrar las opiniones con la calificación dada, el programa, el canal donde se emitió, la categoría del programa y la empresa publicitaria asociada.