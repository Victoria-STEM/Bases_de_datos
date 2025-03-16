USE employees;

-- 1. Cambiar el salario de algún empleado: insertar una nueva fila en la tabla salaries 
-- con el nuevo salario y actualizar el campo to_date del salario anterior 
-- para reflejar la fecha de finalización.

UPDATE salaries 
SET to_date = CURRENT_DATE 
WHERE emp_no = 10001 
    AND to_date = '9999-01-01';

INSERT INTO salaries (emp_no, salary, from_date, to_date)
VALUES (10001, 100000, CURRENT_DATE, '9999-01-01');


-- Pruebas
SELECT 
    emp_no,
    to_date,
    salary
FROM salaries
WHERE emp_no=10001;

SELECT 
    e.first_name
FROM employees e
WHERE emp_no=10001;


-- Cambiar de departamento a algún empleado: insertar una nueva fila en la tabla 
-- dept_emp con el nuevo departamento y actualizar el campo to_date 
-- del departamento anterior para indicar la fecha de salida.
UPDATE dept_emp
SET to_date = CURRENT_DATE 
WHERE emp_no = 10001 
    AND to_date = '9999-01-01';

INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date)
VALUES (10001, 'd008', CURRENT_DATE, '9999-01-01');

-- Pruebas

-- Customer Service
-- Quality Management
-- Development
-- Production
-- Finance
-- Human Resources
-- Marketing
-- Research
-- Sales

SELECT
    d.dept_no,
    d.dept_name
FROM departments d;

SELECT
    d.dept_name,
    e.first_name,
    d.dept_no,
    de.to_date
from departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN employees e ON de.emp_no = e.emp_no
WHERE e.emp_no = 10001;

-- Añadir una columna days_in_dept a la tabla dept_emp que indique los días 
-- que ha estado el empleado en cada departamento, calculando la diferencia 
-- entre from_date y to_date.

ALTER TABLE dept_emp ADD COLUMN days_in_dept INT;
UPDATE dept_emp
SET days_in_dept = 
    CASE 
        WHEN to_date = '9999-01-01' THEN DATEDIFF(CURRENT_DATE, from_date) 
        ELSE DATEDIFF(to_date, from_date) 
    END;


-- Prueba
SELECT
    days_in_dept,
    to_date,
    from_date
from dept_emp
LIMIT 5;


-- Añadir una columna age_at_hire a la tabla employees que indique la edad 
-- del trabajador cuando fue contratado, calculando la diferencia 
-- entre birth_date y hire_date.

ALTER TABLE employees ADD COLUMN age_at_hire INT;
UPDATE employees
SET age_at_hire = EXTRACT(YEAR FROM hire_date) - EXTRACT(YEAR FROM birth_date) - 
    (DATE_FORMAT(hire_date, '%m%d') < DATE_FORMAT(birth_date, '%m%d'));


-- Añadir una columna seniority a la tabla employees que indique 
-- los días que el empleado ha estado contratado hasta hoy, calculando 
-- la diferencia entre hire_date y la fecha actual.

ALTER TABLE employees ADD COLUMN seniority INT;
UPDATE employees
SET seniority =
    CASE 
        WHEN to_date = '9999-01-01' THEN DATEDIFF(CURRENT_DATE, from_date) 
        ELSE DATEDIFF(to_date, from_date) 
    END;