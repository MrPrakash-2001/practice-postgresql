-- ✅ Basic CTE example
WITH recent_posts AS (
  SELECT id, title, created_at
  FROM posts
  WHERE created_at > NOW() - INTERVAL '30 days'
)
SELECT * FROM recent_posts;

-- ✅ CTE with JOIN
WITH user_post_counts AS (
  SELECT user_id, COUNT(*) AS post_count
  FROM posts
  GROUP BY user_id
)
SELECT u.username, up.post_count
FROM users u
JOIN user_post_counts up ON u.id = up.user_id;

-- ✅ CTE with UPDATE
WITH updated_users AS (
  UPDATE users
  SET last_login = NOW()
  RETURNING id, username
)
SELECT * FROM updated_users;

-- ✅ Recursive CTE for factorial calculation
WITH RECURSIVE factorial(n, fact) AS (
  SELECT 1, 1
  UNION
  SELECT n + 1, (n + 1) * fact
  FROM factorial
  WHERE n < 5
)
SELECT * FROM factorial;

-- ✅ Recursive example (org chart style)
-- Note: You need a self-referencing table like employees(id, manager_id)
-- This is just a syntax sample for learning
WITH RECURSIVE org_chart AS (
  SELECT id, name, manager_id, 1 AS level
  FROM employees
  WHERE manager_id IS NULL

  UNION ALL

  SELECT e.id, e.name, e.manager_id, oc.level + 1
  FROM employees e
  INNER JOIN org_chart oc ON e.manager_id = oc.id
)
SELECT * FROM org_chart;
