INSERT INTO comic (titulo, fecha_publicacion, genero, numero_paginas, precio, stock) VALUES
('El Regreso del Caballero Oscuro', '1986-02-01', 'Superhéroes', 200, 19.99, 50),
('La Broma Asesina', '1988-03-29', 'Superhéroes', 64, 14.99, 30),
('Watchmen', '1986-09-01', 'Distopía', 416, 29.99, 40),
('Maus', '1991-11-19', 'Histórico', 296, 24.99, 20),
('V de Vendetta', '1988-10-01', 'Distopía', 296, 22.99, 35),
('Sandman: Preludios y Nocturnos', '1989-01-01', 'Fantasía Oscura', 240, 25.99, 15),
('Saga', '2012-03-14', 'Ciencia Ficción', 160, 16.99, 45),
('Locke & Key', '2008-02-20', 'Terror', 320, 27.99, 10),
('Invincible', '2003-01-01', 'Superhéroes', 144, 18.99, 25),
('The Walking Dead', '2003-10-01', 'Terror', 193, 20.99, 50),
('Spider-Man: Blue', '2002-07-10', 'Superhéroes', 144, 17.99, 35),
('Civil War', '2006-05-03', 'Superhéroes', 208, 21.99, 40),
('Batman: Año Uno', '1987-02-01', 'Superhéroes', 96, 15.99, 60),
('Kingdom Come', '1996-05-01', 'Superhéroes', 230, 26.99, 20),
('Black Hole', '1995-06-01', 'Terror', 368, 28.99, 10),
('Hellboy: Seed of Destruction', '1994-03-01', 'Terror', 128, 16.99, 25),
('Y: El Último Hombre', '2002-09-01', 'Ciencia Ficción', 256, 23.99, 30),
('Fábulas', '2002-07-10', 'Fantasía', 200, 19.99, 20),
('100 Balas', '1999-08-04', 'Noir', 192, 22.99, 15),
('Preacher', '1995-04-01', 'Fantasía Oscura', 352, 30.99, 10);

INSERT INTO autor (nombre, apellido, pais_origen, fecha_nacimiento) VALUES
('Frank', 'Miller', 'Estados Unidos', '1957-01-27'),
('Alan', 'Moore', 'Reino Unido', '1953-11-18'),
('Art', 'Spiegelman', 'Estados Unidos', '1948-02-15'),
('Neil', 'Gaiman', 'Reino Unido', '1960-11-10'),
('Brian', 'K. Vaughan', 'Estados Unidos', '1976-07-17'),
('Robert', 'Kirkman', 'Estados Unidos', '1978-11-30'),
('Jeph', 'Loeb', 'Estados Unidos', '1958-01-29'),
('Mark', 'Millar', 'Escocia', '1969-12-24'),
('Frank', 'Quitely', 'Escocia', '1968-01-01'),
('Charles', 'Burns', 'Estados Unidos', '1955-09-27'),
('Mike', 'Mignola', 'Estados Unidos', '1960-09-16'),
('Brian', 'Azzarello', 'Estados Unidos', '1962-08-11'),
('Garth', 'Ennis', 'Irlanda del Norte', '1970-01-16');


INSERT INTO editorial (nombre, sede, fecha_fundacion) VALUES
('DC Comics', 'Estados Unidos', '1934-06-01'),
('Marvel Comics', 'Estados Unidos', '1939-10-01'),
('Vertigo', 'Estados Unidos', '1993-01-01'),
('Image Comics', 'Estados Unidos', '1992-02-01'),
('Dark Horse Comics', 'Estados Unidos', '1986-01-01'),
('Pantheon Books', 'Estados Unidos', '1942-01-01'),
('IDW Publishing', 'Estados Unidos', '1999-01-01'),
('BOOM! Studios', 'Estados Unidos', '2005-06-01'),
('Dynamite Entertainment', 'Estados Unidos', '2005-01-01'),
('Fantagraphics Books', 'Estados Unidos', '1976-01-01');


