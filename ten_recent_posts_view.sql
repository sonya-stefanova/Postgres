-- CREATE VIEW ten_recent_posts AS (
-- 	SELECT *
-- 	FROM posts
-- 	ORDER BY created_at DESC
-- 	LIMIT 10
-- );



-- CREATE OR REPLACE VIEW ten_recent_posts AS (
-- 	SELECT *
-- 	FROM posts
-- 	ORDER BY created_at ASC
-- 	LIMIT 10
-- );

-- SELECT * FROM ten_recent_posts;

DROP VIEW ten_recent_posts;