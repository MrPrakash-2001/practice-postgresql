# 🚀 PostgreSQL Mastery – 30 Day Journey

Welcome to my PostgreSQL learning journal!  
Over 30 days, I’m diving deep into PostgreSQL — from basics like SQL and constraints to enterprise-level topics like replication, row-level security, and monitoring.

---

## 📅 Daily Breakdown

| Day       | Topic                                             | File                                                             |
| --------- | ------------------------------------------------- | ---------------------------------------------------------------- |
| ✅ Day 1  | Data Types & Table Design                         | [day01_schema_design.sql](./day01_schema_design.sql)             |
| ✅ Day 2  | Constraints + CRUD (`INSERT`, `UPDATE`, `DELETE`) | [day02_constraints_crud.sql](./day02_constraints_crud.sql)       |
| ✅ Day 3  | SELECT Queries, Filtering, Sorting                | [day03_select_queries.sql](./day03_select_queries.sql)           |
| ✅ Day 4  | JOINS (INNER, LEFT, RIGHT, FULL)                  | [day04_joins.sql](./day04_joins.sql)                             |
| ✅ Day 5  | Aggregates + GROUP BY + HAVING                    | [day05_aggregates.sql](./day05_aggregates.sql)                   |
| ✅ Day 6  | Subqueries & `EXISTS`                             | [day06_subqueries.sql](./day06_subqueries.sql)                   |
| ✅ Day 7  | Transactions & ACID                               | [day07_transactions.sql](./day07_transactions.sql)               |
| ✅ Day 8  | `ALTER`, `DROP`, `TRUNCATE`                       | [day08_alter_drop.sql](./day08_alter_drop.sql)                   |
| ✅ Day 9  | ENUM, ARRAY, Composite Types                      | [day09_enums_arrays.sql](./day09_enums_arrays.sql)               |
| ✅ Day 10 | JSON & JSONB                                      | [day10_jsonb.sql](./day10_jsonb.sql)                             |
| ✅ Day 11 | Common Table Expressions (CTEs)                   | [day11_ctes.sql](./day11_ctes.sql)                               |
| ✅ Day 12 | Views & Materialized Views                        | [day12_views.sql](./day12_views.sql)                             |
| ✅ Day 13 | Functions (`plpgsql`)                             | [day13_functions.sql](./day13_functions.sql)                     |
| ✅ Day 14 | Triggers                                          | [day14_triggers.sql](./day14_triggers.sql)                       |
| ✅ Day 15 | Indexes (B-Tree, GIN, Partial)                    | [day15_indexes.sql](./day15_indexes.sql)                         |
| ✅ Day 16 | EXPLAIN & ANALYZE                                 | [day16_explain.sql](./day16_explain.sql)                         |
| ✅ Day 17 | Covering & Partial Indexes                        | [day17_partial_indexes.sql](./day17_partial_indexes.sql)         |
| ✅ Day 18 | UPSERTs (`ON CONFLICT`)                           | [day18_upserts.sql](./day18_upserts.sql)                         |
| ✅ Day 19 | Partitioning                                      | [day19_partitioning.sql](./day19_partitioning.sql)               |
| ✅ Day 20 | Vacuum, Reindex, Analyze                          | [day20_maintenance.sql](./day20_maintenance.sql)                 |
| ✅ Day 21 | Performance Project                               | [day21_performance_project.sql](./day21_performance_project.sql) |
| ✅ Day 22 | RBAC (Roles, Grants)                              | [day22_roles_grants.sql](./day22_roles_grants.sql)               |
| ✅ Day 23 | Row-Level Security (RLS)                          | [day23_rls.sql](./day23_rls.sql)                                 |
| ✅ Day 24 | Replication Setup                                 | [day24_replication.sql](./day24_replication.sql)                 |
| ✅ Day 25 | WAL + PITR                                        | [day25_wal_pitr.sql](./day25_wal_pitr.sql)                       |
| ✅ Day 26 | Backup Tools (`pg_dump`, `pgBackRest`)            | [day26_backup.sql](./day26_backup.sql)                           |
| ✅ Day 27 | PgBouncer & Connection Pooling                    | [day27_pgbouncer.sql](./day27_pgbouncer.sql)                     |
| ✅ Day 28 | Foreign Data Wrappers (FDW)                       | [day28_fdw.sql](./day28_fdw.sql)                                 |
| ✅ Day 29 | Monitoring (Prometheus + Grafana)                 | [day29_monitoring.sql](./day29_monitoring.sql)                   |
| ✅ Day 30 | Final Project: SaaS DB Schema                     | [day30_final_project.sql](./day30_final_project.sql)             |

---

## 🛠️ Tools Used

