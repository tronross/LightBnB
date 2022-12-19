// // require external database query portal
// const db = require('../db');

// /////////////////////////////////////////////////
// // DATABASE QUERY FUNCTIONS
// /////////////////////////////////////////////////


// /// Users

// /**
//  * Get a single user from the database given their email.
//  * @param {String} email The email of the user.
//  * @return {Promise<{}>} A promise to the user.
//  */
// const getUserWithEmail = (email) => {
//   return db
//     .query(`SELECT * FROM users
//             WHERE email = $1`, [email])
//     .then((result) => {
//       return result.rows[0];
//     })
//     .catch((err) => {
//       console.log(err.message);
//     });
// };

// exports.getUserWithEmail = getUserWithEmail;

// /**
//  * Get a single user from the database given their id.
//  * @param {string} id The id of the user.
//  * @return {Promise<{}>} A promise to the user.
//  */
// const getUserWithId = (id) => {
//   return db
//     .query(`SELECT * FROM users
//             WHERE id = $1`, [id])
//     .then((result) => {
//       return result.rows[0];
//     })
//     .catch((err) => {
//       console.log(err.message);
//     });
// };

// exports.getUserWithId = getUserWithId;

// /**
//  * Add a new user to the database.
//  * @param {{name: string, password: string, email: string}} user
//  * @return {Promise<{}>} A promise to the user.
//  */

// const addUser = (user) => {
//   return db
//     .query(`INSERT INTO users (name, email, password)
//             VALUES($1, $2, $3)
//             RETURNING *;`, [user.name, user.email, user.password])
//     .then((result) => {
//       return result.rows;
//     })
//     .catch((err) => {
//       console.log(err.message);
//     });
// };
// exports.addUser = addUser;

// /// Reservations

// /**
//  * Get all reservations for a single user.
//  * @param {string} guest_id The id of the user.
//  * @return {Promise<[{}]>} A promise to the reservations.
//  */

// const getAllReservations = (guest_id, limit = 10) => {
//   return db
//     .query(`SELECT reservations.*, properties.*,
//             avg(property_reviews.rating) as average_rating
//             FROM reservations
//             JOIN properties ON reservations.property_id = properties.id
//             JOIN property_reviews ON properties.id = property_reviews.property_id
//             WHERE reservations.guest_id = $1
//             GROUP BY reservations.id, properties.id
//             ORDER BY reservations.start_date
//             LIMIT $2`, [guest_id, limit])
//     .then((result) => {
//       return result.rows;
//     })
//     .catch((err) => {
//       console.log(err.message);
//     });
// };
// exports.getAllReservations = getAllReservations;

// /// Properties
// /**
//  * Get all properties.
//  * @param {{}} options An object containing query options.
//  * @param {*} limit The number of results to return.
//  * @return {Promise<[{}]>}  A promise to the properties.
//  */

// const getAllProperties = (options, limit = 10) => {
//   const queryParams = [];
//   // necessary for all getAllProperties queries
//   let queryString = `SELECT properties.*, avg(property_reviews.rating) as average_rating
//                      FROM properties 
//                      JOIN property_reviews ON properties.id = property_id
//                      `;
  
//   // city
//   if (options.city) {
//     queryParams.push(`%${options.city}%`);
//     queryString += `WHERE city LIKE $${queryParams.length} `;
//   }

//   // owner_id
//   if (options.owner_id) {
//     if (queryParams.length > 1) {
//       queryString += `AND `;
//     }
//     queryParams.push(Number(options.owner_id));
//     queryString += `WHERE owner_id = $${queryParams.length} `;
//   }
  
//   // necessary for all getAllProperties queries
//   queryString += `GROUP BY properties.id `;

//   // pricing options
//   if (options.minimum_price_per_night && options.maximum_price_per_night) {
//     queryParams.push(Number(options.minimum_price_per_night), Number(options.maximum_price_per_night));
//     queryString += `HAVING cost_per_night >= $${queryParams.length - 1} AND cost_per_night <= $${queryParams.length} `;
//   } else if (options.minimum_price_per_night) {
//     queryParams.push(Number(options.minimum_price_per_night));
//     queryString += `HAVING cost_per_night >= $${queryParams.length} `;
//   } else if (options.maximum_price_per_night) {
//     queryParams.push(Number(options.maximum_price_per_night));
//     queryString += `HAVING cost_per_night <= $${queryParams.length} `;
//   }

//   // minimum rating
//   if (options.minimum_price_per_night || options.maximum_price_per_night && options.minimum_rating) {
//     queryParams.push(Number(options.minimum_rating));
//     queryString += `AND avg(property_reviews.rating) >= $${queryParams.length} `;
//   } else if (options.minimum_rating) {
//     queryParams.push(Number(options.minimum_rating));
//     queryString += `HAVING avg(property_reviews.rating) >= $${queryParams.length} `;
//   }

//   // limit and ORDER BY
//   queryParams.push(limit);
//   queryString += `
//                   ORDER BY cost_per_night
//                   LIMIT $${queryParams.length};
//                   `;
 
//   // submit query
//   return db.query(queryString, queryParams).then((res) => res.rows)
//     .catch((err) => {
//       console.log(err.message);
//     });
// };
// exports.getAllProperties = getAllProperties;

// /**
//  * Add a property to the database
//  * @param {{}} property An object containing all of the property details.
//  * @return {Promise<{}>} A promise to the property.
//  */
// const addProperty = (property) => {
//   return db
//     .query(`INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, street, city, province, post_code, country, parking_spaces, number_of_bathrooms, number_of_bedrooms)
//             VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)
//             RETURNING *;`, [property.owner_id, property.title, property.description, property.thumbnail_photo_url, property.cover_photo_url, property.cost_per_night, property.street, property.city, property.province, property.post_code, property.country, property.parking_spaces, property.number_of_bathrooms, property.number_of_bedrooms])
//     .then((result) => {
//       return result.rows;
//     })
//     .catch((err) => {
//       console.log(err.message);
//     });
// };
// exports.addProperty = addProperty;
