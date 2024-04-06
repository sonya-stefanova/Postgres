SELECT 
	TRIM(LEADING 'M' FROM peak_name) as "left_trim",
	TRIM(TRAILING 'm' FROM peak_name) as "right_trim"
FROM
	peaks;