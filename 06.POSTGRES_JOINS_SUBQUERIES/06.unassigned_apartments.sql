SELECT 
	booking_id, 
	apartment_id,
	companion_full_name
FROM customers
JOIN bookings USING (customer_id)
WHERE apartment_id is NULL  