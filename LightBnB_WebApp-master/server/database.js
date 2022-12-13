const properties = require('./json/properties.json');
const users = require('./json/users.json');
require('dotenv').config();

console.log(process.env.DB_DATABASE);

const { Pool } = require('pg');

const pool = new Pool({
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  host: process.env.DB_HOST,
  database: process.env.DB_DATABASE
});


/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = (email) => {
  return pool
    .query(`SELECT * FROM users WHERE email = $1`, [email])
    .then((result) => {
      return result.rows[0];
    })
    .catch((err) => {
      console.log(err.message);
    });
};
getUserWithEmail('car123@hotmail.com');
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = (id) => {
  return pool
    .query(`SELECT * FROM users WHERE id = $1`, [id])
    .then((result) => {
      return result.rows[0];
    })
    .catch((err) => {
      console.log(err.message);
    });
};

exports.getUserWithId = getUserWithId;

/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */

const addUser = (user) => {
  return pool
    .query(`INSERT INTO users (name, email, password)
    VALUES($1, $2, $3)
    RETURNING *;`, [user.name, user.email, user.password])
    .then((result) => {
      return result.rows;
    })
    .catch((err) => {
      console.log(err.message);
    });
};
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */

const getAllReservations = (guest_id, limit = 10) => {
  return pool
    .query(`SELECT reservations.*, properties.title, properties.cost_per_night, 
    avg(property_reviews.rating) as average_rating
    FROM reservations
    JOIN properties ON reservations.property_id = properties.id
    JOIN property_reviews ON properties.id = property_reviews.property_id
    WHERE reservations.guest_id = $1
    GROUP BY reservations.id, properties.id
    ORDER BY reservations.start_date
    LIMIT $2`, [guest_id, limit])
    .then((result) => {
      return result.rows;
    })
    .catch((err) => {
      console.log(err.message);
    });
};
exports.getAllReservations = getAllReservations;

/// Properties
/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */

const getAllProperties = (options, limit = 10) => {
  const queryParams = [];

  let queryString = `SELECT properties.*, avg(property_reviews.rating) as average_rating
    FROM properties 
    JOIN property_reviews ON properties.id = property_id
  `;
  
  // city
  if (options.city) {
    queryParams.push(`%${options.city}%`);
    queryString += `WHERE city LIKE $${queryParams.length} `;
  }

  // owner_id
  if (options.owner_id) {
    if (queryParams.length > 1) {
      queryString += `AND `;
    }
    queryParams.push(Number(options.owner_id));
    queryString += `WHERE owner_id = $${queryParams.length} `;
  }
  
  queryString += `GROUP BY properties.id `;

  // pricing
  if (options.minimum_price_per_night && options.maximum_price_per_night) {
    queryParams.push(Number(options.minimum_price_per_night), Number(options.maximum_price_per_night));
    queryString += `HAVING cost_per_night >= $${queryParams.length - 1} AND cost_per_night <= $${queryParams.length} `;
  } else if (options.minimum_price_per_night) {
    queryParams.push(Number(options.minimum_price_per_night));
    queryString += `HAVING cost_per_night >= $${queryParams.length} `;
  } else if (options.maximum_price_per_night) {
    queryParams.push(Number(options.maximum_price_per_night));
    queryString += `HAVING cost_per_night <= $${queryParams.length} `;
  }

  // minimum rating
  if (options.minimum_price_per_night || options.maximum_price_per_night && options.minimum_rating) {
    queryParams.push(Number(options.minimum_rating));
    queryString += `AND avg(property_reviews.rating) >= $${queryParams.length} `;
  } else if (options.minimum_rating) {
    queryParams.push(Number(options.minimum_rating));
    queryString += `HAVING avg(property_reviews.rating) >= $${queryParams.length} `;
  }

  // limit
  queryParams.push(limit);
  queryString += `
  ORDER BY cost_per_night
  LIMIT $${queryParams.length};
  `;
 
  // submit query
  return pool.query(queryString, queryParams).then((res) => res.rows)
    .catch((err) => {
      console.log(err.message);
    });
};






exports.getAllProperties = getAllProperties;

/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
};
exports.addProperty = addProperty;
