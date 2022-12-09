CREATE TABLE users (
  id INTEGER PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255)
);

CREATE TABLE reservations (
  id INTEGER PRIMARY KEY NOT NULL,
  start_date DATE,  
  end_date DATE,
  property_id INTEGER FOREIGN_KEY REFERENCES properties(id) ON DELETE CASCADE,
  guest_id INTEGER FOREIGN_KEY REFERENCES users(id)
)