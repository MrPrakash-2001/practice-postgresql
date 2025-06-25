-- ✅ Add a JSONB column to posts for more metadata
ALTER TABLE posts
ADD COLUMN analytics JSONB;

-- ✅ Update a post with JSONB data
UPDATE posts
SET analytics = '{
  "views": 1200,
  "likes": 130,
  "shares": {
    "facebook": 20,
    "twitter": 15
  }
}'
WHERE title = 'Demo Upload';

-- ✅ Basic JSONB select
SELECT
  title,
  analytics->'shares' AS share_data,
  analytics->>'likes' AS total_likes
FROM posts;

-- ✅ Filter posts by number of views
SELECT *
FROM posts
WHERE (analytics->>'views')::int > 1000;

-- ✅ Use @> to check for containment
SELECT *
FROM posts
WHERE analytics @> '{"likes": 130}';

-- ✅ Update a specific JSONB key using jsonb_set
UPDATE posts
SET analytics = jsonb_set(analytics, '{views}', '1500', false)
WHERE title = 'Demo Upload';

-- ✅ Remove a key from JSONB
UPDATE posts
SET analytics = analytics - 'shares'
WHERE title = 'Demo Upload';
