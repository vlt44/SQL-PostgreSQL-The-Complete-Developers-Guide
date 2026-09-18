-- Where postgres stores its data files
SHOW data_directory;

-- List all databases
SELECT oid, datname
FROM pg_database;

-- List of files representing objects in the database
SELECT * FROM pg_class;

-- Find this user in users table
SELECT * FROM users WHERE username = 'Gene76';

-- Create an index on the username column
CREATE INDEX ON users (username);

-- Delete an index on the username column
DROP INDEX users_username_idx;