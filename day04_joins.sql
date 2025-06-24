-- Reuse users and posts table from previous days

-- 1. INNER JOIN: Only users with posts
SELECT u.id AS user_id, u.name, p.title
FROM users u
INNER JOIN posts p ON u.id = p.user_id;

-- 2. LEFT JOIN: All users, even if they don't have posts
SELECT u.id AS user_id, u.name, p.title
FROM users u
LEFT JOIN posts p ON u.id = p.user_id;

-- 3. RIGHT JOIN: All posts, even if the user is missing
SELECT u.id AS user_id, u.name, p.title
FROM users u
RIGHT JOIN posts p ON u.id = p.user_id;

-- 4. FULL OUTER JOIN: All users and all posts
SELECT u.id AS user_id, u.name, p.title
FROM users u
FULL OUTER JOIN posts p ON u.id = p.user_id;

-- 5. Detect users without posts
SELECT u.*
FROM users u
LEFT JOIN posts p ON u.id = p.user_id
WHERE p.id IS NULL;

-- 6. Detect orphaned posts (posts without a valid user, if foreign key were optional)
SELECT p.*
FROM posts p
LEFT JOIN users u ON p.user_id = u.id
WHERE u.id IS NULL;
