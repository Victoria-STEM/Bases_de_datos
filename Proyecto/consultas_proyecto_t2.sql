USE employees;

-- 1. Salario medio de los empleados.
SELECT 
    EXTRACT(MONTH FROM from_date) as mes,
    ROUND(AVG(salary), 2) AS salario_medio
FROM salaries
WHERE from_date <= '2023-01-31' AND to_date >= '2022-02-01'
GROUP BY mes, EXTRACT(YEAR FROM from_date)
ORDER BY EXTRACT(YEAR FROM from_date) ASC, mes ASC;

SELECT 
        EXTRACT(MONTH FROM from_date) as mes,
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

-- UNIFICADA
SELECT
    DATE_FORMAT(salaries.from_date, '%Y-%m') AS mes,
    ROUND(AVG(salaries.salary), 2) as salario_medio_managers,
    departments.dept_name as departamento
FROM salaries
JOIN dept_manager ON salaries.emp_no = dept_manager.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE salaries.from_date BETWEEN DATE_SUB('1999-01-01', INTERVAL 12 MONTH) AND '1999-01-01'
GROUP BY mes, departamento
ORDER BY mes;

-- CUSTOMER SERVICE
SELECT
    DATE_FORMAT(salaries.from_date, '%Y-%m') as mes,
    ROUND(AVG(salaries.salary), 2) as salario_medio_managers
FROM salaries
JOIN dept_manager ON salaries.emp_no = dept_manager.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no 
WHERE salaries.from_date BETWEEN DATE_SUB('1999-01-01', INTERVAL 12 MONTH) AND '1999-01-01'
    AND departments.dept_name = 'Customer Service' 
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
-- UNIFICADA
SELECT
    DATE_FORMAT(s.from_date, '%Y-%m') as mes,
    d.dept_name as departamento,
    ROUND(AVG(s.salary), 2) as salario_medio_empleados
FROM salaries s
JOIN dept_emp de ON s.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE s.from_date BETWEEN DATE_SUB('1999-01-01', INTERVAL 12 MONTH) AND '1999-01-01'
GROUP BY mes, departamento
ORDER BY d.dept_no ASC, mes ASC;

-- CUSTOMER SERVICE
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
    avgM.mes,
    ROUND(((avgM.avg_salary - avgF.avg_salary) / avgM.avg_salary) * 100, 2) AS Brecha_Salarial
FROM
    (SELECT DATE_FORMAT(salaries.from_date, '%Y-%m') AS mes,
            AVG(salaries.salary) AS avg_salary
     FROM salaries 
     JOIN employees ON salaries.emp_no = employees.emp_no 
     WHERE employees.gender = 'M' 
       AND salaries.from_date <= '2023-01-31' 
       AND salaries.to_date >= '2022-02-01'
     GROUP BY mes
    ) AS avgM

JOIN 
    (SELECT DATE_FORMAT(salaries.from_date, '%Y-%m') AS mes,
            AVG(salaries.salary) AS avg_salary
     FROM salaries 
     JOIN employees ON salaries.emp_no = employees.emp_no 
     WHERE employees.gender = 'F' 
       AND salaries.from_date <= '2023-01-31' 
       AND salaries.to_date >= '2022-02-01'
     GROUP BY mes
    ) AS avgF

ON avgM.mes = avgF.mes

ORDER BY mes ASC;



-- SELECT 
--     DATE_FORMAT(s.from_date, '%Y-%m') AS month,
--     ROUND(AVG(CASE WHEN e.gender = 'M' THEN s.salary ELSE NULL END), 2) AS avg_men_salary,
--     ROUND(AVG(CASE WHEN e.gender = 'F' THEN s.salary ELSE NULL END), 2) AS avg_women_salary,
--     ROUND((AVG(CASE WHEN e.gender = 'M' THEN s.salary ELSE NULL END) - AVG(CASE WHEN e.gender = 'F' THEN s.salary ELSE NULL END)), 2) AS salary_gap
-- FROM salaries AS s
-- JOIN employees AS e ON e.emp_no = s.emp_no
-- WHERE (s.from_date <= '1998-12-31' AND s.to_date >= '1998-01-01')  -- Incluir los salarios activos en 1998
-- AND EXISTS (
--     SELECT 1
--     FROM salaries AS s2
--     WHERE s2.emp_no = s.emp_no
--     AND s2.from_date <= '1998-12-31'
--     AND s2.to_date >= '1998-01-01'
-- )
-- GROUP BY month
-- ORDER BY month;



SELECT
    DATE_FORMAT(salaries.from_date, '%Y-%m') as mes,
    ROUND(
        (AVG(CASE WHEN employees.gender = 'M' THEN salaries.salary END) 
        - AVG(CASE WHEN employees.gender = 'F' THEN salaries.salary END)) 
        / AVG(CASE WHEN employees.gender = 'M' THEN salaries.salary END) * 100, 2
    ) AS Brecha_Salarial
FROM (
    SELECT DATE_FORMAT(salaries.from_date, '%Y-%m') AS mes
    FROM salaries
    WHERE salaries.from_date <= '2023-01-31' 
      AND salaries.to_date >= '2022-02-01'
) AS meses
LEFT JOIN salaries ON DATE_FORMAT(salaries.from_date, '%Y-%m') = meses.mes
LEFT JOIN employees ON salaries.emp_no = employees.emp_no
WHERE salaries.from_date <= '2023-01-31' 
  AND salaries.to_date >= '2022-02-01'
GROUP BY mes
ORDER BY mes ASC;








SELECT
    mes,
    ROUND(
        (AVG(CASE WHEN employees.gender = 'M' THEN salaries.salary END) 
        - AVG(CASE WHEN employees.gender = 'F' THEN salaries.salary END)) 
        / AVG(CASE WHEN employees.gender = 'M' THEN salaries.salary END) * 100, 2
    ) AS Brecha_Salarial
FROM (
    SELECT DATE_FORMAT(salaries.from_date, '%Y-%m') AS mes
    FROM salaries
    WHERE salaries.from_date <= '2023-01-31' 
      AND salaries.to_date >= '2022-02-01'
) AS meses
LEFT JOIN salaries ON DATE_FORMAT(salaries.from_date, '%Y-%m') = meses.mes
LEFT JOIN employees ON salaries.emp_no = employees.emp_no
WHERE salaries.from_date <= '2023-01-31' 
  AND salaries.to_date >= '2022-02-01'
GROUP BY mes
ORDER BY mes ASC;


