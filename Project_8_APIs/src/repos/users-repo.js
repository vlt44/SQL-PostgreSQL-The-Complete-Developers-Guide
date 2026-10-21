const pool = require('../pool');
const toCamelCase = require('../utils/toCamelCase');

class UserRepo {
  static async find() {
    const { rows } = await pool.query('SELECT * FROM users;');

    return toCamelCase(rows);
  }

  static async findById() {
    const { rows } = await pool.query('SELECT * FROM users WHERE id = $1;', [id]);

    return toCamelCase(rows)[0];
  }

  static async insert(username, bio) {
    const { rows } = await pool.query('INSERT INTO users (username, bio) VALUES ($1, $2);', [username, bio]);

    return toCamelCase(rows)[0];
  }

  static async update() {}

  static async delete() {}
}

module.exports = UserRepo;
