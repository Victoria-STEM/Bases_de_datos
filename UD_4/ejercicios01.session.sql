-- Elimina la base de datos si ya existe
DROP DATABASE IF EXISTS techcorp_db;

-- Crea la base de datos
CREATE DATABASE techcorp_db;
USE techcorp_db;

-- Tabla empleados
-- Crea la tabla empleados con las columnas:
-- id (entero, clave primaria)
-- nombre (nombre del empleado)
-- edad (edad del empleado)
-- salario (salario mensual del empleado)
-- departamento (departamento donde trabaja)
-- ciudad (ciudad donde trabaja)
CREATE TABLE empleados (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    edad INT,
    salario DECIMAL(10, 2),
    departamento VARCHAR(50),
    ciudad VARCHAR(50)
);

-- Inserta registros de ejemplo en la tabla empleados
-- Datos de empleados con diferentes departamentos, ciudades y salarios
INSERT INTO empleados VALUES
(1, 'Laura', 35, 4500, 'IT', 'Madrid'),
(2, 'Carlos', 28, 3200, 'Ventas', 'Barcelona'),
(3, 'Ana', 45, 6000, 'Marketing', 'Madrid'),
(4, 'Juan', 50, 5200, 'Recursos Humanos', 'Sevilla'),
(5, 'Luis', 29, 3400, 'IT', 'Madrid'),
(6, 'Marta', 33, 5800, 'Desarrollo', 'Valencia');

-- Tabla clientes
-- Crea la tabla clientes con las columnas:
-- id (entero, clave primaria)
-- nombre (nombre del cliente)
-- ciudad (ciudad donde reside el cliente)
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    ciudad VARCHAR(50)
);

-- Inserta registros de ejemplo en la tabla clientes
-- Datos de clientes con diferentes ciudades
INSERT INTO clientes VALUES
(1, 'Tech Solutions', 'Madrid'),
(2, 'Innovate Inc', 'Barcelona'),
(3, 'NextGen Ltd', 'Valencia'),
(4, 'FutureWorks', 'Madrid'),
(5, 'DigitalSoft', 'Sevilla');




-- Ejercicios para realizar consultas SQL

-- 1. Recupera los nombres y salarios de todos los empleados.
SELECT nombre, salario FROM empleados;
-- 2. Selecciona todos los datos de la tabla empleados.
SELECT * FROM empleados;
-- 3. Recupera los datos de los empleados que trabajan en el departamento de IT y cuya ciudad sea Madrid.
SELECT * FROM empleados WHERE departamento = 'IT' AND ciudad = 'Madrid';
-- 4. Selecciona todos los empleados con un salario mayor a 3000 pero menor o igual a 6000.
SELECT nombre FROM empleados WHERE salario > 3000 AND salario <= 6000;
-- 5. Muestra una lista única de todas las ciudades en las que trabajan los empleados.
SELECT DISTINCT ciudad FROM empleados;
-- 6. Encuentra todos los empleados que trabajan en Ventas o Marketing y tienen un salario mayor a 5000.
SELECT nombre FROM empleados WHERE departamento = 'Ventas' OR departamento = 'Marketing' AND salario > 5000;
-- 7. Recupera todos los empleados que no trabajan en el departamento de Recursos Humanos.
SELECT nombre FROM empleados WHERE departamento != 'Recursos Humanos';
-- 8. Encuentra todos los clientes que residen en Barcelona.
SELECT nombre FROM clientes WHERE ciudad = 'Barcelona';
-- 9. Muestra una lista única de nombres de departamentos donde hay empleados menores de 30 años que ganan más de 4000.
SELECT DISTINCT departamento FROM empleados WHERE edad < 30 AND salario > 4000;
-- 10. Recupera los empleados que tienen un salario mayor o igual a 3500 y están en el departamento Desarrollo.
SELECT nombre FROM empleados WHERE salario >= 3500 AND departamento = 'desarrollo';
-- ¡Ejecuta cada consulta y verifica los resultados para practicar!