INSERT INTO personaje (nombre, poder_principal, universo, descripcion) VALUES
('Batman', 'Inteligencia estratégica', 'DC', 'El Caballero Oscuro de Gotham, maestro detective y experto en artes marciales.'),
('Joker', 'Ingenio criminal', 'DC', 'El archienemigo de Batman, conocido por su locura y habilidades de manipulación.'),
('Rorschach', 'Investigación y deducción', 'DC', 'Vigilante implacable conocido por su máscara cambiante y moral rígida.'),
('Art Spiegelman', 'Narración gráfica', 'Histórico', 'Personaje autobiográfico en el cómic Maus.'),
('V', 'Rebeldía', 'DC', 'Anarquista enmascarado que lucha contra un régimen totalitario.'),
('Sueño', 'Control de sueños', 'DC', 'Uno de los Eternos, protagonista de la saga Sandman.'),
('Alana', 'Combate cuerpo a cuerpo', 'Image', 'Protagonista de Saga, luchadora valiente y madre.'),
('Mark Grayson', 'Superfuerza y vuelo', 'Image', 'Hijo de Omni-Man que se convierte en el superhéroe Invincible.'),
('Rick Grimes', 'Liderazgo y estrategia', 'Image', 'Protagonista de The Walking Dead, ex oficial de policía.'),
('Spider-Man', 'Agilidad y telarañas', 'Marvel', 'Superhéroe adolescente que equilibra la vida de estudiante y héroe.'),
('Iron Man', 'Tecnología avanzada', 'Marvel', 'Millonario filántropo que combate el crimen con una armadura de alta tecnología.'),
('Capitán América', 'Fuerza sobrehumana', 'Marvel', 'Súper soldado y líder natural de los Vengadores.'),
('Hellboy', 'Fuerza sobrenatural', 'Dark Horse', 'Investigador paranormal con orígenes demoníacos.'),
('Yorick Brown', 'Último hombre vivo', 'DC', 'Protagonista de Y: El Último Hombre, el único hombre superviviente tras una plaga.'),
('Bigby Wolf', 'Transformación en lobo', 'DC', 'Detective feroz en la serie Fábulas.'),
('Agent Graves', 'Manipulación y venganza', 'DC', 'Misterioso personaje que entrega maletines con 100 balas.'),
('Jesse Custer', 'Palabra de Dios', 'DC', 'Predicador con el poder de obligar a otros a obedecer sus órdenes.'),
('Sue Storm', 'Invisibilidad y campos de fuerza', 'Marvel', 'Miembro de los Cuatro Fantásticos.'),
('Deadpool', 'Regeneración', 'Marvel', 'Antihéroe con sentido del humor negro y habilidades regenerativas.'),
('Thanos', 'Superfuerza y manipulación cósmica', 'Marvel', 'Villano obsesionado con el equilibrio del universo.');

INSERT INTO cliente (nombre, apellido, email, telefono, direccion) VALUES
('Carlos', 'Gómez', 'carlos.gomez@example.com', '600123456', 'Calle Mayor 45, Madrid'),
('Laura', 'Martínez', 'laura.martinez@example.com', '600654321', 'Avenida del Prado 12, Barcelona'),
('Miguel', 'Sánchez', 'miguel.sanchez@example.com', '600789012', 'Calle del Sol 34, Valencia'),
('Sofía', 'Ruiz', 'sofia.ruiz@example.com', '600345678', 'Calle Luna 78, Sevilla'),
('Javier', 'Fernández', 'javier.fernandez@example.com', '600901234', 'Calle Estrella 56, Bilbao'),
('Lucía', 'Morales', 'lucia.morales@example.com', '600112233', 'Avenida Libertad 23, Zaragoza'),
('David', 'Ortega', 'david.ortega@example.com', '600445566', 'Calle Real 89, Málaga'),
('Paula', 'Jiménez', 'paula.jimenez@example.com', '600778899', 'Calle Jardín 67, Murcia'),
('Alejandro', 'Navarro', 'alejandro.navarro@example.com', '600334455', 'Avenida Central 90, Valladolid'),
('Elena', 'Castro', 'elena.castro@example.com', '600556677', 'Calle del Río 12, Granada');

INSERT INTO pedido (id_cliente, fecha_pedido, total) VALUES
(1, '2024-01-15', 59.97),
(1, '2024-02-10', 39.98),
(2, '2024-01-20', 89.95),
(3, '2024-01-25', 24.99),
(3, '2024-02-14', 49.98),
(4, '2024-02-01', 74.97),
(5, '2024-01-30', 29.99),
(6, '2024-02-05', 44.98),
(6, '2024-02-15', 69.97),
(7, '2024-02-20', 99.95),
(8, '2024-02-10', 19.99),
(9, '2024-02-12', 54.97),
(10, '2024-01-18', 39.98),
(10, '2024-02-25', 89.95),
(2, '2024-02-28', 59.97);

