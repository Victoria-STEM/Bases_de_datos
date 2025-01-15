DROP DATABASE IF EXISTS repaso3;

CREATE DATABASE repaso3;
USE repaso3;

CREATE TABLE miembro (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    edad INT,
    genero VARCHAR(50),
    estado ENUM('activo', 'inactivo') 
);

CREATE TABLE evento (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    tematica VARCHAR(50),
    limite_participantes INT
);

CREATE TABLE asistencia (
    ID_miembro INT,
    ID_evento INT,
    en_pareja BOOLEAN,
    costo INT,
    PRIMARY KEY (ID_miembro, ID_evento),
    FOREIGN KEY (ID_miembro) REFERENCES miembro(ID),
    FOREIGN KEY (ID_evento) REFERENCES evento(ID)
);

CREATE TABLE pago (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_miembro INT,
    fecha_pago DATE,
    monto INT,
    metodo_pago ENUM('efectivo', 'tarjeta', 'transferencia'),
    FOREIGN KEY (ID_miembro) REFERENCES miembro(ID)
);

CREATE TABLE membresia (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_miembro INT,
    tipo_membresia ENUM('mensual', 'anual'),
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (ID_miembro) REFERENCES miembro(ID)
);

INSERT INTO miembro (nombre, edad, genero, estado)
VALUES
('nombre1', 20, 'hombre', 'activo'),
('nombre2', 20, 'hombre', 'activo'),
('nombre3', 20, 'hombre', 'activo'),
('nombre4', 20, 'hombre', 'activo'),
('nombre5', 20, 'hombre', 'activo');

INSERT INTO evento (fecha, tematica, limite_participantes)
VALUES
('2024-12-26', 'yoquese', 20),
('2024-12-26', 'yoquese', 20),
('2024-12-26', 'yoquese', 20),
('2024-12-26', 'yoquese', 20),
('2024-12-26', 'yoquese', 20);

INSERT INTO asistencia (ID_miembro, ID_evento, en_pareja, costo)
VALUES
(1, 2, true, 20),
(2, 2, true, 20),
(3, 2, true, 20),
(4, 2, true, 20),
(5, 2, true, 20);

INSERT INTO pago (ID_miembro, fecha_pago, monto, metodo_pago)
VALUES
(1, '2024-12-23', 20, 'efectivo'),
(2, '2024-12-23', 20, 'efectivo'),
(3, '2024-12-23', 20, 'efectivo'),
(4, '2024-12-23', 20, 'efectivo'),
(5, '2024-12-23', 20, 'efectivo');

INSERT INTO membresia (ID_miembro, tipo_membresia, fecha_inicio, fecha_fin)
VALUES
(1, 'mensual', '2024-11-26', '2024-12-26'),
(2, 'mensual', '2024-11-26', '2024-12-26'),
(3, 'mensual', '2024-11-26', '2024-12-26'),
(4, 'mensual', '2024-11-26', '2024-12-26'),
(5, 'mensual', '2024-11-26', '2024-12-26');
