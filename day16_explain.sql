-- DAY 16: EXPLAIN & ANALYZE examples using users and posts

-- 1️⃣ Basic EXPLAIN: shows planned query steps without running
EXPLAIN SELECT * FROM posts WHERE is_published = true;

-- 2️⃣ EXPLAIN ANALYZE: runs query and shows real execution time and row counts
EXPLAIN ANALYZE
SELECT * FROM posts WHERE is_published = true;

-- 3️⃣ EXPLAIN with JOIN
EXPLAIN ANALYZE
SELECT p.title, u.name
FROM posts p
JOIN users u ON p.user_id = u.id
WHERE p.is_published = true;

-- 4️⃣ EXPLAIN with INDEX usage (make sure indexes exist, e.g., on is_published)
EXPLAIN ANALYZE
SELECT * FROM posts WHERE tags @> ARRAY['demo'];

-- 5️⃣ EXPLAIN ANALYZE with aggregates
EXPLAIN ANALYZE
SELECT user_id, COUNT(*) AS post_count
FROM posts
GROUP BY user_id
ORDER BY post_count DESC;
