USE tv;

-- Ejercicios de práctica para JOIN, LEFT JOIN y RIGHT JOIN

-- 1. Obtener los títulos de todos los programas junto con el nombre 
-- del canal en el que se transmiten.
SELECT
    programa.titulo AS programa,
    canal.nombre as canal
from programa
JOIN canal on programa.canal_id = canal.id
WHERE programa.titulo is not null; -- ?

-- programa > id, canal_id
-- emision > id, canal_id

-- 2. Listar todos los programas con su categoría correspondiente.
SELECT
    programa.titulo as programa,
    categoria.nombre as categoria
from programa
JOIN categoria ON programa.categoria_id = categoria.id
WHERE programa.titulo is not null;


-- 3. Mostrar los presentadores y los programas que conducen.
-- la clave esta en que solo hay un presentador con una categoria asociado a un programa.
-- El resto de presentadores estan asocieados a especialidades/categorias que no tiene programas asignados.
SELECT
    presentador.nombre as presentador,
    programa.titulo as programa
from presentador
JOIN programa ON categoria.id = programa.categoria_id
JOIN categoria ON presentador.especialidad = categoria.nombre;
where categoria.nombre = presentador.especialidad;

-- programa > id, categoria_id, canal_id
-- presentador > id, especialidad
-- categoria > nombre, id

SELECT
    presentador.nombre as presentador,
    categoria.nombre as categoria,
    programa.titulo as programa
from presentador
JOIN categoria ON presentador.especialidad = categoria.nombre
JOIN programa ON categoria.id = programa.categoria_id;

SELECT
    presentador.nombre as presentador,
    categoria.nombre as categoria,
    programa.titulo as programa
from presentador
JOIN categoria ON presentador.especialidad = categoria.nombre
JOIN programa ON programa.categoria_id = categoria.id;
where ;

-- SELECT
--     presentador.nombre as presentador,
--     presentador.especialidad
-- from presentador;

-- SELECT
--     presentador.nombre as presentador
-- from presentador;

-- SELECT
--     programa.titulo as programa,
--     categoria.nombre as categoria
-- from programa
-- JOIN categoria ON programa.categoria_id = categoria.id;


-- 4. Obtener todos los programas y sus emisiones, 
-- incluyendo aquellos que aún no han sido transmitidos.
SELECT
    programa.titulo as programa,
    emision.fecha as emision
from programa
JOIN emision on programa.id = emision.programa_id
where programa.titulo is not null; -- ?? no se si es necesario el not null...


-- 5. Listar todos los espectadores y los programas que han calificado, 
-- incluyendo espectadores sin calificaciones.
-- SELECT
--     espectador.nombre as espectadore,
--     programa.titulo as programas
-- from programa
-- left JOIN opinion on programa.id = opinion.programa_id
-- left JOIN espectador ON opinion.espectador_id = espectador.id;

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



-- 6. Obtener todas las empresas que han colocado publicidad, junto con los productos publicitados.

-- 7. Listar todas las emisiones, incluyendo aquellas que aún no tienen programa asignado.

-- 8. Mostrar todos los programas y, si existen, las opiniones que han recibido.

-- 9. Obtener todos los canales y los programas que transmiten, asegurando que aparezcan los canales sin programas asignados.

-- 10. Listar todas las productoras junto con los programas que han producido, incluyendo aquellas que no tienen programas asignados.

-- 11. Obtener todos los programas y, si existen, los guionistas que participaron en ellos.

-- 12. Mostrar todas las emisiones, incluyendo aquellas que no tienen un canal asociado.

-- 13. Listar todos los programas junto con los canales en los que se transmitieron, incluyendo programas sin canal registrado.

-- 14. Mostrar todas las opiniones y los programas relacionados, asegurando que se incluyan las opiniones sin programa.

-- 15. Obtener todos los espectadores y, si existen, las opiniones que han realizado.

-- 16. Mostrar todas las productoras y los programas producidos, incluyendo programas sin productora asignada.

-- 17. Obtener todos los programas y sus respectivas categorías, incluyendo categorías sin programas asignados.

-- 18. Listar todas las publicidades y los programas en los que aparecen, incluyendo publicidades no relacionadas con programas.

-- 19. Obtener todos los canales y los programas asociados, incluyendo canales sin programas.

-- 20. Listar todas las emisiones y los programas correspondientes, incluyendo emisiones sin programas.

-- 21. Obtener todos los programas junto con su canal, categoría y presentador.

-- 22. Listar todas las emisiones con la información del programa, canal y productora.

-- 23. Obtener los espectadores con las calificaciones que han dado y los programas correspondientes.

-- 24. Listar todas las opiniones con los datos del espectador, el programa y el canal en el que se transmitió.

-- 25. Obtener todas las emisiones con los datos completos: fecha, programa, categoría, canal, productora y presentador.

-- 26. Mostrar todas las opiniones con detalles completos del espectador, programa, canal, categoría y guionista.

-- 27. Obtener todas las publicidades con la empresa, producto, programa, el canal donde aparecen y el presentador del programa.

-- 28. Listar todas las emisiones con la información del programa, el canal en el que se emitió y las opiniones que recibió.

-- 29. Obtener los programas con sus respectivos guionistas, canales donde se transmiten y productoras asociadas.

-- 30. Mostrar todas las opiniones con la calificación dada, el programa, el canal donde se emitió, la categoría del programa y la empresa publicitaria asociada.