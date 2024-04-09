-- 04. GAME OVER
-- Aim: create a PostgreSQL function to query the status of the ongoing games
-- RETURN: 
--	The function should return a table with three columns: "name" of the game (VARCHAR(50)), "game_type_id" (INT), and "is_finished" (BOOLEAN);
--	The function should retrieve all the rows from the "games" table where the "is_finished" column matches the "is_game_over" parameter. 

-- JUDGE test url: https://judge.softuni.org/Contests/Practice/Index/4113#3

CREATE OR REPLACE FUNCTION fn_is_game_over (
	is_game_over BOOLEAN
) RETURNS TABLE (
	name VARCHAR(50),
	game_type_id INT,
	is_finished BOOLEAN
) 
AS 
$$
BEGIN
	RETURN QUERY 
	SELECT 
		g.name,
		g.game_type_id,
		g.is_finished
	FROM 
		games AS g
	WHERE 
		g.is_finished = is_game_over;
END;
$$
LANGUAGE plpgsql;

--
-- Tests in Judge:	
--
SELECT * FROM fn_is_game_over(true);
