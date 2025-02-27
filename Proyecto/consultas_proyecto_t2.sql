USE employees;

-- 1. Salario medio de los empleados.
SELECT 
    EXTRACT(MONTH FROM from_date) as mes,
    ROUND(AVG(salary), 2) AS salario_medio
FROM salaries
WHERE from_date <= '2023-01-31' AND to_date >= '2022-02-01'
GROUP BY mes, EXTRACT(YEAR FROM from_date)
ORDER BY EXTRACT(YEAR FROM from_date) ASC, mes ASC;


-- 2. Salario medio de los managers de cada departamento.
SELECT
    EXTRACT(MONTH FROM salaries.from_date) as mes,
    ROUND(AVG(salaries.salary), 2) as salario_medio_managers,
    departments.dept_name as departamento
FROM salaries
RIGHT JOIN dept_manager ON salaries.emp_no = dept_manager.emp_no
RIGHT JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE salaries.from_date <= '2023-01-31' AND salaries.to_date >= '2022-02-01' 
GROUP BY mes, EXTRACT(YEAR FROM salaries.from_date), departments.dept_no
ORDER BY EXTRACT(YEAR FROM salaries.from_date) ASC, mes ASC;

-- CUSTOMER SERVICE
SELECT
    EXTRACT(MONTH FROM salaries.from_date) as mes,
    ROUND(AVG(salaries.salary), 2) as salario_medio_managers
FROM salaries
LEFT JOIN dept_manager ON salaries.emp_no = dept_manager.emp_no
LEFT JOIN departments ON dept_manager.dept_no = departments.dept_no 
    AND departments.dept_name = 'Customer Service' 
WHERE salaries.from_date <= '2023-01-31' 
    AND salaries.to_date >= '2022-02-01'
GROUP BY mes, EXTRACT(YEAR FROM salaries.from_date)
ORDER BY EXTRACT(YEAR FROM salaries.from_date) ASC, mes ASC;

-- Customer Service
-- Quality Management
-- Development
-- Production
-- Finance
-- Human Resources
-- Marketing
-- Research
-- Sales


-- 3. Salario medio de los empleados de cada departamento.
SELECT
    EXTRACT(MONTH FROM salaries.from_date) as mes,
    ROUND(AVG(salaries.salary), 2) as salario_medio_empleados
FROM salaries
JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
    AND departments.dept_name = 'Customer Service' 
WHERE salaries.from_date <= '2023-01-31' AND salaries.to_date >= '2022-02-01'
GROUP BY mes, EXTRACT(YEAR FROM salaries.from_date)
ORDER BY EXTRACT(YEAR FROM salaries.from_date) ASC, mes ASC;


-- CUSTOMER SERVICE
SELECT
    EXTRACT(MONTH FROM salaries.from_date) as mes,
    ROUND(AVG(salaries.salary), 2) as salario_medio_empleados
FROM salaries
JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE salaries.from_date <= '2023-01-31' AND salaries.to_date >= '2022-02-01'
    AND departments.dept_name = 'Customer Service' 
GROUP BY mes, EXTRACT(YEAR FROM salaries.from_date)
ORDER BY EXTRACT(YEAR FROM salaries.from_date) ASC, mes ASC;

-- 4. Salario medio de los empleados por puesto de trabajo.
SELECT
    ROUND(AVG(salaries.salary), 2) as salario_medio_empleados,
    titles.title as puesto
FROM salaries
JOIN titles ON salaries.emp_no = titles.emp_no
WHERE salaries.from_date <= '2023-01-31' AND salaries.to_date >= '2022-02-01'
GROUP BY titles.title;

-- Senior Engineer
-- Staff
-- Engineer
-- Senior Staff
-- Assitant Engineer
-- Technique Leader
-- Manager

-- SENIOR ENGINEER
SELECT
    EXTRACT(MONTH FROM salaries.from_date) as mes,
    ROUND(AVG(salaries.salary), 2) as salario_medio_empleados
FROM salaries
JOIN titles ON salaries.emp_no = titles.emp_no
WHERE salaries.from_date <= '2023-01-31' AND salaries.to_date >= '2022-02-01'
    AND titles.title = 'Senior Engineer' 
GROUP BY mes, EXTRACT(YEAR FROM salaries.from_date)
ORDER BY EXTRACT(YEAR FROM salaries.from_date) ASC, mes ASC;


-- 5. Gasto total en el pago de salarios.
SELECT
    EXTRACT(MONTH FROM salaries.from_date) as mes,
    SUM(salaries.salary) as gasto_total_salarios
FROM salaries
WHERE salaries.from_date <= '2023-01-31' AND salaries.to_date >= '2022-02-01'
GROUP BY mes, EXTRACT(YEAR FROM salaries.from_date)
ORDER BY EXTRACT(YEAR FROM salaries.from_date) ASC, mes ASC;

-- 6. Para calcular el coste empresarial, debemos añadir un 30% de cotizaciones sociales.
SELECT
    EXTRACT(MONTH FROM salaries.from_date) as mes,
    SUM(salaries.salary) * 0.3 + SUM(salaries.salary) as gasto_total_salarios
FROM salaries
WHERE salaries.from_date <= '2023-01-31' AND salaries.to_date >= '2022-02-01'
GROUP BY mes, EXTRACT(YEAR FROM salaries.from_date)
ORDER BY EXTRACT(YEAR FROM salaries.from_date) ASC, mes ASC;



-- 7. Brecha salarial entre hombres y mujeres indicada en porcentaje.
SELECT
    EXTRACT(MONTH FROM salaries.from_date) as mes,
    ROUND(((SELECT AVG(salaries.salary) from salaries JOIN employees ON salaries.emp_no = employees.emp_no WHERE employees.gender = 'M') 
    - (SELECT AVG(salaries.salary) from salaries JOIN employees ON salaries.emp_no = employees.emp_no WHERE employees.gender = 'F')) 
    / (SELECT AVG(salaries.salary) from salaries JOIN employees ON salaries.emp_no = employees.emp_no WHERE employees.gender = 'F') 
    * 100, 2) as brecha_salarial
from salaries
JOIN employees ON salaries.emp_no = employees.emp_no
WHERE salaries.from_date <= '2023-01-31' AND salaries.to_date >= '2022-02-01'
GROUP BY mes, EXTRACT(YEAR FROM salaries.from_date)
ORDER BY EXTRACT(YEAR FROM salaries.from_date) ASC, mes ASC;


