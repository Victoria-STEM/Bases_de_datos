-- Crear base de datos si no existe
DROP DATABASE IF EXISTS billar;
CREATE DATABASE billar;
USE billar;

-- Crear tabla de jugadores
CREATE TABLE jugador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- Crear tabla de mesas de billar
CREATE TABLE mesa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero INT,
    tipo VARCHAR(20) -- Ej: "Pool", "Snooker", "Carambola"
);

-- Crear tabla de torneos
CREATE TABLE torneo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    fecha DATE
);

-- Crear tabla de tacos de billar
CREATE TABLE taco (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50),
    material VARCHAR(30) -- Ej: "Madera", "Fibra de carbono"
);

-- Insertar datos en la tabla jugador
INSERT INTO jugador (nombre) VALUES
('Carlos'),
('Andrea'),
('Miguel'),
('Lucía'),
('Fernando');

-- Insertar datos en la tabla mesa
INSERT INTO mesa (numero, tipo) VALUES
(1, 'Pool'),
(2, 'Snooker'),
(3, 'Carambola'),
(4, 'Pool');

-- Insertar datos en la tabla torneo
INSERT INTO torneo (nombre, fecha) VALUES
('Torneo de Verano', '2025-06-15'),
('Copa Nacional', '2025-09-20'),
('Desafío Internacional', '2025-12-05');

-- Insertar datos en la tabla taco
INSERT INTO taco (marca, material) VALUES
('Predator', 'Madera'),
('Cuetec', 'Fibra de carbono'),
('McDermott', 'Madera'),
('Lucasi', 'Fibra de carbono');

-- CROSS JOIN: Combinaciones de Jugadores y Mesas
SELECT jugador.nombre AS jugador, mesa.numero AS mesa, mesa.tipo
FROM jugador
CROSS JOIN mesa;

-- CROSS JOIN: Jugadores y Torneos (ver en qué torneos podría participar cada jugador)
SELECT jugador.nombre AS jugador, torneo.nombre AS torneo, torneo.fecha
FROM jugador
CROSS JOIN torneo;

-- CROSS JOIN: Jugadores y Tacos (asociación de cada jugador con cada taco disponible)
SELECT jugador.nombre AS jugador, taco.marca AS taco, taco.material
FROM jugador
CROSS JOIN taco;

-- CROSS JOIN: Mesas y Torneos (ver qué mesas podrían usarse en cada torneo)
SELECT torneo.nombre AS torneo, mesa.numero AS mesa, mesa.tipo
FROM torneo
CROSS JOIN mesa;

-- CROSS JOIN: Jugadores, Mesas y Tacos (todas las combinaciones posibles)
SELECT jugador.nombre AS jugador, mesa.numero AS mesa, mesa.tipo, taco.marca AS taco
FROM jugador
CROSS JOIN mesa
CROSS JOIN taco;