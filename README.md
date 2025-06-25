# 🚀 PostgreSQL Mastery – 30 Day Journey

Welcome to my PostgreSQL learning journal!  
Over 30 days, I’m diving deep into PostgreSQL — from basics like SQL and constraints to enterprise-level topics like replication, row-level security, and monitoring.

---

## 📅 Daily Breakdown

| Day       | Topic                                             | File                                                       |
| --------- | ------------------------------------------------- | ---------------------------------------------------------- |
| ✅ Day 1  | Data Types & Table Design                         | [day01_schema_design.sql](./day01_schema_design.sql)       |
| ✅ Day 2  | Constraints + CRUD (`INSERT`, `UPDATE`, `DELETE`) | [day02_constraints_crud.sql](./day02_constraints_crud.sql) |
| ✅ Day 3  | SELECT Queries, Filtering, Sorting                | [day03_select_queries.sql](./day03_select_queries.sql)     |
| ✅ Day 4  | JOINS (INNER, LEFT, RIGHT, FULL)                  | [day04_joins.sql](./day04_joins.sql)                       |
| ✅ Day 5  | Aggregates + GROUP BY + HAVING                    | [day05_aggregates.sql](./day05_aggregates.sql)             |
| ✅ Day 6  | Subqueries & `EXISTS`                             | [day06_subqueries.sql](./day06_subqueries.sql)             |
| ✅ Day 7  | Transactions & ACID                               | [day07_transactions.sql](./day07_transactions.sql)         |
| ⬜ Day 8  | `ALTER`, `DROP`, `TRUNCATE`                       | `day08_alter_drop.sql`                                     |
| ⬜ Day 9  | ENUM, ARRAY, Composite Types                      | `day09_enums_arrays.sql`                                   |
| ⬜ Day 10 | JSON & JSONB                                      | `day10_jsonb.sql`                                          |
| ⬜ Day 11 | Common Table Expressions (CTEs)                   | `day11_ctes.sql`                                           |
| ⬜ Day 12 | Views & Materialized Views                        | `day12_views.sql`                                          |
| ⬜ Day 13 | Functions (`plpgsql`)                             | `day13_functions.sql`                                      |
| ⬜ Day 14 | Triggers                                          | `day14_triggers.sql`                                       |
| ⬜ Day 15 | Indexes (B-Tree, GIN, Partial)                    | `day15_indexes.sql`                                        |
| ⬜ Day 16 | EXPLAIN & ANALYZE                                 | `day16_explain.sql`                                        |
| ⬜ Day 17 | Covering & Partial Indexes                        | `day17_partial_indexes.sql`                                |
| ⬜ Day 18 | UPSERTs (`ON CONFLICT`)                           | `day18_upserts.sql`                                        |
| ⬜ Day 19 | Partitioning                                      | `day19_partitioning.sql`                                   |
| ⬜ Day 20 | Vacuum, Reindex, Analyze                          | `day20_maintenance.sql`                                    |
| ⬜ Day 21 | Performance Project                               | `day21_performance_project.sql`                            |
| ⬜ Day 22 | RBAC (Roles, Grants)                              | `day22_roles_grants.sql`                                   |
| ⬜ Day 23 | Row-Level Security (RLS)                          | `day23_rls.sql`                                            |
| ⬜ Day 24 | Replication Setup                                 | `day24_replication.sql`                                    |
| ⬜ Day 25 | WAL + PITR                                        | `day25_wal_pitr.sql`                                       |
| ⬜ Day 26 | Backup Tools (`pg_dump`, `pgBackRest`)            | `day26_backup.sql`                                         |
| ⬜ Day 27 | PgBouncer & Connection Pooling                    | `day27_pgbouncer.sql`                                      |
| ⬜ Day 28 | Foreign Data Wrappers (FDW)                       | `day28_fdw.sql`                                            |
| ⬜ Day 29 | Monitoring (Prometheus + Grafana)                 | `day29_monitoring.sql`                                     |
| ⬜ Day 30 | Final Project: SaaS DB Schema                     | `day30_final_project.sql`                                  |

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

---

## 📌 Follow Me

I’m sharing my progress on GitHub daily. Feel free to fork, review, and suggest improvements!

---
