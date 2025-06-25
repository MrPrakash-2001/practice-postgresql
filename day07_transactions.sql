-- Start a transaction manually
BEGIN;

-- Insert into users
INSERT INTO users(name, username, email, password)
VALUES('Alice', 'alice01', 'alice@example.com', 'securePass123');

-- Insert a post (linked to previous insert)
INSERT INTO posts(user_id, title, content, tags, metadata)
VALUES(
    (SELECT id FROM users WHERE username = 'alice01'),
    'Transaction Post',
    'This post was added inside a transaction',
    ARRAY['transaction', 'test'],
    '{"word_count": 100}'
);

-- Commit the transaction
COMMIT;

-- ❌ Now simulate an error to demonstrate rollback
BEGIN;

-- First insert is fine
INSERT INTO users(name, username, email, password)
VALUES('Bob', 'bob01', 'bob@example.com', 'strongPassword');

-- Second insert will fail (invalid column to simulate error)
INSERT INTO posts(user_id, title, content, tags, metadata, invalid_column)
VALUES(
    (SELECT id FROM users WHERE username = 'bob01'),
    'Rollback Post',
    'This will fail',
    ARRAY['fail'],
    '{"word_count": 50}',
    'oops'
);

-- This rollback will undo both inserts
ROLLBACK;

-- ✅ Use SAVEPOINT
BEGIN;

-- Insert into users
INSERT INTO users(name, username, email, password)
VALUES('Charlie', 'charlie01', 'charlie@example.com', 'pass123');

SAVEPOINT before_post;

-- Simulate post failure
INSERT INTO posts(user_id, title, content, tags, metadata, invalid_column)
VALUES(
    (SELECT id FROM users WHERE username = 'charlie01'),
    'Savepoint Post',
    'Should fail',
    ARRAY['savepoint'],
    '{"word_count": 20}',
    'oops'
);

-- Rollback only to savepoint
ROLLBACK TO SAVEPOINT before_post;

-- Commit user insert only
COMMIT;

-- Check users
SELECT * FROM users WHERE username IN ('alice01', 'bob01', 'charlie01');
