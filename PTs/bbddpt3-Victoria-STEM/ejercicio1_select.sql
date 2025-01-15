SELECT nombre,apellido FROM empleado;
SELECT nombre,apellido,id_departamento FROM empleado WHERE id_departamento = 2;
SELECT nombre,apellido FROM empleado ORDER BY apellido ASC;
SELECT nombre,apellido FROM empleado WHERE apellido = 'García' ORDER BY nombre DESC;