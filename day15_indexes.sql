-- DAY 15: Indexes on posts and users tables

-- 1️⃣ B-Tree index on users.email for fast lookup
CREATE INDEX idx_users_email ON users(email);

-- 2️⃣ B-Tree index on posts.created_at for sorting
CREATE INDEX idx_posts_created_at ON posts(created_at);

-- 3️⃣ GIN index on posts.tags array for fast tag searches
CREATE INDEX idx_posts_tags_gin ON posts USING gin(tags);

-- 4️⃣ GIN index on posts.metadata JSONB for searching keys/values
CREATE INDEX idx_posts_metadata_gin ON posts USING gin(metadata);

-- 5️⃣ Partial index on posts for only published posts
CREATE INDEX idx_posts_published ON posts(created_at)
WHERE is_published = true;

-- Test query examples:

-- Search user by email
-- EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'prakash@gmail.com';

-- Find posts tagged 'demo'
-- EXPLAIN ANALYZE SELECT * FROM posts WHERE tags @> ARRAY['demo'];

-- Find recent published posts
-- EXPLAIN ANALYZE SELECT * FROM posts WHERE is_published = true ORDER BY created_at DESC;
