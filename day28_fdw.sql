-- 🧰 Ensure the extension is available
CREATE EXTENSION IF NOT EXISTS postgres_fdw;

-- 🔌 Create a foreign server (remote PostgreSQL)
CREATE SERVER IF NOT EXISTS remote_server
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (
    host 'localhost',
    port '5433', -- your remote PostgreSQL port
    dbname 'external_db'
);

-- 🔐 Create a user mapping (connect local user to remote user)
CREATE USER MAPPING FOR CURRENT_USER
SERVER remote_server
OPTIONS (
    user 'remote_user',
    password 'remote_pass'
);

-- 📁 Option 1: Manually create a foreign table
CREATE FOREIGN TABLE IF NOT EXISTS external_posts (
    id UUID,
    user_id UUID,
    title TEXT,
    content TEXT,
    created_at TIMESTAMP WITH TIME ZONE
)
SERVER remote_server
OPTIONS (
    schema_name 'public',
    table_name 'posts'
);

-- 📁 Option 2: Import a whole schema (requires remote access rights)
-- IMPORT FOREIGN SCHEMA public
-- FROM SERVER remote_server
-- INTO local_schema;

-- 🔍 Query like a local table
SELECT * FROM external_posts;

-- 🧼 Clean up
-- DROP FOREIGN TABLE external_posts;
-- DROP SERVER remote_server CASCADE;
