-- Ejercicio 1: Creación de usuarios locales y remotos
CREATE USER 'local_admin'@'localhost' IDENTIFIED BY 'Admin123!';
CREATE USER 'user_remote'@'%' IDENTIFIED BY 'UserSecure';
CREATE USER 'backup_user'@'192.168.1.%' IDENTIFIED BY 'BackupPass!';


-- Ejercicio 2: Listado de usuarios existentes
SELECT User, Host FROM mysql.user;


-- Ejercicio 3: Modificación de contraseñas
ALTER USER 'local_admin'@'localhost' IDENTIFIED BY '1234';


ALTER USER 'backup_user'@'192.168.1.%' IDENTIFIED BY 'BackupNewPass!';


-- Ejercicio 4: Expiración de contraseñas
ALTER USER 'user_remote'@'localhost' PASSWORD EXPIRE;


-- Ejercicio 5: Eliminación de usuarios
DROP USER 'backup_user'@'%';


-- Ejercicio 6: Concesión de todos los privilegios sobre una base de datos
GRANT ALL PRIVILEGES ON tienda_comics.* TO 'local_admin'@'localhost';
GRANT ALL PRIVILEGES ON mysql.* TO 'local_admin'@'localhost';


-- Ejercicio 7: Concesión de permisos específicos 
GRANT SELECT, INSERT ON tienda_comics.pedidos TO 'user_remote'@'%';


-- Ejercicio 8: Revocación de privilegios
REVOKE INSERT ON tienda_comics.pedidos FROM 'user_remote'@'%';


-- Ejercicio 9: Visualización de privilegios de un usuario
SHOW GRANTS FOR 'local_admin'@'localhost';


-- Ejercicio 10: Aplicación de cambios en los privilegios 
FLUSH PRIVILEGES;


-- Para entrar en MySql en la terminal:
mysql -u local_admin -p


-- Ejercicio 11: Creación de roles
CREATE ROLE 'gestor_ventas';
CREATE ROLE 'analista_datos';

-- CREATE USER 'gestor_ventas'@'localhost' IDENTIFIED BY '1234';
-- CREATE USER 'analista_datos'@'localhost' IDENTIFIED BY '1234';

GRANT SELECT, INSERT, UPDATE ON tienda_comics.* TO 'gestor_ventas';
GRANT SELECT ON tienda_comics.* TO 'analista_datos';
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'local_admin'@'localhost';
SELECT * FROM information_schema.applicable_roles WHERE grantee = 'admin_local@localhost';

GRANT 'gestor_ventas' TO 'local_admin'@'localhost';
GRANT 'analista_datos' TO 'user_remote'@'%';
SELECT * FROM information_schema.enabled_roles;

SHOW GRANTS FOR 'local_admin'@'localhost';
SHOW GRANTS FOR 'user_remote'@'%';

