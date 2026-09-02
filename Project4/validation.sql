-- Create new table
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40),
	department VARCHAR(40),
	price INT
	weight INT
);

-- Insert data into the table
INSERT INTO products (name, department, price, weight) 
VALUES
('Shirt', 'Clothing', 20, 1);

-- Insert data into the table
INSERT INTO products (name, department, price, weight) 
VALUES
('Pants', 'Clothing', 3);

-- Update the price column if it is NULL
UPDATE products
SET price = 9999
WHERE price IS NULL;

-- Update price column to set NOT NULL constraint
ALTER TABLE products
ALTER COLUMN price
SET NOT NULL;

-- Add NULL constraint when creating a table
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	department VARCHAR(40) NOT NULL,
	price INT DEFAULT 999,
	weight INT
);

--  Add NULL constraint after the table was created
ALTER TABLE products
ALTER COLUMN price
SET DEFAULT 9999;

-- Add UNIQUE constraint when creating a table
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) UNIQUE,
	department VARCHAR(40) NOT NULL,
	price INT,
	weight INT
);

-- ADD UNIQUE constraint after the table was created
ALTER TABLE products
ADD UNIQUE (name);

-- Drop UNIQUE constraint
ALTER TABLE products
DROP CONSTRAINT products_name_key;

-- Multi-column UNIQUE constraint when creating a table
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40),
	department VARCHAR(40),
	price INT,
	weight INT,
	UNIQUE (name, department)
);

-- Multi-column UNIQUE constraint after the table was created
ALTER TABLE products
ADD UNIQUE (name, department);

-- Check validation when creating a table
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	department VARCHAR(40) NOT NULL,
	price INT CHECK (price > 0),
	weight INT
);

-- Check validation after the table was created
ALTER TABLE products
ADD CHECK (price > 0);

-- Check over multiple columns when creating a table
CREATE TABLES orders (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	created_at TIMESTAMP NOT NULL,
	est_delivery TIMESTAMP NOT NULL,
	CHECK (est_delivery > created_at)
);

-- Test the check constraint by inserting a row that violates the constraint
INSERT INTO orders (name, created_at, est_delivery)
VALUES
('Order1', '2024-06-01 10:00:00', '2024-06-02 10:00:00');