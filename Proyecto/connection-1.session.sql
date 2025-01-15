-- Crear la base de datos
DROP DATABASE IF EXISTS Land_Of_Valor;

CREATE DATABASE Land_Of_Valor;
USE Land_Of_Valor;

-- Crear tabla de objetos
CREATE TABLE Objeto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(50),
    rareza VARCHAR(50),
    precio INT NOT NULL,
    descripcion TEXT,
    imagen VARCHAR(255)
);

-- Crear tabla de misiones
CREATE TABLE Mision ( 
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    recompensa INT NOT NULL,
    requisito_nivel VARCHAR(50)
);

-- Crear tabla de regiones
CREATE TABLE Region (
    nombre INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT,
    nivel_recomendado VARCHAR(50),
    estado 
);


