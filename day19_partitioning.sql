-- 🔄 DAY 19: Partitioning by created_at (RANGE)

-- Cleanup if re-running
DROP TABLE IF EXISTS posts CASCADE;

-- 🧱 Create master partitioned table
CREATE TABLE posts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT,
    tags TEXT[],
    metadata JSONB,
    is_published BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
) PARTITION BY RANGE (created_at);

-- 📆 Create range partitions by year

CREATE TABLE posts_2023 PARTITION OF posts
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE posts_2024 PARTITION OF posts
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE posts_2025 PARTITION OF posts
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 🧪 Optional: Default partition for unhandled dates
-- CREATE TABLE posts_default PARTITION OF posts DEFAULT;

-- 📝 Insert sample data into partitions

-- Insert into 2023 partition
INSERT INTO posts(user_id, title, content)
VALUES (
    (SELECT id FROM users LIMIT 1),
    'Post from 2023',
    'Test content from 2023'
);

-- Insert into 2025 partition
INSERT INTO posts(user_id, title, content)
VALUES (
    (SELECT id FROM users LIMIT 1),
    'Post from 2025',
    'Test content from 2025'
);

-- 🔍 Query from master (automatically fetches from partitions)
SELECT * FROM posts;

-- 🔍 Query specific partition
SELECT * FROM posts_2025;
