-- Creación de la tabla equipos
CREATE TABLE equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(50) NOT NULL,
    estadio VARCHAR(50),
    ciudad VARCHAR(50),
    fundado INT,
    entrenador VARCHAR(50)
);

-- Insertar 20 registros en equipos
INSERT INTO equipos (nombre_equipo, estadio, ciudad, fundado, entrenador)
VALUES
('Real Madrid', 'Santiago Bernabéu', 'Madrid', 1902, 'Carlo Ancelotti'),
('Barcelona', 'Camp Nou', 'Barcelona', 1899, 'Xavi Hernández'),
('Atlético Madrid', 'Wanda Metropolitano', 'Madrid', 1903, 'Diego Simeone'),
('Sevilla', 'Ramón Sánchez-Pizjuán', 'Sevilla', 1890, 'José Luis Mendilibar'),
('Valencia', 'Mestalla', 'Valencia', 1919, 'Rubén Baraja'),
('Villarreal', 'La Cerámica', 'Villarreal', 1923, 'Quique Setién'),
('Real Sociedad', 'Reale Arena', 'San Sebastián', 1909, 'Imanol Alguacil'),
('Athletic Club', 'San Mamés', 'Bilbao', 1898, 'Ernesto Valverde'),
('Betis', 'Benito Villamarín', 'Sevilla', 1907, 'Manuel Pellegrini'),
('Celta de Vigo', 'Abanca-Balaídos', 'Vigo', 1923, 'Rafa Benítez'),
('Granada', 'Nuevo Los Cármenes', 'Granada', 1931, 'Paco López'),
('Mallorca', 'Visit Mallorca Estadi', 'Palma', 1916, 'Javier Aguirre'),
('Osasuna', 'El Sadar', 'Pamplona', 1920, 'Jagoba Arrasate'),
('Espanyol', 'RCDE Stadium', 'Barcelona', 1900, 'Luis García'),
('Alavés', 'Mendizorroza', 'Vitoria', 1921, 'Luis García Plaza'),
('Elche', 'Martínez Valero', 'Elche', 1923, 'Sebastián Beccacece'),
('Getafe', 'Coliseum Alfonso Pérez', 'Getafe', 1983, 'José Bordalás'),
('Cádiz', 'Nuevo Mirandilla', 'Cádiz', 1910, 'Sergio González'),
('Levante', 'Ciutat de València', 'Valencia', 1909, 'Javi Calleja'),
('Rayo Vallecano', 'Estadio de Vallecas', 'Madrid', 1924, 'Francisco Rodríguez');

-- Creación de la tabla jugadores
CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(50) NOT NULL,
    posicion VARCHAR(20),
    id_equipo INT,
    edad INT,
    goles INT,
    asistencias INT,
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo)
);

-- Insertar 20 registros en jugadores
INSERT INTO jugadores (nombre_jugador, posicion, id_equipo, edad, goles, asistencias)
VALUES
('Karim Benzema', 'Delantero', 1, 35, 25, 10),
('Lionel Messi', 'Delantero', 2, 36, 20, 15),
('Antoine Griezmann', 'Delantero', 3, 32, 18, 12),
('Youssef En-Nesyri', 'Delantero', 4, 27, 15, 8),
('Edinson Cavani', 'Delantero', 5, 37, 12, 5),
('Gerard Moreno', 'Delantero', 6, 31, 17, 9),
('Alexander Isak', 'Delantero', 7, 24, 16, 7),
('Iñaki Williams', 'Delantero', 8, 29, 13, 6),
('Borja Iglesias', 'Delantero', 9, 30, 19, 10),
('Iago Aspas', 'Delantero', 10, 36, 22, 12),
('Luis Suárez', 'Delantero', 11, 34, 14, 8),
('Takefusa Kubo', 'Centrocampista', 12, 22, 5, 10),
('Sergio Busquets', 'Centrocampista', 2, 35, 3, 8),
('Luka Modric', 'Centrocampista', 1, 38, 6, 10),
('Marcos Llorente', 'Centrocampista', 3, 28, 4, 9),
('Joan Jordán', 'Centrocampista', 4, 29, 2, 7),
('Carlos Soler', 'Centrocampista', 5, 26, 7, 10),
('Parejo', 'Centrocampista', 6, 34, 5, 12),
('Oyarzabal', 'Centrocampista', 7, 25, 9, 8),
('Nico Williams', 'Centrocampista', 8, 21, 8, 11);

-- Creación de la tabla partidos
CREATE TABLE partidos (
    id_partido INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo_local INT,
    id_equipo_visitante INT,
    fecha DATE,
    goles_local INT,
    goles_visitante INT,
    FOREIGN KEY (id_equipo_local) REFERENCES equipos(id_equipo),
    FOREIGN KEY (id_equipo_visitante) REFERENCES equipos(id_equipo)
);

