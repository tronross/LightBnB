-- //////////////////////////////
-- DROP and CREATE TABLES
-- //////////////////////////////


-- DROP TABLES BEFORE REFRESHING DATABASE

DROP TABLE users IF EXISTS CASCADE;
DROP TABLE properties IF EXISTS CASCADE;
DROP TABLE reservations IF EXISTS CASCADE;
DROP TABLE property_reviews IF EXISTS CASCADE;


CREATE TABLE users (
  id INTEGER PRIMARY_KEY NOT NULL,
  name VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255)
);


-- CREATE TABLES (REFRESH DATABASE)

CREATE TABLE properties (
  id INTEGER PRIMARY_KEY NOT NULL,
  owner_id INTEGER FOREIGN_KEY REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(255),
  description TEXT,
  thumbnail_photo_url VARCHAR(255),
  cover_photo_url VARCHAR(255),
  cost_per_night INTEGER,
  parking_spaces INTEGER,
  number_of_bathrooms INTEGER,
  number_of_bedrooms INTEGER,
  country VARCHAR(255),
  street VARCHAR(255),
  city VARCHAR(255),
  province VARCHAR(255),
  post_code VARCHAR(255),
  active BOOLEAN
);

CREATE TABLE reservations (
  id INTEGER PRIMARY_KEY NOT NULL,
  start_date DATE,  
  end_date DATE,
  property_id INTEGER FOREIGN_KEY REFERENCES properties(id) ON DELETE CASCADE,
  guest_id INTEGER FOREIGN_KEY REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE property_reviews (
  id INTEGER PRIMARY_KEY NOT NULL,
  guest_id INTEGER FOREIGN_KEY REFERENCES users(id) ON DELETE CASCADE,
  property_id INTEGER FOREIGN_KEY REFERENCES properties(id) ON DELETE CASCADE,
  reservation_id INTEGER FOREIGN_KEY REFERENCES reservations(id) ON DELETE CASCADE,
  rating SMALLINT,
  message TEXT
);