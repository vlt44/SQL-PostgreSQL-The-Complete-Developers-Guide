-- keywords (do something)
-- identifier (what to act on)
-- column name
-- column data type

CREATE TABLE cities (
   name VARCHAR(50),
   country VARCHAR(50),
   population INTERGER,
   area INTERGER
);

-- columns and values order must match

INSERT INTO cities (name, country, population, area)
VALUES ('Tokyo', 'Japan', 38505000, 8223);

-- to add multiple rows at one time

INSERT INTO cities (name, country, population, area)
VALUES
   ('Delhi', 'India', 38505000, 8223),
   ('Shanghai', 'China', 22125000, 4015),
   ('Sao Paulo', 'Brazil', 20935000, 3043);

-- retrieve data with select
-- `*` (shortcut to retrieve all columns)

SELECT * FROM cities;

-- to designate which columns to retrieve

SELECT name, country, FROM cities;

SELECT name, population, area FROM cities;

-- calculate columns using math operators

SELECT name, population / area FROM cities;

-- rename temporary column

SELECT name, population / area AS density FROM cities;

-- string operator

SELECT name || ', ' || country AS location FROM citites;

-- concat and upper function

SELECT UPPER(CONCAT(name, ', ', country)) AS location FROM cities;

-- filter rows with where
-- data source is filtered then where clause is applied, and select statement is executed

SELECT name, area FROM cities WHERE area > 4000;

-- comparison Math operators

SELECT name, area FROM cities WHERE area = 4000;

SELECT name, area FROM cities WHERE area > 4000;

SELECT name, area FROM cities WHERE area BETWEEN 2000 AND 4000;

SELECT name, area FROM cities WHERE name NOT IN ('Delhi', 'Shanghai');

-- multiple operators

SELECT name, area FROM cities WHERE area NOT IN (3043, 8223) AND name = 'Delhi';

-- calculations in where clauses

SELECT name, population / area AS population_density FROM cities WHERE population / area > 6000;

-- update properties of existing rows

UPDATE cities SET population = 39505000 WHERE name = 'Tokyo';