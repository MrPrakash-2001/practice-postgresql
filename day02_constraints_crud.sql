-- Day 2: Add Constraints + Perform CRUD operations

-- ========================
-- Add Constraints to users table
-- ========================

-- Enforce password minimum length (>= 8 characters)
ALTER TABLE users
ADD CONSTRAINT chk_password_length CHECK (char_length(password) >= 8);

-- Enforce email domain (must end with @gmail.com)
ALTER TABLE users
ADD CONSTRAINT chk_email_domain CHECK (email LIKE '%@gmail.com');

-- ========================
-- Insert new valid users
-- ========================

INSERT INTO users(name, username, email, password)
VALUES 
  ('User 1', 'user1', 'user1@gmail.com', 'User1@001'),
  ('User 2', 'user2', 'user2@gmail.com', 'User2@001');


-- ========================
-- INSERT posts for new users
-- ========================

INSERT INTO posts(user_id, title, content, tags, metadata)
VALUES (
  (SELECT id FROM users WHERE username = 'user1'),
  'User 1 Post',
  'This is User 1''s first post',
  ARRAY['intro', 'alice'],
  '{"word_count": 100}'
);

-- ========================
-- UPDATE Example
-- ========================

-- Update email of Bob
UPDATE users
SET email = 'newuser1@gmail.com'
WHERE username = 'user1';

-- Should fail due to domain constraint
-- UPDATE users SET email = 'bob@evil.com' WHERE username = 'bob';

-- ========================
-- DELETE Example
-- ========================

-- Delete Alice
DELETE FROM users
WHERE username = 'user1';

-- Alice's post should be deleted automatically (ON DELETE CASCADE)

-- ========================
-- Verify Remaining Data
-- ========================
SELECT * FROM users;
SELECT * FROM posts;
