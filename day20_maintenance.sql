-- Day 20: Maintenance commands on users and posts tables

-- 1. Run VACUUM (non-blocking)
VACUUM users;
VACUUM posts;

-- 2. Run ANALYZE to update statistics
ANALYZE users;
ANALYZE posts;

-- 3. Run VACUUM FULL (locks table, more aggressive cleanup)
-- Use cautiously on large tables
-- VACUUM FULL users;
-- VACUUM FULL posts;

-- 4. REINDEX a specific index (example: email index on users)
-- Find index names by \d users in psql
REINDEX INDEX idx_users_email;

-- 5. REINDEX entire table
-- REINDEX TABLE users;
