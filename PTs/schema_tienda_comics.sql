
DROP DATABASE IF EXISTS tienda_comics;
CREATE DATABASE tienda_comics;
USE tienda_comics;

CREATE TABLE comic (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    fecha_publicacion DATE,
    genero VARCHAR(50),
    numero_paginas INT,
    precio DECIMAL(5,2),
    stock INT
);

CREATE TABLE autor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    pais_origen VARCHAR(50),
    fecha_nacimiento DATE
);

CREATE TABLE editorial (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    sede VARCHAR(50),
    fecha_fundacion DATE
);

CREATE TABLE personaje (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    poder_principal VARCHAR(100),
    universo VARCHAR(50),
    descripcion TEXT
);

CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(100),
    telefono VARCHAR(20),
    direccion VARCHAR(150)
);

CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_pedido DATE,
    total DECIMAL(8,2),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE detalle_pedido (
    id_pedido INT,
    id_comic INT,
    cantidad INT,
    precio_unitario DECIMAL(5,2),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id),
    FOREIGN KEY (id_comic) REFERENCES comic(id),
    PRIMARY KEY (id_pedido, id_comic)
);

CREATE TABLE proveedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    contacto VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE inventario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_comic INT,
    id_proveedor INT,
    cantidad INT,
    fecha_reposicion DATE,
    FOREIGN KEY (id_comic) REFERENCES comic(id),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id)
);

CREATE TABLE comic_autor (
    id_comic INT,
    id_autor INT,
    FOREIGN KEY (id_comic) REFERENCES comic(id),
    FOREIGN KEY (id_autor) REFERENCES autor(id),
    PRIMARY KEY (id_comic, id_autor)
);

CREATE TABLE comic_editorial (
    id_comic INT,
    id_editorial INT,
    FOREIGN KEY (id_comic) REFERENCES comic(id),
    FOREIGN KEY (id_editorial) REFERENCES editorial(id),
    PRIMARY KEY (id_comic, id_editorial)
);

CREATE TABLE comic_personaje (
    id_comic INT,
    id_personaje INT,
    FOREIGN KEY (id_comic) REFERENCES comic(id),
    FOREIGN KEY (id_personaje) REFERENCES personaje(id),
    PRIMARY KEY (id_comic, id_personaje)
);
