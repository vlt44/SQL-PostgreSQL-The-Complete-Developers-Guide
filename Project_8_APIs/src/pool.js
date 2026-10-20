const pg = require("pg");

// connecting to multiple databases
class Pool {
  _pool = null;

  connect(options) {
    this._pool = new pg.Pool(options);
  }
}

module.exports = new Pool();