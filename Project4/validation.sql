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