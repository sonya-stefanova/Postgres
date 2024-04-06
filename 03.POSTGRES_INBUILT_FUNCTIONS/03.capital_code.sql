-- SELECT 
-- 	*, 
-- 	SUBSTRING(capital, 1, 2) AS capital_code
-- FROM countries;

ALTER TABLE countries
ADD COLUMN capital_code CHAR(2);

UPDATE countries
SET capital_code = SUBSTRING(capital, 1, 2);
