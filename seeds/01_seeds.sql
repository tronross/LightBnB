-- //////////////////////////////
-- SEEDS FOR TABLES
-- //////////////////////////////


INSERT INTO users (name, email, password)
VALUES ('Oswalt Ruthschager', 'ossie@teddybearz.net', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Caroline Pharoah', 'car123@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Phoebe Fuzz', 'huzzah@phoebe.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties (owner_id, title, thumbail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms country, street, city, province, post_code)
VALUES ('1', 'Rustic cabin in a highrise', 'master/1754.jpg', 'master/1734.jpg', 99, 0, 2, 2, 'Canada', '1224-1245 Jane St', 'Toronto', 'On', 'M7H 1E4'),
('2', 'Rooftop patio', 'master/174.jpg', 'master/14.jpg', 199, 1, 2, 5,'Canada', '1224-12 Spadina Rd', 'Toronto', 'On', 'M2H 1E4'),
('3', 'The Crib', 'master/17354.jpg', 'master/17364.jpg', 49, 12, 2, 2,'Canada', '1224 Hwy 115', 'Moosonee', 'On', 'A7H 1E4');

INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2021-05-05', '2021-05-09', 1, 3),
('2021-02-05', '2021-02-09', 3, 2),
('2021-01-15', '2021-02-19', 2, 1);

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES(1, 3, 1, 5, message),
(3, 2, 2, 4, message),
(2, 1, 3, 5, message);