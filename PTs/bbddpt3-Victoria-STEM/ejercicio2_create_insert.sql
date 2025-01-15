-- Crear la base de datos
DROP DATABASE IF EXISTS gestion_producto_venta;

CREATE DATABASE gestion_producto_venta;
USE gestion_producto_venta;

CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2),
    stock INT
);

CREATE TABLE venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    cantidad INT,
    fecha_venta DATE,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(50) NOT NULL,
    email_cliente VARCHAR(255) UNIQUE
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50)
);

INSERT INTO producto (nombre_producto, precio, stock)
VALUES
('pipas', 10.02, 10),
('chicle', 00.10, 100),
('nubes', 0.15, 150),
('chips', 01.00, 0);

INSERT INTO venta (id_producto, cantidad, fecha_venta)
VALUES
(1, 10, '2024-11-27'),
(2, 2, '2024-11-27'),
(3, 10, '2024-11-27'),
(4, 10, '2024-11-27');

INSERT INTO cliente (nombre_cliente, email_cliente)
VALUES
('nombre1', 'mail1@mail.com'),
('nombre2', 'mail2@mail.com'),
('nombre3', 'mail3@mail.com');

INSERT INTO categoria (nombre_categoria)
VALUES
('categoria1'),
('categoria2'),
('categoria3');