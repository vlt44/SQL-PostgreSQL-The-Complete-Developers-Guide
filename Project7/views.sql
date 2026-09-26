-- Show most popular users - user that is tagged the most
SELECT username, COUNT(*)
FROM users
JOIN (
  SELECT user_id
  FROM photo_tags
  UNION ALL
  SELECT user_id
  FROM caption_tags
) AS tags ON tags.user_id = users.id
GROUP BY username
ORDER BY COUNT(*) DESC;

-- Show most popular users using view
CREATE VIEW tags AS (
  SELECT id, created_at, user_id, photo_id, 'photo_tag' AS type FROM photo_tags
  UNION ALL
  SELECT id, created_at, user_id, photo_id, 'caption_tag' AS type FROM caption_tags
);

SELECT username, COUNT(*)
FROM users
JOIN tags ON tags.user_id = users.id
GROUP BY username
ORDER BY COUNT(*) DESC;

-- Show recent posts
CREATE VIEW recent_posts AS (
  SELECT *
  FROM photos
  ORDER BY created_at DESC
  LIMIT 10
);

SELECT * FROM recent_posts;

-- Show users that posted recently
SELECT username
FROM recent_posts
JOIN users ON users.id = recent_posts.user_id;

-- Changing view
CREATE OR REPLACE VIEW recent_posts AS (
  SELECT *
  FROM photos
  ORDER BY created_at DESC
  LIMIT 15
);

-- Deleting view
DROP VIEW recent_posts;

-- For each week, show the number of likes that posts and comments recieved. 
-- Use created_at date, not when like was made.
SELECT 
  date_trunc('week', COALESCE(post.created_at, comments.created_at)) AS week,
  COUNT(post.id) AS number_of_post_likes,
  COUNT(comment.id) AS number_of_comment_likes
FROM likes
LEFT JOIN posts ON posts.id = likes.post_id
LEFT JOIN comments ON comments.id = likes.comment_id
GROUP BY week
ORDER BY week;

--
CREATE MATERIALIZED VIEW weekly_likes AS (
  SELECT 
    date_trunc('week', COALESCE (posts.created_at, comments. created_at)) AS week,
    COUNT (posts.id) AS num_likes_for_posts,
    COUNT (comments.id) A num_likes_for_comments
FROM likes
LEFT JOIN posts ON posts.id = likes.post_id
LEFT JOIN comments ON comments.id = likes.comment_id
GROUP BY week
ORDER BY week
) WITH DATA;

SELECT * FROM weekly_likes;

DELETE FROM posts 
WHERE created_at < '2010-02-01';

REFRESH MATERIALIZED VIEW weekly_likes;