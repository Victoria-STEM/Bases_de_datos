
# Para crear una tabla
CREATE TABLE Empleado(
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    salario DECIMAL(10,2),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamento (id_departamento)
);

# Para mostrarla o eliminarla
SHOW TABLES; # mostrar la base de datos
DROP TABLES; # borrar tablas
