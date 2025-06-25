-- 🔧 This file documents the replication steps and verification

-- Step 1: On PRIMARY (Master)
-- Edit postgresql.conf
-- ----------------------------------
-- wal_level = replica
-- max_wal_senders = 10
-- wal_keep_size = 64MB
-- hot_standby = on

-- Edit pg_hba.conf
-- ----------------------------------
-- host replication replicator 0.0.0.0/0 md5

-- Create a replication user
CREATE ROLE replicator WITH REPLICATION LOGIN PASSWORD 'secure_pass';

-- Reload configuration
SELECT pg_reload_conf();


-- Step 2: On STANDBY (Replica)
-- Shut down standby if running
-- Take base backup using pg_basebackup (run from standby server terminal)
-- bash command (not SQL):
-- pg_basebackup -h <primary_ip> -D /var/lib/postgresql/16/main -U replicator -P --wal-method=stream

-- Add standby.signal file in the data directory
-- touch /var/lib/postgresql/16/main/standby.signal

-- Create standby.conf or use postgresql.conf settings:
-- primary_conninfo = 'host=<primary_ip> port=5432 user=replicator password=secure_pass'

-- Start PostgreSQL on standby
-- systemctl start postgresql


-- Step 3: Verification
-- On PRIMARY:
SELECT client_addr, state FROM pg_stat_replication;

-- On STANDBY:
SELECT pg_is_in_recovery();  -- should return true
