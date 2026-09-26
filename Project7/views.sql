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
