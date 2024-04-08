SELECT 
	b.booking_id,
	b.starts_at::DATE,
	b.apartment_id,
	CONCAT_WS (' ', c.first_name, c.last_name) AS "Customer Name"
FROM bookings AS b
RIGHT JOIN customers AS c
USING (customer_id)
ORDER BY CONCAT_WS (' ', c.first_name, c.last_name)
LIMIT 10;