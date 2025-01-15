-- Crear la base de datos
DROP DATABASE IF EXISTS PracticaSelect;

CREATE DATABASE PracticaSelect;
USE PracticaSelect;

-- Crear tabla de productos
CREATE TABLE Productos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Categoria VARCHAR(50),
    Precio DECIMAL(10, 2),
    Stock INT
);

-- Crear tabla de clientes
CREATE TABLE Clientes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Ciudad VARCHAR(50),
    Edad INT
);

-- Crear tabla de pedidos
CREATE TABLE Pedidos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    ProductoID INT,
    Cantidad INT,
    Fecha DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ID)
);

-- Insertar datos en Productos
INSERT INTO Productos (Nombre, Categoria, Precio, Stock)
VALUES 
('Portátil', 'Electrónica', 800.00, 10),
('Ratón', 'Electrónica', 25.00, 50),
('Teclado', 'Electrónica', 50.00, 30),
('Silla Gaming', 'Muebles', 200.00, 5),
('Escritorio', 'Muebles', 150.00, 7),
('Monitor', 'Electrónica', 300.00, 12),
('Lámpara', 'Decoración', 20.00, 25),
('Cojín', 'Decoración', 15.00, 40),
('Estantería', 'Muebles', 120.00, 8),
('Auriculares', 'Electrónica', 100.00, 20),
('Cámara', 'Fotografía', 500.00, 10),
('Trípode', 'Fotografía', 80.00, 15),
('Impresora', 'Electrónica', 150.00, 10),
('Cargador', 'Electrónica', 30.00, 35),
('Teléfono', 'Electrónica', 700.00, 5);

-- Insertar datos en Clientes
INSERT INTO Clientes (Nombre, Ciudad, Edad)
VALUES
('Juan Pérez', 'Madrid', 35),
('María López', 'Barcelona', 29),
('Luis González', 'Valencia', 42),
('Ana Martínez', 'Sevilla', 33),
('Carlos García', 'Bilbao', 27),
('Elena Fernández', 'Granada', 31),
('Raúl Sánchez', 'Málaga', 38),
('Marta Díaz', 'Zaragoza', 25),
('José Muñoz', 'Valladolid', 40),
('Laura Gómez', 'Salamanca', 28),
('Pedro Torres', 'Madrid', 45),
('Isabel Ruiz', 'Barcelona', 22),
('David Ramírez', 'Toledo', 36),
('Sara Molina', 'Pamplona', 30),
('Jorge Ortega', 'Santander', 41);

-- Insertar datos en Pedidos
INSERT INTO Pedidos (ClienteID, ProductoID, Cantidad, Fecha)
VALUES
(1, 1, 1, '2024-01-10'),
(2, 2, 2, '2024-01-11'),
(3, 3, 1, '2024-01-12'),
(4, 4, 1, '2024-01-13'),
(5, 5, 2, '2024-01-14'),
(6, 6, 1, '2024-01-15'),
(7, 7, 3, '2024-01-16'),
(8, 8, 2, '2024-01-17'),
(9, 9, 1, '2024-01-18'),
(10, 10, 1, '2024-01-19'),
(11, 11, 1, '2024-01-20'),
(12, 12, 2, '2024-01-21'),
(13, 13, 1, '2024-01-22'),
(14, 14, 1, '2024-01-23'),
(15, 15, 1, '2024-01-24');