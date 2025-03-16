USE employees;

-- 1. Salario medio de los empleados.
SELECT 
    DATE_FORMAT(s.from_date, '%Y-%m') AS mes, 
    ROUND(AVG(salary), 2) AS salario_medio
FROM salaries s
WHERE from_date <= '2023-01-31' AND to_date >= '2022-02-01'
GROUP BY mes
ORDER BY mes;

SELECT 
        DATE_FORMAT(s.from_date, '%Y-%m') AS mes, 
        ROUND(AVG(salary), 2) AS salario_medio
    FROM salaries
    WHERE from_date BETWEEN DATE_SUB('1991-01-01', INTERVAL 12 MONTH) AND '1991-01-01'
    GROUP BY mes, EXTRACT(YEAR FROM from_date)
    ORDER BY EXTRACT(YEAR FROM from_date) ASC, mes ASC;

SELECT 
    DATE_FORMAT(s.from_date, '%Y-%m') AS month, 
    AVG(s.salary) AS avg_salary
FROM salaries AS s
WHERE (s.from_date <= '1998-12-31' AND s.to_date >= '1998-01-01')  -- Include salaries active during the year
AND EXISTS (
    SELECT 1
    FROM salaries AS s2
    WHERE s2.emp_no = s.emp_no
    AND s2.from_date <= '1998-12-31'
    AND s2.to_date >= '1998-01-01'
    AND (MONTH(s2.from_date) <= MONTH('1998-12-31') AND MONTH(s2.to_date) >= MONTH('1998-01-01'))
)
GROUP BY month
ORDER BY month;


-- 2. Salario medio de los managers de cada departamento.

-- CUSTOMER SERVICE
SELECT
    DATE_FORMAT(s.from_date, '%Y-%m') AS mes, 
    ROUND(AVG(s.salary), 2) as salario_medio_managers
FROM salaries s
LEFT JOIN dept_manager dp ON s.emp_no = dm.emp_no
LEFT JOIN departments d ON dp.dept_no = d.dept_no 
    AND d.dept_name = 'Customer Service' 
WHERE s.from_date <= '2023-01-31' 
    AND salaries.to_date >= '2022-02-01'
GROUP BY mes
ORDER BY mes;

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
    DATE_FORMAT(s.from_date, '%Y-%m') AS mes, 
    ROUND(AVG(s.salary), 2) as salario_medio_empleados
FROM salaries s
JOIN dept_emp de ON s.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
    AND d.dept_name = 'Customer Service' 
WHERE s.from_date <= '2023-01-31' AND s.to_date >= '2022-02-01'
GROUP BY mes
ORDER BY mes;


-- 4. Salario medio de los empleados por puesto de trabajo.
SELECT
    ROUND(AVG(s.salary), 2) as salario_medio_empleados,
    t.title as puesto
FROM salaries s
JOIN titles t ON s.emp_no = t.emp_no
WHERE s.from_date <= '2023-01-31' AND s.to_date >= '2022-02-01'
GROUP BY t.title;

-- Senior Engineer
-- Staff
-- Engineer
-- Senior Staff
-- Assitant Engineer
-- Technique Leader
-- Manager

-- SENIOR ENGINEER
SELECT
    DATE_FORMAT(s.from_date, '%Y-%m') AS mes, 
    ROUND(AVG(s.salary), 2) as salario_medio_empleados
FROM salaries s
JOIN titles t ON s.emp_no = t.emp_no
WHERE s.from_date <= '1991-01-01' AND s.to_date >= '1991-12-01'
    AND t.title = 'Senior Engineer' 
GROUP BY mes
ORDER BY mes;


-- 5. Gasto total en el pago de salarios.
SELECT
    DATE_FORMAT(s.from_date, '%Y-%m') AS mes, 
    SUM(s.salary) as gasto_total_salarios
FROM salaries s
WHERE s.from_date <= '2023-01-31' AND s.to_date >= '2022-02-01'
GROUP BY mes
ORDER BY mes;

-- 6. Para calcular el coste empresarial, debemos añadir un 30% de cotizaciones sociales.
SELECT
    DATE_FORMAT(s.from_date, '%Y-%m') AS month, 
    SUM(salaries.salary) * 0.3 + SUM(salaries.salary) as gasto_total_salarios
FROM salaries
WHERE salaries.from_date <= '2023-01-31' AND salaries.to_date >= '2022-02-01'
GROUP BY mes, EXTRACT(YEAR FROM salaries.from_date)
ORDER BY EXTRACT(YEAR FROM salaries.from_date) ASC, mes ASC;



-- 7. Brecha salarial entre hombres y mujeres indicada en porcentaje.
SELECT
    avgM.mes,
    avgM.avg_salary as salario_medio_hombre,
    avgF.avg_salary as salario_medio_mujeres,
    ROUND(((avgM.avg_salary - avgF.avg_salary) / avgM.avg_salary) * 100, 2) AS Brecha_Salarial
FROM
    (SELECT DATE_FORMAT(s.from_date, '%Y-%m') AS mes,
            AVG(s.salary) AS avg_salary
     FROM salaries s
     JOIN employees e ON s.emp_no = e.emp_no 
     WHERE e.gender = 'M' 
       AND s.from_date <= '2023-01-31' 
       AND s.to_date >= '2022-02-01'
     GROUP BY mes
    ) AS avgM
JOIN 
    (SELECT DATE_FORMAT(s.from_date, '%Y-%m') AS mes,
            AVG(s.salary) AS avg_salary
     FROM salaries s
     JOIN employees e ON s.emp_no = e.emp_no 
     WHERE e.gender = 'F' 
       AND s.from_date <= '2023-01-31' 
       AND s.to_date >= '2022-02-01'
     GROUP BY mes
    ) AS avgF
ON avgM.mes = avgF.mes
ORDER BY mes ASC;



-- Cantidad total de empleados contratados.
SELECT 
    DATE_FORMAT(s.from_date, '%Y-%m') AS mes, 
    COUNT(DISTINCT e.emp_no) as numero_empleados
FROM salaries s
JOIN employees e ON s.emp_no = e.emp_no
WHERE from_date BETWEEN DATE_SUB('1991-01-01', INTERVAL 12 MONTH) AND '1991-01-01'
GROUP BY mes
ORDER BY mes;

-- Cantidad de empleados contratados en cada departamento.
SELECT
    DATE_FORMAT(s.from_date, '%Y-%m') AS mes, 
    COUNT(DISTINCT e.emp_no) as numero_empleados
FROM salaries s
JOIN employees e ON s.emp_no = e.emp_no
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE s.from_date BETWEEN DATE_SUB('1991-01-01', INTERVAL 12 MONTH) AND '1991-01-01'
    AND dept_name='Customer Service'
GROUP BY mes
ORDER BY mes;

-- Cantidad de trabajadores por puesto de trabajo
SELECT
    DATE_FORMAT(s.from_date, '%Y-%m') AS mes, 
    COUNT(DISTINCT e.emp_no) as numero_empleados
FROM salaries s
JOIN employees e ON s.emp_no = e.emp_no
JOIN titles t ON e.emp_no = t.emp_no
WHERE s.from_date BETWEEN DATE_SUB('1991-01-01', INTERVAL 12 MONTH) AND '1991-01-01'
    AND t.title = 'Assistant Engineer' 
GROUP BY mes
ORDER BY mes;

-- Senior Engineer
-- Engineer
-- Assitant Engineer
-- Technique Leader
-- Manager
-- Senior Staff
-- Staff