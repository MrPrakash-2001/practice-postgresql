-- 👀 Get All Users
SELECT * FROM users;

-- 🎯 Projection: Only name and email
SELECT name, email FROM users;

-- 🔍 WHERE clause: Find user by email
SELECT * FROM users
WHERE email = 'prakash@gmail.com';

-- 🧮 WHERE with multiple conditions
SELECT * FROM users
WHERE is_active = true AND email LIKE '%@gmail.com';

-- ❌ NOT operator
SELECT * FROM users
WHERE NOT is_active;

-- 📦 Filtering posts with tags
SELECT * FROM posts
WHERE 'demo' = ANY(tags);

-- 🔢 Order by created_at (latest first)
SELECT * FROM posts
ORDER BY created_at DESC;

-- ⬇️ Limit results
SELECT * FROM users
ORDER BY created_at DESC
LIMIT 3;

-- ⏭️ Pagination (page 2, 3 results per page)
SELECT * FROM posts
ORDER BY created_at DESC
LIMIT 3 OFFSET 3;

-- 🔘 Use DISTINCT to remove duplicates
SELECT DISTINCT email FROM users;

-- 📊 Count users
SELECT COUNT(*) AS total_users FROM users;
