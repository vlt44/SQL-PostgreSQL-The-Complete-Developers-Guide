-- Create new table
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40),
	department VARCHAR(40),
	price INT
	weight INT
);

-- insert data into the table
INSERT INTO products (name, department, price, weight) 
VALUES
('Shirt', 'Clothing', 20, 1)