-- create users table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50)
);

-- insert users data into users table
INSERT INTO users (username) VALUES ('Buttercup'), ('Bubbles'), ('Blossom');

-- create photos table with a foreign key reference to users
CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(255),
  user_id INTEGER REFERENCES users(id)
);

-- insert photos data into photos table
INSERT INTO photos (url, user_id) VALUES 
('https://example.com/photo1.jpg', 1),
('https://example.com/photo2.jpg', 1),
('https://example.com/photo3.jpg', 2);

-- query to select all photos for a user
SELECT * FROM photos
WHERE user_id = 1;

-- query to select all photos along with the username of the user who uploaded them
SELECT url, username FROM photos
JOIN users ON users.id = photos.user_id;

-- ON DELETE OPTIONS
-- delete photos table
DROP TABLE photos;

-- recreate photos table with ON DELETE CASCADE
CREATE TABLE photos (
id SERIAL PRIMARY KEY,
url VARCHAR(200),
user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);
 
INSERT INTO photos (url, user_id)
VALUES
('https://example.com/photo1.jpg', 1),
('https://example.com/photo2.jpg', 1),
('https://example.com/photo3.jpg', 2);

-- photos related to user deleted
DELETE FROM users
WHERE id = 1;

-- delete photos table
DROP TABLE photos;

-- recreate photos table with ON DELETE SET NULL
CREATE TABLE photos (
id SERIAL PRIMARY KEY,
url VARCHAR(200),
user_id INTEGER REFERENCES users(id) ON DELETE SET NULL
);
 
INSERT INTO photos (url, user_id)
VALUES
('https://example.com/photo1.jpg', 1),
('https://example.com/photo2.jpg', 1),
('https://example.com/photo3.jpg', 2);

-- user deleted but photos still exist with user_id set to null
DELETE FROM users
WHERE id = 1;