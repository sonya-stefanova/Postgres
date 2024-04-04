SELECT
	CONCAT (first_name, ' ', last_name) as full_name,
	job_title,
	salary
FROM employees
WHERE salary IN (12500, 14000, 23600) OR salary = 25000
ORDER BY salary DESC;