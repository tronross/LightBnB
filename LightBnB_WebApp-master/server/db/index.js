/////////////////////////////
// Central Query Portal
/////////////////////////////

require('dotenv').config();

const { Pool } = require('pg');

const pool = new Pool({
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  host: process.env.DB_HOST,
  database: process.env.DB_DATABASE
});

module.exports = {
  query: (text, params, callback) => {
    return pool.query(text, params, callback)
  },
}