-- Insertar 20 registros en partidos
INSERT INTO partidos (id_equipo_local, id_equipo_visitante, fecha, goles_local, goles_visitante)
VALUES
(1, 2, '2023-01-15', 2, 3),
(3, 4, '2023-01-16', 1, 1),
(5, 6, '2023-01-17', 0, 2),
(7, 8, '2023-01-18', 3, 0),
(9, 10, '2023-01-19', 1, 2),
(11, 12, '2023-01-20', 2, 2),
(13, 14, '2023-01-21', 0, 1),
(15, 16, '2023-01-22', 3, 3),
(17, 18, '2023-01-23', 4, 1),
(19, 20, '2023-01-24', 0, 0),
(2, 3, '2023-01-25', 2, 2),
(4, 5, '2023-01-26', 3, 1),
(6, 7, '2023-01-27', 1, 1),
(8, 9, '2023-01-28', 2, 3),
(10, 11, '2023-01-29', 3, 2),
(12, 13, '2023-01-30', 0, 0),
(14, 15, '2023-01-31', 4, 2),
(16, 17, '2023-02-01', 1, 3),
(18, 19, '2023-02-02', 2, 1),
(20, 1, '2023-02-03', 1, 4);



-- 3. Obtener los partidos con más de 4 goles en total.
SELECT id_partido FROM partidos WHERE goles_local + goles_visitante > 4;
-- 4. Mostrar jugadores de un equipo con ID conocido (por ejemplo, equipos de Madrid).
SELECT nombre_jugador FROM jugadores WHERE id_equipo IS NOT NULL;
-- 5. Listar partidos donde el equipo local marcó más goles que el visitante.
SELECT id_partido FROM partidos WHERE goles_local > goles_visitante; 
-- 6. Ordenar equipos por ciudad alfabéticamente.
SELECT nombre_equipo, ciudad FROM equipos ORDER BY ciudad ASC;
-- 7. Filtrar jugadores que juegan como "Delantero" y tienen más de 20 goles.
SELECT nombre_jugador FROM jugadores WHERE posicion = 'Delantero' && goles > 20;
-- 8. Obtener el promedio de goles por partido para un equipo con un ID específico.
SELECT AVG(goles_local + goles_visitante) AS goles_promedio 
FROM partidos
WHERE id_equipo_local = '5' OR id_equipo_visitante = '5';
-- 9. Mostrar partidos jugados en enero de 2023.
SELECT id_partido FROM partidos WHERE fecha BETWEEN '2023-01-01' AND '2023-01-31';
-- 10. Contar jugadores de un equipo con ID específico.
SELECT id_equipo, COUNT(*) AS cantidad_jugadores
FROM jugadores 
GROUP BY id_equipo;

SELECT nombre_equipo, fundado FROM equipos ORDER BY ciudad ASC, fundado DESC;

-- 11. Ordenar equipos por ciudad alfabéticamente y despues por año de fundacion descendente.
SELECT * 
FROM equipos
ORDER BY ciudad ASC, fundado DESC;

-- 12. Calcular la edad promedio de los jugadores y asignarle un alias, ordenado por ID de equipo y edad promedio de forma descendente.
SELECT 
    AVG(edad) AS edad_promedio 
FROM jugadores 
ORDER BY id_equipo DESC, edad_promedio DESC;

-- 13. Listar los nombres de los equipos y la cantidad de jugadores que tienen, con alias "total_jugadores", ordenados por ciudad y total de jugadores descendente.
SELECT 
    COUNT(*) AS total_jugadores 
FROM equipos 
ORDER BY ciudad DESC, total_jugadores DESC;

-- 14. Mostrar el promedio de goles y asistencias de cada equipo, con alias "promedio_goles" y "promedio_asistencias", ordenados por promedio de goles descendente y promedio de asistencias ascendente.
SELECT 
    AVG(goles) AS promedio_goles,
    AVG(asistencias) AS promedio_asistencias
FROM jugadores
GROUP BY id_equipo
ORDER BY promedio_goles DESC, promedio_asistencias ASC;

-- 15. Obtener los equipos con el total de goles anotados en sus partidos, usando alias "total_goles", ordenados por nombre del equipo ascendente y total de goles descendente.
SELECT 
    id_equipo,
    COUNT(goles) AS total_goles
FROM jugadores
GROUP BY id_equipo
ORDER BY id_equipo ASC, total_goles DESC;

-- 16. Contar la cantidad de partidos jugados por cada equipo local, 
-- con alias "partidos_local", 
-- ordenados por estadio y cantidad de partidos descendente.
SELECT
    COUNT(id_equipo_local) AS partidos_local
FROM partidos
ORDER BY partidos_local DESC;

-- 17. Calcular la cantidad de partidos en los que el equipo local ganó, 
-- usando alias "victorias_local", ordenados por cantidad de victorias 
-- y goles locales promedio en orden descendente.
SELECT
    COUNT(CASE WHEN goles_local > goles_visitante THEN 1 END) AS victorias_local,
    AVG(goles_local) AS goles_locales
FROM partidos
GROUP BY id_equipo_local
ORDER BY victorias_local ASC, goles_locales DESC;
