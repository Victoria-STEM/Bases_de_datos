-- Crear la base de datos
DROP DATABASE IF EXISTS Petanca;

CREATE DATABASE Petanca;
USE Petanca;

CREATE TABLE Jugadores (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apodo VARCHAR(50),
    edad INT CHECK (edad >= 18) NOT NULL,
    nivel_experiencia ENUM("principiante", "intermedio", "avanzado") DEFAULT "principiante"
);

CREATE TABLE Partidos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    ubicacion VARCHAR(255),
    resultado VARCHAR(50)
);

CREATE TABLE Participaciones (
    ID_Jugadores INT,
    ID_Partidos INT,
    rol ENUM("titular", "suplente"),
    puntos_obtenidos INT CHECK (puntos_obtenidos >= 0),
    PRIMARY KEY (ID_Jugadores, ID_Partidos),
    FOREIGN KEY (ID_Jugadores) REFERENCES Jugadores(ID),
    FOREIGN KEY (ID_Partidos) REFERENCES Partidos(ID)
);

INSERT INTO Jugadores (nombre, edad)
VALUES 
("Jugador1", 19),
("Jugador2", 20),
("Jugador3", 19),
("Jugador4", 19),
("Jugador5", 19),
("Jugador6", 19),
("Jugador7", 19),
("Jugador8", 19),
("Jugador9", 19),
("Jugador10", 40);

INSERT INTO Partidos (fecha, ubicacion)
VALUES 
("2024-11-20", "Madrid"),
("2024-11-20", "Madrid"),
("2024-11-20", "Madrid"),
("2024-11-20", "Madrid"),
("2024-11-20", "Madrid"),
("2024-11-20", "Madrid"),
("2024-11-20", "Madrid"),
("2024-11-20", "Madrid"),
("2024-11-20", "Madrid"),
("2024-11-20", "Madrid");

INSERT INTO Participaciones (ID_Jugadores, ID_Partidos, rol, puntos_obtenidos)
VALUES 
(1, 1, "titular", 10),
(2, 2, "titular", 10),
(3, 3, "titular", 10),
(4, 4, "titular", 10),
(5, 5, "titular", 10),
(6, 6, "titular", 10),
(7, 7, "titular", 20),
(8, 8, "titular", 10),
(9, 9, "suplente", 2),
(10, 10, "suplente", 2);

SELECT ID_Jugadores FROM Participaciones WHERE puntos_obtenidos > 10;
SELECT * FROM Partidos WHERE Ubicacion = "Madrid";
SELECT * FROM Participaciones WHERE rol = "titular";