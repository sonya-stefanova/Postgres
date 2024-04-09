CREATE OR REPLACE FUNCTION fn_count_employees_by_town(
	town_name VARCHAR(20)
) RETURNS INTEGER AS
$$
DECLARE 
	employees_counter INTEGER;
BEGIN
    RETURN (SELECT COUNT(*)
            FROM employees e
                     JOIN addresses a USING (address_id)
                     JOIN towns t USING (town_id)
            WHERE t.name = town_name);
END
$$

LANGUAGE plpgsql;