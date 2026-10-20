const pg = require('pg');

const pool = new pg.Pool({
  host: 'localhost',
  database: 'socialnetwork',
  port: 5432,
  user: 'vanessa',
  password: ''
});

pool.query(`
  UPDATE posts
  SET loc = POINT(lng, lat)
  WHERE loc IS NULL;
`)

.then(() => {
  console.log('Migration completed successfully.');
  pool.end();
})
.catch((err) => {
  console.error('Error during migration:', err);});