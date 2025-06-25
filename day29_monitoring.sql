-- No traditional SQL today, but here's how to check key stats in SQL directly:

-- 🔍 Cache Hit Ratio
SELECT
  round(blks_hit * 100.0 / nullif(blks_hit + blks_read, 0), 2) AS cache_hit_ratio
FROM
  pg_stat_database;

-- 🔍 Longest Running Queries
SELECT pid, now() - query_start AS duration, query
FROM pg_stat_activity
WHERE state = 'active'
ORDER BY duration DESC
LIMIT 5;

-- 🔍 Index Usage
SELECT
    relname AS table_name,
    100 * idx_scan / (seq_scan + idx_scan) AS index_usage_percent
FROM pg_stat_user_tables
WHERE seq_scan + idx_scan > 0;

-- 🔍 Connections Count
SELECT count(*) FROM pg_stat_activity;

-- 👇 Optional: Install pg_stat_statements if you haven’t already
-- CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

-- 🔍 Top Queries by Total Time
SELECT
    query,
    total_time,
    calls,
    mean_time
FROM pg_stat_statements
ORDER BY total_time DESC
LIMIT 10;
