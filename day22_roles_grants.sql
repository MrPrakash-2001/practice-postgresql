-- Day 22: RBAC with Roles and Grants

-- 1️⃣ Create roles

-- Create a read-only role
CREATE ROLE reader NOLOGIN;

-- Create a read-write role
CREATE ROLE writer NOLOGIN;

-- 2️⃣ Grant privileges to roles

-- Allow reader to SELECT from users and posts
GRANT SELECT ON users, posts TO reader;

-- Allow writer to SELECT, INSERT, UPDATE, DELETE on users and posts
GRANT SELECT, INSERT, UPDATE, DELETE ON users, posts TO writer;

-- 3️⃣ Create users and assign roles

-- Create user alice with password and assign reader role
CREATE USER alice WITH PASSWORD 'alice_password';
GRANT reader TO alice;

-- Create user bob with password and assign writer role
CREATE USER bob WITH PASSWORD 'bob_password';
GRANT writer TO bob;

-- 4️⃣ Verify privileges

-- Switch user example (psql):
-- \c - alice

-- Try selecting and inserting to test permissions
