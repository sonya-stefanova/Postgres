-- 02. User-defined Function Future Value
-- JUDGE test url: https://judge.softuni.org/Contests/Compete/Index/4113#1

CREATE OR REPLACE FUNCTION fn_calculate_future_value(
    IN initial_sum DECIMAL,
    IN interest_rate_per_year DECIMAL,
    IN maturity INT,
    OUT future_value DECIMAL
) AS
$$
BEGIN
    future_value := TRUNC(initial_sum * power(1 + interest_rate_per_year, maturity), 4);
END
$$
    LANGUAGE plpgsql;

--Test with the following Select statement
SELECT fn_calculate_future_value(1000, 0.1, 5);
