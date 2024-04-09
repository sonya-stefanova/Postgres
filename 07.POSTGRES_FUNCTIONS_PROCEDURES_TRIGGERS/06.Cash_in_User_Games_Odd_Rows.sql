CREATE OR REPLACE FUNCTION fn_cash_in_users_games(
    game_name VARCHAR(50)
) RETURNS TABLE (total_cash NUMERIC) AS
$$
BEGIN
    RETURN QUERY
        SELECT round(SUM(cash)::numeric, 2)
        FROM (SELECT 
				  cash,
			  		ROW_NUMBER() OVER (ORDER BY ug.cash DESC) AS row_num
              FROM users_games ug
              JOIN games g ON ug.game_id = g.id
              WHERE g.name = game_name) subquery
        WHERE mod(row_num, 2) = 1;

END
$$
LANGUAGE plpgsql;

-- Another solution with subquery packed with WITH
CREATE OR REPLACE FUNCTION fn_cash_in_users_games (
	game_name VARCHAR(50)
) RETURNS TABLE (
	total_cash NUMERIC
) 
AS
$$
BEGIN
	RETURN QUERY
    
	WITH ranked_games AS (
		SELECT
			cash,
			ROW_NUMBER() OVER (ORDER BY cash DESC) AS row_num
		FROM
			users_games AS ug
		JOIN 
			games AS g
		ON 
			ug.game_id = g.id
		WHERE g.name = game_name
	)
	
	SELECT 
		ROUND(SUM(cash), 2) AS total_cash
	FROM 
		ranked_games
	WHERE 
		row_num  % 2 <> 0;
END;
$$
LANGUAGE plpgsql;