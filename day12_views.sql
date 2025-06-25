-- ==============================================
-- 🧠 Day 12: Views & Materialized Views
-- ==============================================

-- 🔹 VIEW 1: Published Posts with User Information
CREATE OR REPLACE VIEW published_posts_with_user AS
SELECT 
    p.id AS post_id,
    p.title,
    p.content,
    p.tags,
    u.username,
    u.email,
    p.created_at
FROM posts p
JOIN users u ON p.user_id = u.id
WHERE p.is_published = true;

-- ✅ Test:
-- SELECT * FROM published_posts_with_user;



-- 🔹 VIEW 2: Users and Their Referral Counts
-- Assumes a self-referencing foreign key `referred_by` in users table.
-- Uncomment below line if `referred_by` doesn't exist:
-- ALTER TABLE users ADD COLUMN referred_by UUID REFERENCES users(id);

CREATE OR REPLACE VIEW user_referral_counts AS
SELECT 
    u.id,
    u.username,
    COUNT(r.id) AS total_referrals
FROM users u
LEFT JOIN users r ON r.referred_by = u.id
GROUP BY u.id, u.username;

-- ✅ Test:
-- SELECT * FROM user_referral_counts;



-- 🔹 VIEW 3: Posts with Metadata Filtered by Category
-- Assumes "category" is a key in metadata JSONB
CREATE OR REPLACE VIEW blog_posts_metadata AS
SELECT 
    p.id,
    p.title,
    p.metadata,
    p.metadata->>'category' AS category,
    u.username
FROM posts p
JOIN users u ON p.user_id = u.id
WHERE p.metadata->>'category' = 'blog';

-- ✅ Test:
-- SELECT * FROM blog_posts_metadata;



-- 🔹 MATERIALIZED VIEW: Tag Usage Count
CREATE MATERIALIZED VIEW tag_usage_counts AS
SELECT 
    tag,
    COUNT(*) AS usage_count
FROM posts,
     UNNEST(tags) AS tag
GROUP BY tag
ORDER BY usage_count DESC;

-- ✅ Test:
-- SELECT * FROM tag_usage_counts;

-- 🔄 Refresh manually when data changes
-- REFRESH MATERIALIZED VIEW tag_usage_counts;



-- 🧹 Clean up (Optional)
-- DROP VIEW IF EXISTS published_posts_with_user;
-- DROP VIEW IF EXISTS user_referral_counts;
-- DROP VIEW IF EXISTS blog_posts_metadata;
-- DROP MATERIALIZED VIEW IF EXISTS tag_usage_counts;