INSERT INTO detalle_pedido (id_pedido, id_comic, cantidad, precio_unitario) VALUES
(1, 1, 1, 19.99),
(1, 2, 1, 14.99),
(1, 3, 1, 24.99),
(2, 4, 2, 19.99),
(3, 5, 1, 29.99),
(3, 6, 2, 29.98),
(4, 7, 1, 24.99),
(5, 8, 1, 24.99),
(5, 9, 1, 24.99),
(6, 10, 3, 24.99),
(7, 11, 1, 29.99),
(8, 12, 2, 22.49),
(9, 13, 1, 19.99),
(9, 14, 2, 24.99),
(10, 15, 1, 33.32),
(10, 16, 1, 33.33),
(10, 17, 1, 33.30),
(11, 18, 1, 19.99),
(12, 19, 1, 18.32),
(12, 20, 2, 18.32),
(13, 1, 1, 19.99),
(13, 5, 1, 19.99),
(14, 2, 2, 19.99),
(14, 3, 1, 29.99),
(15, 4, 1, 19.99),
(15, 6, 1, 19.99),
(15, 7, 1, 19.99);

INSERT INTO proveedor (nombre, contacto, telefono) VALUES
('Distribuidora Global Comics', 'Andrés López', '910123456'),
('Editorial Panamericana', 'María Rodríguez', '912345678'),
('ComicWorld Supplies', 'Carlos Fernández', '913456789'),
('SuperHéroes Unlimited', 'Lucía Martínez', '914567890'),
('Dark Tales Distribution', 'Javier Gómez', '915678901'),
('Fantasía Gráfica S.A.', 'Elena Sánchez', '916789012'),
('Distribuciones Independientes', 'Miguel Ortega', '917890123'),
('Heroes & Villains Co.', 'Sofía Jiménez', '918901234'),
('Universal Comics Import', 'Alejandro Castro', '919012345'),
('Epic Reads Distribución', 'Laura Morales', '920123456');


INSERT INTO inventario (id_comic, id_proveedor, cantidad, fecha_reposicion) VALUES
(1, 1, 100, '2024-01-10'),
(2, 1, 50, '2024-01-15'),
(3, 2, 75, '2024-01-20'),
(4, 3, 40, '2024-01-25'),
(5, 3, 60, '2024-02-01'),
(6, 4, 30, '2024-02-05'),
(7, 5, 45, '2024-02-10'),
(8, 5, 35, '2024-02-15'),
(9, 6, 20, '2024-02-20'),
(10, 6, 50, '2024-02-25'),
(11, 7, 70, '2024-03-01'),
(12, 7, 65, '2024-03-05'),
(13, 8, 55, '2024-03-10'),
(14, 8, 40, '2024-03-15'),
(15, 9, 25, '2024-03-20'),
(16, 9, 30, '2024-03-25'),
(17, 10, 80, '2024-04-01'),
(18, 10, 90, '2024-04-05'),
(19, 1, 60, '2024-04-10'),
(20, 2, 50, '2024-04-15');

INSERT INTO comic_autor (id_comic, id_autor) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 2),
(6, 4),
(7, 5),
(8, 5),
(9, 6),
(10, 6),
(11, 7),
(12, 8),
(13, 1),
(14, 1),
(15, 10),
(16, 11),
(17, 5),
(18, 4),
(19, 12),
(20, 13),
(3, 4), -- Watchmen también tiene colaboración de Neil Gaiman
(6, 2), -- Sandman con colaboración de Alan Moore
(7, 1), -- Saga con participación especial de Frank Miller
(10, 8), -- The Walking Dead con aportes de Mark Millar
(14, 9); -- Kingdom Come con participación de Frank Quitely


INSERT INTO comic_personaje (id_comic, id_personaje) VALUES
(1, 1),  
(2, 2),  
(3, 3),  
(4, 4),  
(5, 5),  
(6, 6),  
(7, 7),  
(8, 8),  
(9, 9),  
(10, 9), 
(11, 10),
(12, 11),
(12, 12),
(13, 1), 
(14, 1), 
(15, 13),
(16, 14),
(17, 15),
(18, 16),
(19, 17),
(20, 18), 
(12, 10), -- Spider-Man también aparece en Civil War
(14, 2),  -- Joker en Kingdom Come
(20, 19); -- Deadpool en el mismo cómic que Sue Storm

