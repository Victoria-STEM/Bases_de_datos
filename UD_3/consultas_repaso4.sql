DROP DATABASE IF EXISTS repaso4;

CREATE DATABASE repaso4;
USE repaso4;

CREATE TABLE patito (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    fecha_nacimiento DATE,
    peso INT CHECK (peso < 50),
    color VARCHAR(50)
);

CREATE TABLE ciudadora (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    turno ENUM('manana', 'tarde', 'noche'),
    anos_experiencia INT,
    especializacion ENUM('alimentacion', 'higiene', 'juegos')
);

CREATE TABLE asignacion (
    ID_cuidadora INT,
    ID_patito INT,
    horario_cuidado TIME,
    area VARCHAR(50),
    actividad_realizada VARCHAR(100)
);

CREATE TABLE reporte (
    ID INT AUTO_INCREMENT PRIMARY KEY,
);


SELECT nombre,color FROM patito where peso > 100;
SELECT nombre,turno FROM cuidadora WHERE anos_experiencia > 2;
SELECT * FROM reporte WHERE fecha_reporte = '2024-12-21';