- PostgreSQL 16
- psql CLI
- pgAdmin
- Docker for isolated environments
- VS Code for SQL editing

---

## 🔖 Notes

- ✅ Completed files are marked with checkmarks
- 🧪 All SQL is tested on local PostgreSQL setup
- 🧠 Concepts are updated daily as I learn

---

## 🗂️ Day Highlights

### ✅ Day 1 – Schema Design

- Created `users` and `posts` tables with UUID PKs, arrays, JSONB, and timestamps.
- Added foreign key with `ON DELETE CASCADE`.
- Used `INSERT`, `SELECT`, and `ALTER` statements.

### ✅ Day 2 – Constraints & CRUD

- Added `CHECK` constraints on email domain and password length.
- Practiced `INSERT`, `UPDATE`, and `DELETE`.
- Verified cascade behavior on post deletion when a user is removed.

### ✅ Day 3 – SELECT Queries, Filtering, Sorting & Pagination

- Queried full tables and specific columns with `SELECT`.
- Filtered rows using `WHERE`, `AND`, `OR`, `NOT`, `LIKE`.
- Handled array filters with `ANY(tags)`.
- Sorted records using `ORDER BY` and paginated with `LIMIT` and `OFFSET`.
- Used `DISTINCT` and `COUNT` for deduplication and summary.

### ✅ Day 4 – JOINS (INNER, LEFT, RIGHT, FULL)

- Practiced `INNER JOIN` to retrieve only matched user-post pairs.
- Used `LEFT JOIN` to include all users, even without posts.
- Explored `RIGHT JOIN` and `FULL OUTER JOIN` for completeness.
- Queried unmatched records (e.g., users without posts).
- Learned how JOINs help in multi-table report generation.

### ✅ Day 5 – Aggregates, GROUP BY, HAVING

- Practiced `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX` on real post data.
- Grouped posts by `user_id`, `is_published`, and individual tags.
- Used `HAVING` to filter aggregate groups.
- Queried average word count using JSONB extraction.

### ✅ Day 6 – Subqueries & EXISTS

- Practiced scalar, row, and correlated subqueries.
- Used `EXISTS` and `NOT EXISTS` to filter users with/without posts.
- Compared `word_count` to global average using subqueries.
- Combined `UNNEST` with subqueries to analyze tags from specific users.

### ✅ Day 7 – Transactions & ACID

- Practiced `BEGIN`, `COMMIT`, `ROLLBACK` for transaction management.
- Demonstrated rollback on error and partial rollback with `SAVEPOINT`.
- Ensured atomicity and consistency of inserts using transaction blocks.

### ✅ Day 8 – `ALTER`, `DROP`, `TRUNCATE`

- Modified table schemas with `ALTER TABLE`.
- Practiced column and table renaming.
- Used `DROP` to safely remove columns and tables.
- Tested `TRUNCATE` vs `DELETE` for efficient row deletion.

### ✅ Day 9 – ENUM, ARRAY, Composite Types

- Defined and used `ENUM` for strict role values.
- Updated and queried `ARRAY` columns with `ANY()`.
- Defined and inserted structured `COMPOSITE` types for complex address fields.

### ✅ Day 10 – JSON & JSONB

- Added and manipulated structured data using `JSONB`.
- Queried nested fields with `->` and `->>`.
- Used `@>`, `jsonb_set`, and casting for filtering.

### ✅ Day 11 – Common Table Expressions (CTEs)

- Simplified complex queries using `WITH` clause.
- Implemented recursive CTEs to solve factorial and tree-like problems.
- Used CTEs with `JOIN`, `UPDATE`, and real-world filtering logic.

### ✅ Day 12 – Views & Materialized Views

- Built multiple `VIEW`s to simplify querying `posts` with user data and metadata.
- Implemented `MATERIALIZED VIEW` to pre-calculate tag usage.
- Covered advanced JSONB filtering and array unnesting inside views.

### ✅ Day 13 – Functions

- Created reusable SQL functions using `plpgsql`.
- Built functions to:
  - Fetch user summary
  - Count posts by user
  - Toggle post visibility
  - Create posts with default metadata
- Practiced `IN`, `OUT`, `RETURNING`, and function `RETURNS TABLE`.

### ✅ Day 14 – Triggers

- Created an `audit_log` table to track changes to `posts`.
- Used `AFTER INSERT` and `AFTER DELETE` triggers to log data.
- Built two `plpgsql` functions to handle auditing logic.

### ✅ Day 15 – Indexes

- Created B-Tree indexes for fast equality and range lookups.
- Used GIN indexes on arrays and JSONB columns for efficient searching.
- Added partial index on published posts to optimize filtered queries.
- Tested index usage with `EXPLAIN ANALYZE`.

