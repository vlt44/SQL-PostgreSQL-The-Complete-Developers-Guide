const express = require('express');
const pg = require('pg');

const pool = new pg.Pool({
  host: 'localhost',
  database: 'socialnetwork',
  port: 5432,
  user: 'vanessa',
  password: ''
});

const app = express();
app.use(express.urlencoded({ extended: true }));

app.get('/posts', async (req, res) => {
  const { rows } = await pool.query('SELECT * FROM posts');
  
  res.send(`
  <table>
    <thead>
    <tr>
      <th>id</th>
      <th>lat</th>
      <th>lng</th>
    </tr>
    </thead>
    <tbody>
     ${rows.map(row => {
        return `
        <tr>
          <td>${row.id}</td>
          <td>${row.lat}</td>
          <td>${row.lng}</td>
        </tr>
        `;
      }).join('')}
     }}
    </tbody>
  </table>
  <form method="POST">
  <h3>Create Post</h3>
  <div>
    <label>Latitude</label>
    <input type="text">
  </div>
  <div>
    <label>Longitude</label>
    <input type="text">
  </div>
  <button type="submit">Create</button>
  </form>
  `);
});

app.listen(3005, () => {
  console.log('Server is running on port 3005');
});