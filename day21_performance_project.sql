-- Day 21: Performance Project

-- 1. Create some test data (simulate 10,000 users and 100,000 posts)

-- Insert users
INSERT INTO users (name, username, email, password)
SELECT
  'User_' || s,
  'user_' || s,
  'user_' || s || '@gmail.com',
  'password_' || s
FROM generate_series(1, 10000) s;

-- Insert posts with random user_id, tags, and metadata
INSERT INTO posts (user_id, title, content, tags, metadata, is_published, created_at)
SELECT
  (SELECT id FROM users OFFSET floor(random() * 10000) LIMIT 1),
  'Post title ' || s,
  'Content for post ' || s,
  ARRAY['tag' || (1 + (random()*10))::int, 'tag' || (1 + (random()*10))::int],
  jsonb_build_object('word_count', (random()*1000)::int, 'category', 'blog'),
  (random() > 0.5),
  NOW() - (random() * INTERVAL '365 days')
FROM generate_series(1, 100000) s;

-- 2. Run some complex queries with EXPLAIN ANALYZE and optimize

-- Example: Count posts per user with published filter
EXPLAIN ANALYZE
SELECT user_id, COUNT(*) AS published_count
FROM posts
WHERE is_published = true
GROUP BY user_id
ORDER BY published_count DESC
LIMIT 10;   

-- 3. Try adding indexes if needed and re-run queries

-- For example, create an index on is_published and user_id
CREATE INDEX idx_posts_user_published ON posts(user_id, is_published);

-- Re-run EXPLAIN ANALYZE and compare

-- 4. Experiment with partition pruning by adding partitions on created_at if not done

-- 5. Run maintenance commands post bulk insert

VACUUM ANALYZE;
