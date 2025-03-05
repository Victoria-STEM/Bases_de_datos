use employees;

SET profiling = 1;
SELECT * FROM employees WHERE last_name = 'Facello';
SHOW PROFILES;


CREATE INDEX idx_apellido ON employees (last_name);


SELECT * FROM employees WHERE last_name = 'Facello';
SHOW PROFILES;


CREATE INDEX idx_nombre_apellido ON employees (first_name, last_name);
EXPLAIN SELECT * FROM employees WHERE first_name = 'Georgi' AND last_name = 'Facello';

DROP INDEX idx_nombre_apellido ON employees;
DROP INDEX idx_apellido ON employees;