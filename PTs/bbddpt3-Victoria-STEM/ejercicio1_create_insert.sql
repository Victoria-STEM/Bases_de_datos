-- Crear la base de datos
DROP DATABASE IF EXISTS gestion_empleado_departamento;

CREATE DATABASE gestion_empleado_departamento;
USE gestion_empleado_departamento;

CREATE TABLE  departamento (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_departamento VARCHAR(50) NOT NULL
);

CREATE TABLE empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

CREATE TABLE proyecto (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(50) NOT NULL,
    fecha_inicio DATE
);

CREATE TABLE empleado_proyecto (
    id_empleado INT,
    id_proyecto INT,
    PRIMARY KEY (id_empleado, id_proyecto),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto)
);

INSERT INTO departamento (nombre_departamento)
VALUES
('departamento1'),
('departamento2'),
('departamento3'),
('departamento4');

INSERT INTO empleado (nombre, apellido, id_departamento)
VALUES
('nombre1', 'García', 1),
('nombre2', 'García', 2),
('nombre3', 'apellido3', 3),
('nombre4', 'apellido4', 4);

INSERT INTO proyecto (nombre_proyecto, fecha_inicio)
VALUES
('Nombre Proyecto 1', '2024-12-24'),
('Nombre Proyecto 2', '2024-12-25'),
('Nombre Proyecto 3', '2024-12-26');

INSERT INTO empleado_proyecto (id_empleado, id_proyecto)
VALUES
(1, 1),
(2, 2),
(3, 3);