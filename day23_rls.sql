-- Day 23: Row-Level Security (RLS) example

-- 1️⃣ Enable RLS on users table
ALTER TABLE posts ENABLE ROW LEVEL SECURITY;

-- 2️⃣ Create policy to allow users to see only their own posts

CREATE POLICY user_posts_policy ON posts
    FOR SELECT USING (user_id = current_setting('app.current_user_id')::uuid);

-- 3️⃣ Set current user id for testing (simulating application context)
SELECT set_config('app.current_user_id', 'your-uuid-here', false);

-- 4️⃣ Test select as different users
-- For example, as user with id 'your-uuid-here', only posts with user_id matching will be visible

-- 5️⃣ Optional: Create INSERT, UPDATE policies similarly to control modifications

-- Example for INSERT:
CREATE POLICY insert_own_posts ON posts
    FOR INSERT WITH CHECK (user_id = current_setting('app.current_user_id')::uuid);
