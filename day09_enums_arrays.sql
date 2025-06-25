-- ✅ ENUM type definition
CREATE TYPE user_role AS ENUM ('admin', 'editor', 'viewer');

-- ✅ Add ENUM column to users table
ALTER TABLE users
ADD COLUMN role user_role DEFAULT 'viewer';

-- ✅ Insert users with different roles
INSERT INTO users(name, username, email, password, role)
VALUES
('Admin User', 'admin', 'admin@example.com', 'admin@123', 'admin'),
('Editor User', 'editor1', 'editor@example.com', 'editor@123', 'editor');

-- ✅ ARRAY example: Update existing posts to add multiple tags
UPDATE posts
SET tags = ARRAY['postgresql', 'day9', 'array_example']
WHERE title = 'Demo Upload';

-- ✅ Query using ARRAY: Get posts tagged with 'postgresql'
SELECT * FROM posts
WHERE 'postgresql' = ANY(tags);

-- ✅ COMPOSITE TYPE definition
CREATE TYPE address_type AS (
    street TEXT,
    city TEXT,
    zip_code TEXT
);

-- ✅ Add composite column to users table
ALTER TABLE users
ADD COLUMN address address_type;

-- ✅ Insert composite address
UPDATE users
SET address = ROW('123 DB Lane', 'DataCity', '99999')
WHERE username = 'admin';

-- ✅ Select individual fields from composite
SELECT
    u.name,
    (u.address).street,
    (u.address).city,
    (u.address).zip_code
FROM users u
WHERE u.address IS NOT NULL;
