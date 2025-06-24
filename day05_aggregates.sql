-- 1. Count how many posts each user has
SELECT u.name, COUNT(p.id) AS total_posts
FROM users u
LEFT JOIN posts p ON u.id = p.user_id
GROUP BY u.id;

-- 2. Count how many published vs. unpublished posts
SELECT is_published, COUNT(*) AS count
FROM posts
GROUP BY is_published;

-- 3. Average word count (from metadata) per user
SELECT u.name, AVG((p.metadata ->> 'word_count')::INT) AS avg_words
FROM users u
JOIN posts p ON u.id = p.user_id
GROUP BY u.id;

-- 4. Total posts per user having more than 1 post
SELECT u.name, COUNT(p.id) AS post_count
FROM users u
JOIN posts p ON u.id = p.user_id
GROUP BY u.id
HAVING COUNT(p.id) > 1;

-- 5. Max and Min word count among all posts
SELECT 
    MAX((metadata ->> 'word_count')::INT) AS max_words,
    MIN((metadata ->> 'word_count')::INT) AS min_words
FROM posts;

-- 6. Count posts per tag using UNNEST
SELECT tag, COUNT(*) AS tag_count
FROM (
    SELECT UNNEST(tags) AS tag
    FROM posts
) AS t
GROUP BY tag
ORDER BY tag_count DESC;
