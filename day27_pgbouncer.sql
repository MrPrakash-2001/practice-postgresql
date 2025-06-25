-- Note: PgBouncer is not managed inside PostgreSQL as SQL; it's a separate service.
-- This file includes key configuration references and setup verification.

-- 📘 What is PgBouncer?
-- A lightweight connection pooler for PostgreSQL
-- Reduces connection overhead & improves performance under load

-- 🧰 Basic PgBouncer Setup:
-- 1. Install PgBouncer (Linux/macOS: apt/yum/brew)
-- 2. Create/edit config file: pgbouncer.ini

-- Example: pgbouncer.ini
-- [databases]
-- mydb = host=127.0.0.1 port=5432 dbname=mydb
--
-- [pgbouncer]
-- listen_port = 6432
-- listen_addr = 127.0.0.1
-- auth_type = md5
-- auth_file = /etc/pgbouncer/userlist.txt
-- pool_mode = transaction  -- can be: session | transaction | statement
-- max_client_conn = 100
-- default_pool_size = 20

-- 📘 Pooling Modes:
-- session     = holds connection for entire client session (default)
-- transaction = releases connection at transaction end
-- statement   = releases after each statement

-- 🔐 Auth File Format (userlist.txt):
-- "myuser" "md5<hashed-password>"

-- ✅ Run PgBouncer:
-- pgbouncer -d /etc/pgbouncer/pgbouncer.ini

-- 🧪 Check Running Status:
-- Connect to PgBouncer using psql:
-- psql -h 127.0.0.1 -p 6432 -U myuser pgbouncer
-- Then run:
-- SHOW POOLS;
-- SHOW DATABASES;
-- SHOW CLIENTS;

-- 🚦 Good Practice:
-- Always use `transaction` mode for web apps (optimal for pooled usage)
