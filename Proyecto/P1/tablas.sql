-- Crear tabla de jugador
CREATE TABLE Jugador (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(100) NOT NULL,
    fecha_usuario DATE,
    contrasena VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    fecha_hora_ultimoAcceso DATETIME NOT NULL,
    fecha_hora_registro DATETIME NOT NULL,
    nombre_clan INT,
    FOREIGN KEY (nombre_clan) REFERENCES Clan(nombre)
);