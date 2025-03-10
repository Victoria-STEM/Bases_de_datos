USE employees;

SELECT DISTINCT s.emp_no, d.dept_name
FROM salaries s
JOIN dept_manager dm ON s.emp_no = dm.emp_no
AND s.from_date BETWEEN dm.from_date AND dm.to_date
JOIN departments d ON dm.dept_no = d.dept_no
WHERE s.from_date BETWEEN DATE_SUB('1989-02-01', INTERVAL 12 MONTH) AND '1989-02-01';