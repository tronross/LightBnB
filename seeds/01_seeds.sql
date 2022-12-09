-- //////////////////////////////
-- SEEDS FOR TABLES
-- //////////////////////////////


INSERT INTO users (name, email, password)
VALUES ('Oswalt Ruthschager', 'ossie@teddybearz.net', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Caroline Pharoah', 'car123@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Phoebe Fuzz', 'huzzah@phoebe.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.')

INSERT INTO properties (owner_id, title, thumbail_photo_url, cover_photo_url, country, street, city, province, post_code)
VALUES ('1', 'Rustic cabin in a highrise', 'master/1754.jpg', 'master/1734.jpg', 'Canada', '1224-1245 Jane St', 'Toronto', 'On', 'M7H 1E4')
VALUES ('2', 'Rooftop patio', 'master/174.jpg', 'master/14.jpg', 'Canada', '1224-12 Spadina Rd', 'Toronto', 'On', 'M2H 1E4')
VALUES ('3', 'The Crib', 'master/17354.jpg', 'master/17364.jpg', 'Canada', '1224 Hwy 115', 'Moosonee', 'On', 'A7H 1E4')

