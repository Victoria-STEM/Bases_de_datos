CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    email VARCHAR(100) UNIQUE,
    telefono CHAR(10), 
    direccion TEXT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion MEDIUMTEXT,
    precio INT,
    stock DECIMAL DEFAULT 0
    categoria_id INT,
    FOREIGN KEY(categoria_id) REFERENCES (id_categoria)
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    fecha_pedido DATETIME,
    total DECIMAN(7,2),
    FOREIGN KEY(id_cliente) REFERENCES(id_cliente)
);

CREATE TABLE Detalles_Pedidos (
    id_detalle PRIMARY KEY AUTO_INCREMENT INT,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT DEFAULT 1,
    precio_unitario DECIMAL(7,2),
    FOREIGN KEY (id_pedido) REFERENCES (id_producto),
    FOREIGN KEY (id_producto) REFERENCES (id_producto)
);