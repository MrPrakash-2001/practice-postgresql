-- users TABLE CREATION
CREATE TABLE users(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    username VARCHAR(30) UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE
);

-- posts TABLE CREATION
CREATE TABLE posts(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT,
    tags TEXT[],
    metadata JSONB,
    is_published BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);


-- INSERT DATA IN users TABLE
INSERT INTO users(name, username, email, password)
VALUES('Prakash','prakash','prakash@gmail.com','prakash@001');

-- GET ALL RECORDS FROM users TABLE
SELECT *
FROM users;

-- INSERT DATA IN posts TABLE
INSERT INTO posts(user_id, title, content, tags, metadata)
VALUES(  (SELECT id FROM users WHERE username = 'prakash'), 'Demo Upload', 'Demo content there', ARRAY['demo', 'test'], '{"word_count": 250, "category": "blog"}');

-- GET ALL RECORDS FROM posts TABLE
SELECT *
FROM posts;

-- ADD A NEW COLUMN TO users TABLE
ALTER TABLE users ADD COLUMN last_login TIMESTAMP WITH TIME ZONE;

-- DROP A EXISTING COLUMN IN users TABLE 
ALTER TABLE users DROP COLUMN updated_at;