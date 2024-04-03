SELECT username, COUNT(*)::int AS likes_num
FROM users
JOIN likes ON likes.user_id=users.id
GROUP BY username
ORDER BY likes_num DESC
LIMIT 10;