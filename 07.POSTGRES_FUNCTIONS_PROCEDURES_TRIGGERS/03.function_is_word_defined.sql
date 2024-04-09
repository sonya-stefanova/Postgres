-- 02. User-defined Function Future Value
-- Aim: check if a word is composed of a given set of letters. 
-- RETURN: true if the word can be formed from the set of letters, and false otherwise.
-- JUDGE test url: https://judge.softuni.org/Contests/Compete/Index/4113#1

CREATE OR REPLACE FUNCTION fn_is_word_comprised(
    set_of_letters VARCHAR(50), 
	word VARCHAR(50)
) RETURNS BOOLEAN AS
$$
BEGIN
--     REGEXP_MATCHES(set_of_letters, pattern [, flags])
	RETURN TRIM(LOWER(word), LOWER(set_of_letters))='';
END
$$
LANGUAGE plpgsql;

--
-- Tests in Judge:	
--
-- SELECT * FROM fn_is_word_comprised('ois tmiah%f', 'halves');
-- SELECT * FROM fn_is_word_comprised('ois tmiah%f', 'Sofia');
SELECT * FROM fn_is_word_comprised('bobr', 'Rob');
-- fn_is_word_comprised('papopep', 'toe');


--SOLUTION USING A FOR CYCLE:
CREATE OR REPLACE FUNCTION fn_is_word_comprised(
    set_of_letters VARCHAR(50),
    word VARCHAR(50)
)
    RETURNS BOOLEAN AS
$$
DECLARE
    idx    INT;
    letter VARCHAR;
BEGIN
    FOR idx IN 1..length(word)
        LOOP
            letter := substring(LOWER(word), idx, 1);
            IF position(letter IN LOWER(set_of_letters)) = 0 THEN RETURN FALSE;
            END IF;
        END LOOP;

    RETURN TRUE;
END;
$$
    LANGUAGE plpgsql;
