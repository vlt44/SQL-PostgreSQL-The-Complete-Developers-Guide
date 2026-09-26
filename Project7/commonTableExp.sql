-- Show username of users tagged in a caption or photo before a certain date. Also show date they were tagged.
WITH tags AS (
    SELECT user_id, created_at FROM caption_tags
    UNION ALL
    SELECT user_id, created_at FROM photo_tags
)
SELECT username, tags.created_at
FROM users
JOIN tags ON tags.user_id = users.id
WHERE tags.created_at < '2023-01-01';

EXPLAIN WITH tags AS (
    SELECT user_id, created_at FROM caption_tags
    UNION ALL
    SELECT user_id, created_at FROM photo_tags
)
SELECT username, tags.created_at
FROM users
JOIN tags ON tags.user_id = users.id
WHERE tags.created_at < '2023-01-01';

-- Recursive CTE
-- Define the results and working table
-- Run initial non-recursive query, put results into working and results table
-- Run recursive queries, replacing the table name 'countdown' with the referebce to working table
-- Recursive query returns rows, base case no rows returned
WITH RECURSIVE countdown(val) AS (
    SELECT 3 AS val -- non-recursive query
    UNION
    SELECT val - 1 FROM countdown WHERE val > 1 -- recursive query
)
SELECT * FROM countdown;