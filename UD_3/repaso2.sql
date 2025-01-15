DROP DATABASE IF EXISTS repaso2;

CREATE DATABASE repaso2;
USE repaso2;

CREATE TABLE candidato (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    partido_politico VARCHAR(100),
    cargo VARCHAR(100)
);

CREATE TABLE votante (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    edad INT,
    votado BOOLEAN
);

CREATE TABLE voto (
    ID_candidato INT,
    ID_votante INT,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ID_candidato, ID_votante),
    FOREIGN KEY (ID_candidato) REFERENCES candidato(ID),
    FOREIGN KEY (ID_votante) REFERENCES votante(ID)
);

INSERT INTO candidato (nombre, partido_politico, cargo)
VALUES
('nombre1', 'PSOE', 'asistente'),
('nombre2', 'PSOE', 'asistente'),
('nombre3', 'PSOE', 'asistente'),
('nombre4', 'PSOE', 'asistente'),
('nombre5', 'PSOE', 'asistente'),
('nombre6', 'PSOE', 'asistente');

INSERT INTO votante (nombre, edad, votado)
VALUES
('nombre1', 20, true),
('nombre2', 20, true),
('nombre3', 20, true),
('nombre4', 20, true),
('nombre5', 20, true),
('nombre6', 20, true);

INSERT INTO voto (ID_candidato, ID_votante)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(1, 6);

SELECT nombre FROM votante WHERE edad >= 18;