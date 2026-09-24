-- Create an index on the username column
CREATE INDEX ON users (username);

-- Delete an index on the username column
DROP INDEX users_username_idx;

-- Analyze the query plan. With index it took: 0.075ms compares to 1.249ms without index.
EXPLAIN ANALYZE SELECT *
FROM users
WHERE username = 'Emil30';

-- Check the size of the index
SELECT pg_size_pretty(pg_database_size('users_username.idx'));

-- List all of the indexes in the database
SELECT relname, relkind
FROM pg_class
WHERE relkind = 'i';

-- Create the pageinspect extension for more functionality 
CREATE EXTENSION pageinspect;

-- Retrieve information off the meta page of the index
-- Inspect the index
SELECT *
FROM bt_metap('users_username_idx');

-- B-tree, retrieve items from BT
SELECT *
FROM bt_page_items('users_username_idx', 3);