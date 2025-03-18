-- **Ejercicios de Administración de Bases de Datos en MySQL con Sakila**

-- **1. Administración de Usuarios**
-- 1.1. Crear un usuario llamado `sakila_admin` que solo pueda conectarse 
--desde `localhost` con la contraseña `AdminPass123`.
CREATE USER 'sakila_admin'@'localhost' IDENTIFIED BY 'Admin123!';

-- 1.2. Crear un usuario llamado `sakila_user` que pueda conectarse 
-- desde cualquier IP (`%`) con la contraseña `UserPass456`.
CREATE USER 'sakila_user'@'%' IDENTIFIED BY 'UserPass456';
 
-- 1.3. Mostrar todos los usuarios existentes en el servidor MySQL.
SELECT User, Host FROM mysql.user;

-- 1.4. Cambiar la contraseña del usuario `sakila_user` a `NewSecurePass789`.
ALTER USER 'sakila_user'@'%' IDENTIFIED BY 'NewSecurePass789';
  
-- 1.5. Eliminar el usuario `sakila_user` de la base de datos.
DROP USER 'sakila_user'@'%';
 
 
-- **2. Gestión de Privilegios**
-- 2.1. Conceder todos los privilegios sobre la base de datos `sakila` al usuario `sakila_admin`.
GRANT ALL ON sakila.* TO 'sakila_admin'@'localhost';

-- 2.2. Conceder solo permisos de `SELECT` y `INSERT` en la tabla `film` al usuario `sakila_user`.
GRANT SELECT, INSERT ON sakila.film TO 'sakila_user'@'%';

-- 2.3. Revocar los permisos de `INSERT` en la tabla `film` al usuario `sakila_user`.
REVOKE INSERT ON sakila.film TO 'sakila_user'@'%';
 
-- 2.4. Mostrar los privilegios asignados al usuario `sakila_admin`.
SHOW GRANTS FOR 'sakila_admin'@'localhost';

-- 2.5. Aplicar los cambios en los privilegios de los usuarios asegurando 
-- que se actualicen en el sistema.
FLUSH PRIVILEGES;


-- **3. Gestión de Roles en MySQL**
-- 3.1. Crear un rol llamado `gestor_clientes` para administrar clientes en la base de datos `sakila`.
CREATE ROLE `gestor_clientes`;

-- 3.2. Conceder permisos de `SELECT`, `INSERT` y `UPDATE` en la tabla `customer` al rol `gestor_clientes`.
GRANT SELECT, INSERT, UPDATE ON sakila.customer TO `gestor_clientes`;
 
-- 3.3. Asignar el rol `gestor_clientes` al usuario `sakila_user`.
GRANT `gestor_clientes` TO 'sakila_user'@'%';

-- 3.4. Establecer `gestor_clientes` como el rol predeterminado para `sakila_user`.
SET DEFAULT ROLE `gestor_clientes` TO 'sakila_user'@'%'; 

-- 3.5. Mostrar los roles asignados al usuario `sakila_user`.
SHOW GRANTS FOR 'sakila_user'@'%';
 
-- **4. Índices en MySQL**
-- 4.1. Crear un índice en la columna `last_name` de la tabla `customer`.
CREATE INDEX idx_last_name ON customer (last_name);

-- 4.2. Crear un índice compuesto en las columnas `first_name` y `last_name` de la tabla `customer`.
CREATE INDEX idx_first_name_last_name ON customer (first_name, last_name);
 
-- 4.3. Crear un índice único en la columna `email` de la tabla `customer`.
CREATE UNIQUE INDEX idx_email ON customer (email); 

-- 4.4. Mostrar todos los índices de la tabla `customer`.
SHOW INDEX FROM customer;
 
-- 4.5. Eliminar el índice creado en la columna `last_name` de la tabla `customer`.
DROP INDEX idx_last_name ON customer;