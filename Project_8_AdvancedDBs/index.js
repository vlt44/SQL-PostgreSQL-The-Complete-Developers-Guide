const app = require('./src/app.js');
const pool = require('./src/pool.js');

pool.connect({
  host: 'localhost',
  port: 5432,
  database: 'postgres',
  user: 'postgres',
  password: 'postgres',
})
.then(() => {
  app().listen(3005, () => {
    console.log('Server running on port 3005');
  });
})
.catch((err) => {
  console.error('Error connecting to the database:', err);
});

app().listen(3005, () => {
  console.log('Server running on port 3005');
});