### ✅ Day 16 – EXPLAIN & ANALYZE

- Used `EXPLAIN` to view query plans without execution.
- Combined with `ANALYZE` to measure actual runtime statistics.
- Learned to identify index usage, scan types, and performance bottlenecks.
- Practiced on joins, filters, and aggregate queries.

### ✅ Day 17 – Covering & Partial Indexes

- Created covering index including additional columns to avoid heap fetch.
- Added partial index for rows with specific condition (`is_published = false`).
- Tested index usage with `EXPLAIN ANALYZE` and observed query speed improvements.

### ✅ Day 18 – UPSERTs

- Practiced using `INSERT ... ON CONFLICT` to perform upserts.
- Used `ON CONFLICT DO NOTHING` to avoid inserting duplicates.
- Used `ON CONFLICT DO UPDATE SET` to update rows when constraint violations occur.
- Worked with `EXCLUDED` keyword to reference values that would have been inserted.
- Applied upserts on `users.email` and `posts.id` for deduplication and sync-like behavior.

### ✅ Day 19 – Partitioning

- Learned range-based partitioning with PostgreSQL.
- Partitioned the `posts` table by `created_at` year.
- Inserted data routed automatically to appropriate partitions.
- Covered default partitioning to handle outliers.

### ✅ Day 20 – Maintenance: VACUUM, REINDEX, ANALYZE

- Learned about PostgreSQL MVCC and importance of maintenance.
- Ran `VACUUM` and `ANALYZE` to reclaim space and update planner stats.
- Explored `VACUUM FULL` and `REINDEX` for aggressive cleanup.
- Understood when and how to use these commands to maintain healthy DB.

### ✅ Day 21 – Performance Project

- Generated bulk test data: 10,000 users and 100,000 posts.
- Performed complex aggregation queries with EXPLAIN ANALYZE.
- Created composite indexes to optimize query performance.
- Explored partition pruning and maintenance post bulk insert.

### ✅ Day 22 – RBAC (Roles and Grants)

- Created roles with specific privileges (read-only and read-write).
- Granted permissions on tables to roles.
- Created users and assigned roles for permission control.
- Tested permissions by switching users.

### ✅ Day 23 – Row-Level Security (RLS)

- Enabled RLS on `posts` table to restrict access to rows per user.
- Created policy to allow each user to only see their own posts.
- Used `current_setting()` to simulate app context for authenticated user ID.
- Demonstrated `SELECT` and `INSERT` policies with `USING` and `WITH CHECK`.

### ✅ Day 24 – Replication Setup

- Enabled streaming replication using `pg_basebackup` and `standby.signal`.
- Configured replication roles, WAL settings, and `pg_hba.conf`.
- Verified replication with `pg_stat_replication` and `pg_is_in_recovery()`.

### ✅ Day 25 – WAL & PITR (Point-in-Time Recovery)

- Enabled WAL archiving with `archive_mode` and `archive_command`.
- Took base backups and simulated data corruption.
- Performed PITR using `recovery_target_time` and WAL archives.

### ✅ Day 26 – Backup Tools

- Learned to use `pg_dump`, `pg_restore`, `pg_dumpall` for schema/data/logical backups.
- Created backups for entire DB, specific tables, schema-only, and data-only.
- Introduced `pgBackRest` for enterprise-level backup and WAL archiving.

### ✅ Day 27 – PgBouncer & Connection Pooling

- Installed and configured **PgBouncer** to reduce connection overhead.
- Explored key settings: `pool_mode`, `max_client_conn`, `auth_type`.
- Used `SHOW POOLS` and `SHOW CLIENTS` to monitor activity.
- Learned when to use `session`, `transaction`, and `statement` pooling.

### ✅ Day 28 – Foreign Data Wrappers (FDW)

- Enabled the `postgres_fdw` extension.
- Connected to a remote PostgreSQL database using `CREATE SERVER`.
- Queried external tables using `FOREIGN TABLE`.
- Learned to `IMPORT FOREIGN SCHEMA` and manage FDW permissions.

### ✅ Day 29 – Monitoring (Prometheus + Grafana)

- Installed `postgres_exporter` for metric collection.
- Set up Prometheus to scrape metrics.
- Visualized PostgreSQL metrics using Grafana dashboards.
- Learned SQL queries to manually check performance stats like cache hit ratio, long-running queries, and index usage.

### ✅ Day 30 – Final Project: SaaS DB Schema

- Designed multi-tenant schema with tenants, users, and projects.
- Applied Row-Level Security for tenant data isolation.
- Created functions to set tenant context dynamically.
- Indexed tenant_id columns for performance.

---

## 📌 Follow Me

I’m sharing my progress on GitHub daily. Feel free to fork, review, and suggest improvements!

---
