-- //////////////////////////////
-- DROP and CREATE TABLES
-- //////////////////////////////


-- DROP TABLES BEFORE REFRESHING DATABASE

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS properties CASCADE;
DROP TABLE IF EXISTS reservations CASCADE;
DROP TABLE IF EXISTS property_reviews CASCADE;


-- CREATE TABLES (REFRESH DATABASE)

CREATE TABLE users (
  id INTEGER PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255)
);

-- CREATE TABLE properties (
--   id INTEGER PRIMARY KEY NOT NULL,
--   owner_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
--   title VARCHAR(255),
--   description TEXT,
--   thumbnail_photo_url VARCHAR(255),
--   cover_photo_url VARCHAR(255),
--   cost_per_night INTEGER,
--   parking_spaces INTEGER,
--   number_of_bathrooms INTEGER,
--   number_of_bedrooms INTEGER,
--   country VARCHAR(255),
--   street VARCHAR(255),
--   city VARCHAR(255),
--   province VARCHAR(255),
--   post_code VARCHAR(255),
--   active BOOLEAN
-- );

-- CREATE TABLE reservations (
--   id INTEGER PRIMARY KEY NOT NULL,
--   start_date DATE,  
--   end_date DATE,
--   property_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
--   guest_id INTEGER REFERENCES users(id) ON DELETE CASCADE
-- );

-- CREATE TABLE property_reviews (
--   id INTEGER PRIMARY KEY NOT NULL,
--   guest_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
--   property_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
--   reservation_id INTEGER REFERENCES reservations(id) ON DELETE CASCADE,
--   rating SMALLINT,
--   message TEXT
-- );