-- Crea un usuario llamado analista con acceso local y contraseña analistaPass.
-- Crea un usuario reportes que pueda conectarse desde cualquier IP y tenga la contraseña report123.
-- Lista todos los usuarios creados en el servidor.
CREATE USER 'analista'@'localhost' IDENTIFIED BY 'analistaPass';
CREATE USER 'reportes'@'%' IDENTIFIED BY 'report123';
SELECT User, Host FROM mysql.user;


-- Asigna al usuario analista permisos de SELECT en todas las tablas de la base de datos administracion_mysql.
-- Concede al usuario reportes permisos de SELECT y INSERT en la tabla ventas.
-- Revoca el permiso de INSERT al usuario reportes.
-- Verifica los permisos asignados al usuario analista.
GRANT SELECT, ON administracion_mysql.* TO 'analista'@'localhost';
GRANT SELECT, INSERT ON administracion_mysql.ventas TO 'reportes'@'%';
REVOKE INSERT ON administracion_mysql.ventas FROM 'reportes'@'%';
SHOW GRANTS FOR 'reportes'@'%';


-- Crea un rol llamado gestor_ventas.
-- Asigna los permisos SELECT, INSERT, UPDATE a gestor_ventas sobre la base de datos administracion_mysql.
-- Asigna el rol gestor_ventas al usuario analista.
-- Verifica los roles asignados al usuario analista.
CREATE ROLE 'gestor_ventas';
GRANT SELECT, INSERT, UPDATE ON administracion_mysql.* TO 'gestor_ventas';
FLUSH PRIVILEGES;
GRANT 'gestor_ventas' TO 'analista'@'localhost';
SELECT * FROM information_schema.applicable_roles WHERE grantee = 'analista'@'localhost';


-- Crea un índice en la columna producto de la tabla ventas.
-- Crea un índice compuesto en las columnas nombre y email de la tabla usuarios.
-- Lista los índices existentes en la tabla ventas.
-- Elimina el índice de producto en la tabla ventas.
CREATE INDEX idx_producto ON administracion_mysql.ventas (producto);
CREATE INDEX idx_nombre_email ON administracion_mysql.usuarios (nombre, email);
SHOW PROFILES;
DROP INDEX idx_producto ON administracion_mysql;


-- Cambia la contraseña del usuario analista a newPass456.
-- Fuerza al usuario reportes a cambiar su contraseña en el próximo inicio de sesión.
-- Elimina el usuario reportes del servidor.
ALTER USER 'analista'@'localhost' IDENTIFIED BY 'newPass456';
ALTER USER 'reportes'@'%' PASSWORD EXPIRE;
DROP USER 'reportes'@'%';


-- Realiza una consulta EXPLAIN sobre la tabla ventas para verificar cómo se están utilizando los índices.
-- Crea un índice en la columna cantidad de la tabla ventas.
-- Ejecuta nuevamente la consulta EXPLAIN y analiza la diferencia en rendimiento.
EXPLAIN SELECT * FROM ventas;
CREATE INDEX idx_cantidad ON administracion_mysql.ventas (cantidad);
EXPLAIN SELECT * FROM ventas;
