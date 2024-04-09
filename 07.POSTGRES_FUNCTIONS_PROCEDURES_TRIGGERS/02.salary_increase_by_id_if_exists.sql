CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(id INT)
LANGUAGE plpgsql
AS
$$
        BEGIN
            IF EXISTS (SELECT salary
                FROM employees
                WHERE employee_id = id) THEN
            UPDATE employees
                SET salary = salary * 1.05
                WHERE id = employee_id;
            COMMIT;
            ELSE
                ROLLBACK;
            END IF;
        END;
  $$;

CALL sp_increase_salary_by_id(2);
---
DROP procedure sp_increase_salary_by_id;
CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(id INT)
LANGUAGE plpgsql
AS
$$
DECLARE current_employee_id INT;
        BEGIN
		current_employee_id := (SELECT employee_id FROM employees WHERE id = employee_id);
				
            IF current_employee_id IS NULL THEN
                ROLLBACK;
            ELSE
                UPDATE employees
                SET salary = salary * 1.05
                WHERE id = employee_id;
            END IF;
        END;
  $$;

CALL sp_increase_salary_by_id(2);


--to increase the salary by 5% by a given id
CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(id INT)
LANGUAGE plpgsql;
AS $$
BEGIN
    -- Check if the employee with the given id exists
    IF EXISTS(SELECT 1 FROM employees WHERE employee_id = id) THEN
        -- Update the salary by increasing it by 5%
        UPDATE employees
        SET salary = salary * 1.05
        WHERE employee_id = id;

        -- Commit the transaction
        COMMIT;
        
        -- Print a message indicating successful salary increase
        RAISE NOTICE 'Salary increased by 5%% for employee with ID %', id;
    ELSE
        -- If employee_id is not found, raise an exception or handle accordingly
        RAISE EXCEPTION 'Employee with ID % not found', id;
    END IF;
END;
$$;

CALL sp_increase_salary_by_id(2);
