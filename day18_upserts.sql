-- Day 18: UPSERT examples with ON CONFLICT

-- Make sure email is UNIQUE in users
-- (already defined in your schema)

-- 1️⃣ Insert a new user – succeeds if email is new
INSERT INTO users(name, username, email, password)
VALUES('Prakash Update', 'prakashu', 'prakash@gmail.com', 'newpassword')
ON CONFLICT(email) DO NOTHING;

-- 2️⃣ Try to insert same email – will update name and username
INSERT INTO users(name, username, email, password)
VALUES('Updated Name', 'updated_username', 'prakash@gmail.com', 'newpass')
ON CONFLICT(email) DO UPDATE
SET
  name = EXCLUDED.name,
  username = EXCLUDED.username,
  password = EXCLUDED.password,
  updated_at = NOW();

-- 3️⃣ Insert a post and update if same ID already exists
-- Simulate by reusing the same ID manually

-- First generate a UUID to reuse
SELECT gen_random_uuid(); -- Copy this UUID for next step

-- Example:
INSERT INTO posts(id, user_id, title, content, tags, metadata)
VALUES(
  'PASTE_UUID_HERE',
  (SELECT id FROM users WHERE email = 'prakash@gmail.com'),
  'Upsert Post Title',
  'Some content here...',
  ARRAY['upsert', 'conflict'],
  '{"note": "first insert"}'
)
ON CONFLICT(id) DO UPDATE
SET
  title = EXCLUDED.title,
  content = EXCLUDED.content,
  metadata = EXCLUDED.metadata,
  created_at = NOW();
