-- Where postgres stores its data files
SHOW data_directory;

-- List all databases
SELECT oid, datname
FROM pg_database;

-- list of files representing objects in the database
SELECT * FROM pg_class;