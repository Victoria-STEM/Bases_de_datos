DROP DATABASE IF EXISTS semanaSanta;
-- Crear la base de datos
CREATE DATABASE semanaSanta;
USE semanaSanta;

-- Tabla procesion
CREATE TABLE procesion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dia_semana VARCHAR(20) NOT NULL,
    hora_inicio TIME NOT NULL,
    barrio VARCHAR(50) NOT NULL
);

-- Tabla hermandad
CREATE TABLE hermandad (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    antiguedad INT NOT NULL,
    numero_costaleros INT NOT NULL
);

-- Tabla paso
CREATE TABLE paso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    estilo VARCHAR(50) NOT NULL,
    peso INT NOT NULL
);

-- Tabla itinerario
CREATE TABLE itinerario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_procesion INT NOT NULL,
    punto VARCHAR(100) NOT NULL,
    hora_paso TIME NOT NULL,
    FOREIGN KEY (id_procesion) REFERENCES procesion(id)
);

-- Inserciones en la tabla procesion
INSERT INTO procesion (nombre, dia_semana, hora_inicio, barrio) VALUES
('La Esperanza', 'Lunes Santo', '18:30:00', 'Realejo'),
('El Silencio', 'Miércoles Santo', '23:00:00', 'Centro'),
('La Aurora', 'Domingo de Ramos', '17:00:00', 'Albaicín'),
('La Soledad', 'Viernes Santo', '19:30:00', 'Sacromonte');

-- Inserciones en la tabla hermandad
INSERT INTO hermandad (nombre, antiguedad, numero_costaleros) VALUES
('Hermandad del Silencio', 1578, 90),
('Hermandad de la Aurora', 1635, 120),
('Hermandad de la Esperanza', 1945, 80),
('Hermandad de la Soledad', 1500, 100),
('Hermandad de la Virgen de la cabeza', 1500, 100);

-- Inserciones en la tabla paso
INSERT INTO paso (nombre, estilo, peso) VALUES
('Paso del Cristo del Silencio', 'Barroco', 2000),
('Paso de la Virgen de la Aurora', 'Renacentista', 1800),
('Paso de Jesús de la Esperanza', 'Gótico', 2200),
('Paso de la Virgen de la Soledad', 'Neoclásico', 1900);

-- Inserciones en la tabla itinerario
INSERT INTO itinerario (id_procesion, punto, hora_paso) VALUES
(1, 'Plaza Nueva', '19:00:00'),
(1, 'Catedral', '20:30:00'),
(2, 'Puerta Real', '23:30:00'),
(2, 'Gran Vía', '00:15:00'),
(3, 'Carrera del Darro', '17:30:00'),
(3, 'Plaza de San Nicolás', '18:15:00'),
(4, 'Paseo de los Tristes', '20:00:00'),
(4, 'Abadía del Sacromonte', '21:30:00');


-- 1. Listar todos los nombres de las procesiones.
SELECT nombre as nombre_procesiones
from procesion;

-- 2. Mostrar los barrios donde se realizan las procesiones, sin repetir.
SELECT DISTINCT barrio as barrio_procesiones
from procesion;

-- 3. Obtener el nombre y la hora de inicio de todas las procesiones 
-- que comienzan después de las 18:00.
SELECT 
    nombre,
    hora_inicio
FROM procesion
WHERE hora_inicio > '18:00:00';

-- 4. Seleccionar el nombre y estilo de todos los pasos.
SELECT
    nombre,
    estilo 
FROM paso;

-- 5. Mostrar el nombre de las hermandades que tienen más de 100 costaleros.
SELECT
    nombre as 'Nombre hermandades',
    numero_costaleros
FROM hermandad
WHERE numero_costaleros > 100;

-- 6. Listar las procesiones que ocurren el Viernes Santo.
SELECT
    nombre 
FROM procesion
WHERE dia_semana = 'Viernes Santo';

-- 7. Mostrar los puntos de paso de las procesiones que pasan por 'Catedral'.
SELECT
    punto
FROM itinerario
WHERE id_procesion = (SELECT id_procesion from itinerario  WHERE punto = 'Catedral');

-- 8. Obtener las procesiones que tienen lugar en el barrio 'Centro'.
SELECT
    nombre
FROM procesion
WHERE barrio = 'Centro';

-- 9. Listar los estilos de pasos únicos.
SELECT DISTINCT nombre, estilo
FROM paso;

-- 10. Mostrar los nombres de los pasos que pesan más de 1900 kg.
SELECT nombre, peso
FROM paso
WHERE peso > 1900;

-- 11. Listar los pasos cuyo peso esté entre 1800 y 2200 kg.
SELECT nombre, peso
FROM paso
WHERE peso BETWEEN 1800 AND 2200;

-- 12. Mostrar las hermandades fundadas antes del año 1600.
SELECT nombre, antiguedad
FROM hermandad
WHERE antiguedad < 1600;

-- 13. Seleccionar las procesiones que comienzan después 
-- de las 19:00 y están en el barrio 'Realejo'.
SELECT nombre 
FROM procesion
WHERE hora_inicio > '19:00:00' AND barrio = 'Realejo';

-- 14. Listar las hermandades que tienen más de 80 costaleros 
-- o fueron fundadas después de 1900.
SELECT 
    nombre,
    numero_costaleros,
    antiguedad
FROM hermandad
WHERE numero_costaleros > 80 OR antiguedad > 1900;

-- 15. Mostrar las procesiones que no se realizan el Domingo de Ramos.
SELECT 
    nombre,
    dia_semana
