DROP SCHEMA IF EXISTS tv;
CREATE SCHEMA tv;
USE tv;

CREATE TABLE canal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100), 
    pais VARCHAR(50) NOT NULL
);

CREATE TABLE categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) 
);

CREATE TABLE programa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150), 
    categoria_id INT, 
    duracion INT, 
    canal_id INT, 
    FOREIGN KEY (categoria_id) REFERENCES categoria(id),
    FOREIGN KEY (canal_id) REFERENCES canal(id)
);

CREATE TABLE presentador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100), 
    edad INT, 
    especialidad VARCHAR(50) 
);

CREATE TABLE emision (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME, 
    programa_id INT, 
    canal_id INT, 
    FOREIGN KEY (programa_id) REFERENCES programa(id),
    FOREIGN KEY (canal_id) REFERENCES canal(id)
);

CREATE TABLE productora (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100), 
    pais VARCHAR(50) 
);

CREATE TABLE publicidad (
    id INT AUTO_INCREMENT PRIMARY KEY,
    empresa VARCHAR(100), 
    producto VARCHAR(100), 
    duracion INT 
);

CREATE TABLE espectador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100), 
    edad INT, 
    pais VARCHAR(50) 
);

CREATE TABLE opinion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    programa_id INT, 
    espectador_id INT, 
    calificacion INT, 
    comentario TEXT, 
    FOREIGN KEY (programa_id) REFERENCES programa(id),
    FOREIGN KEY (espectador_id) REFERENCES espectador(id)
);

CREATE TABLE guionista (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100), 
    experiencia INT 
);

CREATE TABLE programa_presentador (
    programa_id INT,
    presentador_id INT,
    FOREIGN KEY (programa_id) REFERENCES programa(id),
    FOREIGN KEY (presentador_id) REFERENCES presentador(id),
    PRIMARY KEY (programa_id, presentador_id)
);

CREATE TABLE programa_guionista (
    programa_id INT,
    guionista_id INT,
    FOREIGN KEY (programa_id) REFERENCES programa(id),
    FOREIGN KEY (guionista_id) REFERENCES guionista(id),
    PRIMARY KEY (programa_id, guionista_id)
);

CREATE TABLE programa_publicidad (
    programa_id INT,
    publicidad_id INT,
    FOREIGN KEY (programa_id) REFERENCES programa(id),
    FOREIGN KEY (publicidad_id) REFERENCES publicidad(id),
    PRIMARY KEY (programa_id, publicidad_id)
);

ALTER TABLE programa ADD productora_id INT;
ALTER TABLE programa ADD FOREIGN KEY (productora_id) REFERENCES productora(id);
