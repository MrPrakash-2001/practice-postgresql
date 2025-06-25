-- ✅ ADDING a new column to users table
ALTER TABLE users
ADD COLUMN phone_number VARCHAR(15);

-- ✅ RENAME a column
ALTER TABLE users
RENAME COLUMN phone_number TO mobile_number;

-- ✅ SET DEFAULT value to existing column
ALTER TABLE users
ALTER COLUMN is_active SET DEFAULT true;

-- ✅ DROP a column
ALTER TABLE users
DROP COLUMN last_login;

-- ✅ RENAME a table
ALTER TABLE posts
RENAME TO blog_posts;

-- ✅ RENAME it back for continuity
ALTER TABLE blog_posts
RENAME TO posts;

-- ✅ DROP a table completely
DROP TABLE IF EXISTS temp_data;

-- ✅ CREATE a temporary table and TRUNCATE it
CREATE TEMP TABLE temp_data(
    id SERIAL PRIMARY KEY,
    info TEXT
);

INSERT INTO temp_data(info) VALUES ('Test1'), ('Test2'), ('Test3');

-- View the data before truncate
SELECT * FROM temp_data;

-- ✅ TRUNCATE (fast delete all)
TRUNCATE TABLE temp_data;

-- Confirm it's empty
SELECT * FROM temp_data;
