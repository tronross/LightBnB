-- //////////////////////////////
-- SEEDS FOR TABLES
-- //////////////////////////////


INSERT INTO users (name, email, password)
VALUES ('Oswalt Ruthschager', 'ossie@teddybearz.net', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Caroline Pharoah', 'car123@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Phoebe Fuzz', 'huzzah@phoebe.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Eva Stanley', 'sebastianguerra@ymail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Louisa Meyer', 'jacksonrose@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Dominic Parks', 'victoriablackwell@outlook.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code)
VALUES (1, 'Rustic cabin in a highrise', 'description', 'master/1754.jpg', 'master/1734.jpg', 99, 0, 2, 2, 'Canada', '1224-1245 Jane St', 'Toronto', 'On', 'M7H 1E4'),
(2, 'Rooftop patio', 'description', 'master/174.jpg', 'master/14.jpg', 199, 1, 2, 5, 'Canada', '1224-12 Spadina Rd', 'Toronto', 'On', 'M2H 1E4'),
(3, 'The Crib', 'description', 'master/17354.jpg', 'master/17364.jpg', 49, 12, 2, 2, 'Canada', '1224 Hwy 115', 'Moosonee', 'On', 'A7H 1E4'),
(1, 'Speed lamp', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 93061, 6, 4, 8, 'Canada', '536 Namsub Highway', 'Sotboske', 'Quebec', 'A7H 1E4'),
(1, 'Blank corner', 'description', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', 5234, 6, 6, 7, 'Canada', '651 Nami Road', 'Bohbatev', 'Alberta', '83680'),
(2, 'Habit mix', 'description', 'https://images.pexels.com/photos/2080018/pexels-photo-2080018.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2080018/pexels-photo-2080018.jpeg', 555, 0, 5, 6, 'Canada', '1650 Hejto Center', 'Genwezuj', 'Newfoundland And Labrador', '44583');

INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2021-05-05', '2021-05-09', 1, 1),
('2021-02-05', '2021-02-09', 2, 2),
('2021-01-15', '2021-02-19', 3, 3),
('2018-09-11', '2018-09-26', 2, 3),
('2019-01-04', '2019-02-01', 2, 2);

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES(1, 3, 1, 5, 'message'),
(3, 2, 2, 4, 'message'),
(2, 1, 3, 5, 'message'),
(3, 2, 1, 3, 'massages'),
(2, 2, 2, 4, 'messes'),
(3, 1, 3, 4, 'messages');