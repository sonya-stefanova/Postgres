-- 04. GAME OVER
-- Aim: create a PostgreSQL function to return the difficulty level;
-- RETURN: 
--	if "level" is less than or equal to 40, the "difficulty_level" is "Normal Difficulty";
--	if "level" is between 41 and 60 (inclusive), the "difficulty_level" is "Nightmare Difficulty";--
--if "level" is greater than 60, the "difficulty_level" is "Hell Difficulty".

-- JUDGE test url: https://judge.softuni.org/Contests/Practice/Index/4113#4

CREATE OR REPLACE FUNCTION fn_difficulty_level(
    IN level INT,
    OUT difficulty_level VARCHAR
) AS
$$
BEGIN
    IF level <= 40 THEN
        difficulty_level := 'Normal Difficulty';
    ELSIF level BETWEEN 41 AND 60 THEN
        difficulty_level := 'Nightmare Difficulty';
    ELSE
        difficulty_level := 'Hell Difficulty';
    END IF;
END
$$
    LANGUAGE plpgsql;

SELECT user_id,
       level,
       cash,
       fn_difficulty_level(level)
FROM users_games
ORDER BY user_id;


