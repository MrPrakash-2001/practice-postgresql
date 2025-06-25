-- 1. Get all users who have at least one post
SELECT name
FROM users
WHERE EXISTS (
    SELECT 1
    FROM posts
    WHERE posts.user_id = users.id
);

-- 2. Get users who have never posted anything
SELECT name
FROM users
WHERE NOT EXISTS (
    SELECT 1
    FROM posts
    WHERE posts.user_id = users.id
);

-- 3. Find posts where word_count > average word count (scalar subquery)
SELECT *
FROM posts
WHERE (metadata ->> 'word_count')::INT >
      (SELECT AVG((metadata ->> 'word_count')::INT) FROM posts);

-- 4. Get users and their post count using subquery in SELECT
SELECT 
    u.name,
    (SELECT COUNT(*) FROM posts p WHERE p.user_id = u.id) AS post_count
FROM users u;

-- 5. Correlated subquery: List each post with how many other posts the user has
SELECT 
    p.title,
    p.user_id,
    (SELECT COUNT(*) FROM posts p2 WHERE p2.user_id = p.user_id) AS total_user_posts
FROM posts p;

-- 6. Get all tags used in posts by users who have more than 1 post (subquery in FROM)
SELECT DISTINCT t.tag
FROM (
    SELECT UNNEST(tags) AS tag, user_id
    FROM posts
) AS t
WHERE t.user_id IN (
    SELECT user_id
    FROM posts
    GROUP BY user_id
    HAVING COUNT(*) > 1
);
