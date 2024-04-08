SELECT MIN(ava) AS min_average_area
FROM (
	SELECT
		AVG(area_in_sq_km) AS ava
	FROM 
		countries
	GROUP BY 
		continent_code
) AS average_area;