FROM procesion
WHERE dia_semana != 'Domingo de Ramos';

-- 16. Mostrar todas las procesiones ordenadas por la hora de inicio 
-- en orden ascendente.
SELECT
    nombre,
    hora_inicio
FROM procesion
ORDER BY hora_inicio ASC;

-- 17. Listar las hermandades ordenadas por antigüedad de forma descendente.
SELECT
    nombre,
    antiguedad
FROM hermandad
ORDER BY antiguedad DESC;

-- 18. Seleccionar los pasos ordenados por peso y, en caso de empate, 
-- por estilo alfabético.
SELECT
    nombre,
    peso,
    estilo
FROM paso
ORDER BY peso DESC, estilo DESC;

-- 19. Ordenar las procesiones por día de la semana (Lunes primero). ESPECIAL
SELECT
    nombre,
    dia_semana
FROM procesion
ORDER BY dia_semana DESC;


-- 20. Mostrar los puntos de paso de las procesiones ordenados 
-- por hora de paso en orden descendente.
SELECT
    id_procesion,
    punto,
    hora_paso
FROM itinerario
ORDER BY hora_paso DESC;

-- 21. Contar cuántas procesiones hay en total.
SELECT COUNT(*) AS 'Numero Total Procesiones'
FROM procesion;

-- 22. Obtener el peso promedio de todos los pasos.
SELECT AVG(peso) AS 'Peso Promedio de los pasos'
FROM paso;

-- 23. Calcular el número máximo de costaleros en una hermandad.
SELECT 
    numero_costaleros AS 'Numero Maximo Costaleros',
    nombre
FROM hermandad
WHERE numero_costaleros = (SELECT MAX(numero_costaleros) FROM hermandad);


-- 24. Obtener el número de procesiones que se realizan en 
-- el barrio 'Albaicín'.
SELECT 
    COUNT(*) AS 'Numero procesiones del Albaicín'
FROM procesion
WHERE barrio = 'Albaicín';


-- 25. Sumar el peso de todos los pasos.
SELECT
    SUM(peso) AS 'Peso total pasos'
FROM paso;


-- 26. Agrupar las procesiones por barrio y contar 
-- cuántas procesiones hay en cada uno.
SELECT
    barrio,
    COUNT(*) AS 'Numero Procesiones por Barrio'
FROM procesion
GROUP BY barrio;


-- 27. Calcular el peso total de los pasos agrupados 
--por estilo.
SELECT
    estilo,
    SUM(peso) AS 'Peso total por estilo'
FROM paso
GROUP BY estilo;


-- 28. Mostrar las hermandades agrupadas por número 
-- de costaleros, filtrando aquellas con más de 100 costaleros.
SELECT
    numero_costaleros AS 'Numero costaleros',
    nombre
FROM hermandad
WHERE numero_costaleros > 100;


-- 29. Obtener el número de procesiones que tienen puntos 
-- de paso después de las 20:00.
SELECT 
    COUNT(*) AS 'Numero procesiones'
FROM itinerario
WHERE hora_paso > '20:00:00';


-- 30. Agrupar las hermandades por antigüedad y 
-- contar cuántas hay en cada rango.
SELECT
    COUNT(*) AS 'Numero hermanandas por antiguedad'
FROM hermandad
GROUP BY antiguedad;

-- 31. Concatenar el nombre y barrio de cada procesión 
-- en un único campo, separados por un guion.
SELECT
    CONCAT(nombre, " - ", barrio) AS 'Nombre - Barrio'
FROM procesion;

-- 32. Mostrar las procesiones cuyos nombres contienen 
-- más de 10 caracteres.
SELECT
    nombre,
    CHAR_LENGTH(nombre) AS numero_caracteres
FROM procesion
HAVING CHAR_LENGTH(nombre) > 10;

-- 33. Seleccionar los nombres de las procesiones que contienen 
-- la palabra 'Soledad'.
SELECT
    nombre
FROM procesion
WHERE nombre LIKE '%soledad%';


-- 34. Mostrar las hermandades ordenadas por el número 
-- de costaleros en orden ascendente.
SELECT
    nombre,
    numero_costaleros
FROM hermandad
ORDER BY numero_costaleros ASC;


-- 35. Listar los nombres de los pasos en los que la palabra 
-- 'Virgen' no aparece.
SELECT
    nombre
FROM paso
WHERE NOT nombre LIKE '%Virgen%'; 

-- 36. Calcular la diferencia entre el peso máximo y mínimo 
-- de los pasos.
SELECT
    MAX(peso) - MIN(peso) AS 'Diferencia entre el peso MAX y MIN'
FROM paso;


-- 37. Mostrar solo las procesiones cuyo nombre no empieza con 'La'.
SELECT
    nombre
FROM procesion
WHERE NOT nombre LIKE 'La%';


-- 38. Formatear la hora de inicio de las procesiones en 
-- formato de 12 horas con AM/PM.
SELECT
    DATE_FORMAT(hora_inicio, '%H:%i %p') AS 'Hora inicio AM/PM'
FROM procesion;


-- 39. Mostrar solo la hora (sin minutos ni segundos) del paso 
-- por cada punto del itinerario. ESPECIAL
SELECT
    id_procesion,
    punto,
    EXTRACT(HOUR FROM hora_paso) AS 'Hora del paso'
FROM itinerario;

-- 40. Seleccionar las procesiones que tienen su inicio 
-- en las próximas 24 horas a partir de la fecha y hora actual.
SELECT
    nombre,
    hora_inicio
FROM procesion;