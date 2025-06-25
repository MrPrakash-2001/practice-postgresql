-- 📘 pg_dump – Logical Backup
-- Backup a single database
-- CLI (bash):
-- pg_dump -U postgres -F c -f mydb.backup mydb

-- Format (-F): p = plain SQL, c = custom, t = tar, d = directory

-- 📘 Restore using pg_restore
-- Restore from .backup file
-- pg_restore -U postgres -d mydb_restored mydb.backup

-- 📘 Backup a specific table
-- pg_dump -U postgres -t posts -F c -f posts.backup mydb

-- 📘 Backup schema only (no data)
-- pg_dump -U postgres -s -f schema_only.sql mydb

-- 📘 Backup data only (no schema)
-- pg_dump -U postgres -a -f data_only.sql mydb


-- 📘 pg_dumpall – Backup all DBs + roles
-- pg_dumpall -U postgres -f all_dbs.sql


-- 🔐 Tip: Always use -Fc format for reliable restore + compression


-- 🧰 BONUS: Intro to pgBackRest
-- Production-grade backup tool with:
-- - Full + Incremental + Differential backups
-- - Compression, encryption, retention, parallel backup
-- - Support for streaming + archiving WAL

-- Steps:
-- 1. Install pgBackRest
-- 2. Configure stanza with repositories
-- 3. Run:
--    - pgbackrest --stanza=demo --type=full backup
--    - pgbackrest --stanza=demo restore

-- 🔗 Learn more: https://pgbackrest.org
