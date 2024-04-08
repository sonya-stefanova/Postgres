-- 19. Continents and Currencies
/*Write a SQL query to create a view called "continent_currency_usage" that shows the "continent_code", "currency_code", and a number of countries using the currency where more than one country on a continent uses the same currency. The column displaying the number of countries using the currency should be renamed as "currency_usage". The data should be ordered by the "currency_usage" column in descending order. 
*** Hint, to solve this problem, you should use a subquery with a SELECT statement that includes the DENSE RANK() function to assign a rank to each row within a partition of the result set. You will need to use the GROUP BY clause to group the results by continent and currency, and the HAVING clause to filter the results to only include those where multiple countries are using the same currency.
*/

CREATE VIEW continent_currency_usage AS
SELECT c.continent_code,
       c.currency_code,
       COUNT(*) AS currency_usage
FROM countries c
GROUP BY c.continent_code,
         c.currency_code
HAVING COUNT(*) > 1
   AND COUNT(*) =
       (SELECT COUNT(*) AS most_used_curr
        FROM countries c2
        WHERE c2.continent_code = c.continent_code
        GROUP BY c2.currency_code
        ORDER BY most_used_curr DESC
        LIMIT 1)
ORDER BY currency_usage DESC, c.continent_code;