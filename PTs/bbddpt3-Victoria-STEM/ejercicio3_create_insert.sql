-- Crear la base de datos
DROP DATABASE IF EXISTS gestion_cliente_pedido;

CREATE DATABASE gestion_cliente_pedido;
USE gestion_cliente_pedido;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(50) NOT NULL,
    correo_cliente VARCHAR(255) UNIQUE
);

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_pedido DATE,
    total_pedido DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE direccion (
    id_direccion INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    direccion VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(50),
    precio_producto DECIMAL(10,2)
);

INSERT INTO cliente (nombre_cliente, correo_cliente)
VALUES
('nombre1', 'correocliente1@mail.com'),
('nombre2', 'correocliente2@mail.com'),
('nombre3', 'correocliente3@mail.com'),
('nombre4', 'correocliente4@mail.com');

INSERT INTO pedido (id_cliente, fecha_pedido, total_pedido)
VALUES 
(1, '2024-11-26', 10.20),
(2, '2024-11-26', 30.20),
(2, '2024-11-26', 20.20),
(3, '2024-11-26', 110.20);

INSERT INTO direccion (id_cliente, direccion)
VALUES
(1, 'Madrid'),
(2, 'Madrid'),
(3, 'Madrid');

INSERT INTO producto (nombre_producto, precio_producto)
VALUES
('nombre producto 1', 10.20),
('nombre producto 2', 130.00),
('nombre producto 3', 20.50);