-- CREATE DATABASE EJERCICIO3;
USE EJERCICIO3;

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    fecha_registro DATE 
);

CREATE TABLE Libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    autor VARCHAR(50) NOT NULL,
    editorial VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2),
    stock INT
);

CREATE TABLE Prestamos (
    id_prestamos INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_libro INT,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    FOREIGN KEY (id_libro) REFERENCES Libros (id_libro),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios (id_usuario)
);

CREATE TABLE Categorias_Libros (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50),
    descripcion VARCHAR(100)
);

CREATE TABLE Categorias_Prestamos (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    id_prestamo INT,
    FOREIGN KEY (id_prestamo) REFERENCES Prestamos (id_prestamo)
);