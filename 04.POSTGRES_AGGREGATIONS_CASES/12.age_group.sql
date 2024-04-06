SELECT 
	CASE 
	WHEN age between 0 AND 10 THEN '[0-10]'
	WHEN age between 11 AND 20 THEN '[11-20]'
	WHEN age between 21 AND 30 THEN '[21-30]'
	WHEN age between 31 AND 40 THEN '[31-40]'
	WHEN age between 41 AND 50 THEN '[41-50]'
	WHEN age between 51 AND 60 THEN '[51-60]'
	WHEN age > 60 THEN '[61+]'
	END AS age_group,
	COUNT(age)
FROM wizard_deposits
GROUP BY age_group
ORDER BY age_group ASC;
