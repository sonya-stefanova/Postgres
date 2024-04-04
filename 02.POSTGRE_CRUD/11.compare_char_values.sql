SELECT name, start_date
FROM projects
WHERE "name" IN ('Mountain', 'Road') or name = 'Touring'
LIMIT 20;