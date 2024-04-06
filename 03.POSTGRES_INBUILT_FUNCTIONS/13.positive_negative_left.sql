SELECT 
	peak_name,
	left(peak_name, 4) AS positive_left, 
	left(peak_name, -4)AS negative_left
FROM peaks;SELECT 
	peak_name,
	RIGHT(peak_name, 4) AS positive_right, 
	RIGHT(peak_name, -4)AS negative_right
FROM peaks;