UPDATE countries
SET iso_code =  UPPER(SUBSTRING(country_name, 1, 3))
WHERE iso_code IS NULL;
-- SELECT iso_code from countries;