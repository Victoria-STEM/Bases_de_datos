DROP DATABASE IF EXISTS EmpresaLogistica;
CREATE DATABASE EmpresaLogistica;
USE EmpresaLogistica;


CREATE TABLE Departamento (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_departamento VARCHAR(100) UNIQUE
);

CREATE TABLE Empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    salario DECIMAL(10,2),
    fecha_contratacion DATE,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamento (id_departamento)
);

CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio DECIMAL(10,2),
    stock INT DEFAULT 0,
    fecha_adicion DATETIME 
);

CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    correo VARCHAR(100) UNIQUE,
    telefono CHAR
);

CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    cantidad INT CHECK (cantidad > 0),
    fecha_pedido TIMESTAMP,
    id_cliente INT,
    id_producto INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente),
    FOREIGN KEY (id_producto) REFERENCES Producto (id_producto)
);

INSERT INTO Empleado (nombre, apellido, salario, fecha_contratacion)
VALUES ('Paco', 'Mendoza', 3500.00, '2000-12-01');

INSERT INTO Empleado (nombre, apellido, salario, fecha_contratacion)
VALUES ('Marta', 'Garcia', 3500.00, '2010-11-01');

INSERT INTO Empleado (nombre, apellido, salario, fecha_contratacion)
VALUES ('Alba', 'Fernandez', 3500.00, '2005-05-01');

INSERT INTO Empleado (nombre, apellido, salario, fecha_contratacion)
VALUES ('Juan', 'deCastro', 3500.00, '2002-02-01');

INSERT INTO Empleado (nombre, apellido, salario, fecha_contratacion)
VALUES ('Marina', 'Arce', 3500.00, '2011-10-01');

INSERT INTO Producto (nombre_producto, precio, stock, fecha_adicion)
VALUES  ('Pipas', 100.00, 10, '2010-10-10'),
        ('Chicles', 2.00, 10, '2010-10-10'),
        ('Coca-cola', 1.00, 10, '2010-10-10'),
        ('Manzanas', 1.00, 10, '2010-10-10'),
        ('Peras', 3.00, 10, '2010-10-10'),
        ('Bananas', 2.00, 10, '2010-10-10'),
        ('Lapices', 1.00, 10, '2010-10-10'),
        ('Agua', 1.00, 10, '2010-10-10'),
        ('Vasos', 2.00, 10, '2010-10-10'),
        ('Mobiles', 1000.00, 10, '2010-10-10');
