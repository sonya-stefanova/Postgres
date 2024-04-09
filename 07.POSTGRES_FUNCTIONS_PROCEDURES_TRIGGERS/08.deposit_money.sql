CREATE OR REPLACE PROCEDURE sp_deposit_money(
    account_id INT,
    money_amount NUMERIC
)
$$
BEGIN
	UPDATE accounts
	SET balance = balance + amount_money
	WHERE account_id = id;
    
END;
$$
LANGUAGE plpgsql;