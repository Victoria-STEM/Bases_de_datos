-- Crear la base de datos
DROP DATABASE IF EXISTS administracion_mysql;
CREATE DATABASE administracion_mysql;
USE administracion_mysql;

-- Crear tabla de usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    rol VARCHAR(50) NOT NULL
);

-- Crear tabla de ventas
CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    producto VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Crear tabla de roles
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL
);

-- Crear tabla de permisos
CREATE TABLE permisos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);

-- Insertar datos en la tabla de usuarios
INSERT INTO usuarios (nombre, email, rol) VALUES
('Admin1', 'admin1@email.com', 'Administrador'),
('User1', 'user1@email.com', 'Vendedor'),
('User2', 'user2@email.com', 'Vendedor');

-- Insertar datos en la tabla de ventas
INSERT INTO ventas (usuario_id, producto, cantidad, precio) VALUES
(2, 'Laptop', 1, 1200.50),
(2, 'Mouse', 2, 25.75),
(3, 'Teclado', 1, 45.99);

-- Insertar datos en la tabla de roles
INSERT INTO roles (nombre) VALUES
('Administrador'),
('Vendedor');

-- Insertar datos en la tabla de permisos
INSERT INTO permisos (descripcion) VALUES
('Gestionar usuarios'),
('Gestionar ventas'),
('Visualizar reportes');

-- Crear índices
CREATE INDEX idx_usuario_email ON usuarios(email);
CREATE INDEX idx_ventas_usuario ON ventas(usuario_id);

-- Creación de un usuario en MySQL
CREATE USER 'gestor'@'localhost' IDENTIFIED BY 'password123';
GRANT ALL PRIVILEGES ON administracion_mysql.* TO 'gestor'@'localhost';
FLUSH PRIVILEGES;