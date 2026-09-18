-- Where postgres stores its data files
SHOW data_directory;

-- List all databases
SELECT oid, datname
FROM pg_database;

-- List of files representing objects in the database
SELECT * FROM pg_class;

-- Find this user in users table
SELECT * FROM users WHERE username = 'Gene76';