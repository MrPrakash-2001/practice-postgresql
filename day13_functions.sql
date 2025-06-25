-- Day 13: PostgreSQL Functions (plpgsql)

-- 1️⃣ Function to get user summary by username
CREATE OR REPLACE FUNCTION get_user_summary(p_username TEXT)
RETURNS TABLE(name TEXT, email TEXT) AS $$
BEGIN
  RETURN QUERY
  SELECT u.name, u.email
  FROM users u
  WHERE u.username = p_username;
END;
$$ LANGUAGE plpgsql;


-- 2️⃣ Function to count posts by a given user ID
CREATE OR REPLACE FUNCTION count_posts_by_user(p_user_id UUID)
RETURNS INTEGER AS $$
DECLARE
  post_count INTEGER;
BEGIN
  SELECT COUNT(*) INTO post_count
  FROM posts
  WHERE user_id = p_user_id;

  RETURN post_count;
END;
$$ LANGUAGE plpgsql;


-- 3️⃣ Function to toggle post visibility (is_published)
CREATE OR REPLACE FUNCTION toggle_post_visibility(p_post_id UUID)
RETURNS VOID AS $$
BEGIN
  UPDATE posts
  SET is_published = NOT is_published
  WHERE id = p_post_id;
END;
$$ LANGUAGE plpgsql;


-- 4️⃣ Function to create a new post with default metadata
CREATE OR REPLACE FUNCTION create_simple_post(
  p_user_id UUID,
  p_title TEXT,
  p_content TEXT DEFAULT ''
)
RETURNS UUID AS $$
DECLARE
  new_post_id UUID;
BEGIN
  INSERT INTO posts(user_id, title, content, tags, metadata)
  VALUES(p_user_id, p_title, p_content, ARRAY[]::TEXT[], '{"source":"function"}'::JSONB)
  RETURNING id INTO new_post_id;

  RETURN new_post_id;
END;
$$ LANGUAGE plpgsql;


-- 🔍 Function Usage Examples:

-- Get user summary
-- SELECT * FROM get_user_summary('prakash');

-- Count posts by user
-- SELECT count_posts_by_user((SELECT id FROM users WHERE username = 'prakash'));

-- Toggle post visibility
-- SELECT toggle_post_visibility((SELECT id FROM posts LIMIT 1));

-- Create a simple post
-- SELECT create_simple_post((SELECT id FROM users WHERE username = 'prakash'), 'Post from Function');
