-- ⚙️ Enable WAL Archiving on PRIMARY

-- In postgresql.conf
-- ----------------------------------
-- archive_mode = on
-- archive_command = 'cp %p /var/lib/postgresql/wal_archive/%f'
-- wal_level = replica
-- max_wal_senders = 10
-- wal_keep_size = 64MB

-- Create WAL archive directory
-- bash:
-- mkdir -p /var/lib/postgresql/wal_archive

-- Restart PostgreSQL
-- systemctl restart postgresql


-- 🗃️ Take Base Backup
-- (Use pg_basebackup OR manual file copy with checkpoint)

-- SQL to force a checkpoint before backup
CHECKPOINT;


-- 📌 Simulate Changes & Record Target Recovery Time
-- Insert some fake rows and record the timestamp

INSERT INTO posts (user_id, title, content)
VALUES ((SELECT id FROM users LIMIT 1), 'Before Accident', 'Important content');

-- Record current timestamp to a file
SELECT NOW(); -- This will be your target recovery time


-- ⚠️ Simulate Accidental DELETE
DELETE FROM posts;


-- 🧬 Start PITR from backup
-- ----------------------------------
-- 1. Stop PostgreSQL
-- 2. Restore base backup into data directory
-- 3. Create recovery.signal file
-- 4. Create postgresql.auto.conf with:
-- --------------------------------------
-- restore_command = 'cp /var/lib/postgresql/wal_archive/%f %p'
-- recovery_target_time = 'YYYY-MM-DD HH:MI:SS'

-- Start PostgreSQL and it will stop automatically once it reaches that time.

-- ✅ After successful PITR
SELECT * FROM posts; -- You’ll see data restored to point before DELETE
