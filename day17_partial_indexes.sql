-- Day 17: Covering and Partial Indexes examples

-- 1️⃣ Create a covering index on posts (includes is_published and created_at)
CREATE INDEX idx_posts_covering
ON posts (is_published)
INCLUDE (created_at);

-- 2️⃣ Partial index on posts for unpublished posts ordered by creation date
CREATE INDEX idx_posts_unpublished_partial
ON posts (created_at)
WHERE is_published = false;

-- Test queries to utilize indexes:

-- Should use covering index, no heap fetch
EXPLAIN ANALYZE
SELECT is_published, created_at
FROM posts
WHERE is_published = true;

-- Should use partial index for unpublished posts
EXPLAIN ANALYZE
SELECT *
FROM posts
WHERE is_published = false
ORDER BY created_at DESC;