INSERT INTO comic_editorial (id_comic, id_editorial) VALUES
(1, 1),
(2, 1),
(3, 3),
(4, 6),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 4),
(10, 4),
(11, 2),
(12, 2),
(13, 1),
(14, 1),
(15, 10),
(16, 5),
(17, 4),
(18, 3),
(19, 3),
(20, 3),
(3, 1), -- Watchmen también publicado por DC Comics
(5, 1), -- V de Vendetta publicado por DC Comics también
(7, 2), -- Saga también distribuido por Marvel Comics
(10, 5), -- The Walking Dead distribuido por Dark Horse Comics
(14, 2); -- Kingdom Come publicado también por Marvel Comics


-- Inserción con valores NULL en algunos campos de cómics
INSERT INTO comic (titulo, fecha_publicacion, genero, numero_paginas, precio, stock) VALUES
('El Regreso del Caballero Oscuro', '1986-02-01', 'Superhéroes', 200, 19.99, 50),
('Cómic Sin Autor', NULL, NULL, 150, 12.99, 20), -- Sin fecha de publicación ni género
('Watchmen', '1986-09-01', 'Distopía', 416, 29.99, 40),
('Maus', '1991-11-19', 'Histórico', 296, NULL, 20), -- Sin precio definido
('Cómic Sin Stock', '2000-05-01', 'Fantasía', 300, 15.99, NULL); -- Sin stock disponible

-- Inserción con valores NULL en algunos autores
INSERT INTO autor (nombre, apellido, pais_origen, fecha_nacimiento) VALUES
('Frank', 'Miller', 'Estados Unidos', '1957-01-27'),
('Autor Desconocido', NULL, NULL, NULL), -- Autor sin apellido, país ni fecha
('Alan', 'Moore', 'Reino Unido', '1953-11-18'),
('Art', 'Spiegelman', 'Estados Unidos', '1948-02-15');

-- Inserción con valores NULL en algunas editoriales
INSERT INTO editorial (nombre, sede, fecha_fundacion) VALUES
('DC Comics', 'Estados Unidos', '1934-06-01'),
('Editorial Desconocida', NULL, NULL), -- Editorial sin sede ni fecha de fundación
('Marvel Comics', 'Estados Unidos', '1939-10-01');

-- Inserción con valores NULL en algunos personajes
INSERT INTO personaje (nombre, poder_principal, universo, descripcion) VALUES
('Batman', 'Inteligencia estratégica', 'DC', 'El Caballero Oscuro de Gotham.'),
('Personaje Desconocido', NULL, NULL, NULL), -- Personaje sin poder, universo ni descripción
('Rorschach', 'Investigación y deducción', 'DC', 'Vigilante implacable.'),
('Sueño', 'Control de sueños', 'DC', 'Protagonista de Sandman.');

-- Inserción con valores NULL en algunos clientes
INSERT INTO cliente (nombre, apellido, email, telefono, direccion) VALUES
('Carlos', 'Gómez', 'carlos.gomez@example.com', '600123456', 'Calle Mayor 45, Madrid'),
('Cliente Sin Datos', NULL, NULL, NULL, NULL), -- Cliente sin datos personales
('Laura', 'Martínez', 'laura.martinez@example.com', '600654321', 'Avenida del Prado 12, Barcelona');

-- Inserción con valores NULL en algunos pedidos
INSERT INTO pedido (id_cliente, fecha_pedido, total) VALUES
(1, '2024-01-15', 59.97),
(2, NULL, NULL), -- Pedido sin fecha ni total
(3, '2024-02-14', 49.98);

-- Inserción con valores NULL en detalles de pedidos
INSERT INTO detalle_pedido (id_pedido, id_comic, cantidad, precio_unitario) VALUES
(2, 2, NULL, NULL), -- Detalle sin cantidad ni precio
(3, 3, 1, 24.99);

-- Inserción con valores NULL en algunos proveedores
INSERT INTO proveedor (nombre, contacto, telefono) VALUES
('Distribuidora Global Comics', 'Andrés López', '910123456'),
('Proveedor Desconocido', NULL, NULL), -- Proveedor sin contacto ni teléfono
('ComicWorld Supplies', 'Carlos Fernández', '913456789');

-- Inserción con valores NULL en el inventario
INSERT INTO inventario (id_comic, id_proveedor, cantidad, fecha_reposicion) VALUES
(1, 1, 100, '2024-01-10'),
(2, 2, NULL, NULL), -- Registro sin cantidad ni fecha
(3, 3, 75, '2024-01-20');


