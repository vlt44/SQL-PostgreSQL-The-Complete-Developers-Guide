-- Query plan
EXPLAIN SELECT username, contents
FROM users
JOIN comments ON comments.user_id = users.id
WHERE username = 'Alyson14';

-- Query execution plan, analysis and statistics
EXPLAIN ANALYZE SELECT username, contents
FROM users
JOIN comments ON comments.user_id = users.id
WHERE username = 'Alyson14';

-- Statistics of the users table
SELECT *
FROM pg_stats
WHERE tablename = 'users';