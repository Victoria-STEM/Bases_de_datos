-- Ejercicio 1: Creación de usuarios locales y remotos
CREATE USER 'local_admin'@'localhost' IDENTIFIED BY 'Admin123!';
CREATE USER 'remote_user'@'%' IDENTIFIED BY 'UserSecure';
CREATE USER 'backup_user'@'192.168.1.%' IDENTIFIED BY 'BackupPass!';


-- Ejercicio 2: Listado de usuarios existentes
SELECT User, Host FROM mysql.user;


-- Ejercicio 3: Modificación de contraseñas
ALTER USER 'admin_local'@'localhost' IDENTIFIED BY 'AdminNewPass!';
ALTER USER 'backup_user'@'localhost' IDENTIFIED BY 'BackupNewPass!';


-- Ejercicio 4: Expiración de contraseñas
ALTER USER 'user_remote'@'localhost' PASSWORD EXPIRE;


-- Ejercicio 5: Eliminación de usuarios
DROP USER 'backup_user'@'%';


-- Ejercicio 6: Concesión de todos los privilegios sobre una base de datos
GRANT ALL PRIVILEGES ON empresa.* TO 'admin_local'@'localhost';


-- Ejercicio 7: Concesión de permisos específicos 
GRANT SELECT, INSERT ON ventas.pedidos TO 'user_remote'@'%';


-- Ejercicio 8: Revocación de privilegios
REVOKE INSERT ON ventas.pedidos FROM 'user_remote'@'%';


-- Ejercicio 9: Visualización de privilegios de un usuario
SHOW GRANTS FOR 'admin_local'@'localhost';


-- Ejercicio 10: Aplicación de cambios en los privilegios 
FLUSH PRIVILEGES;