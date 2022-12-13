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
VALUES (1, 'Rustic cabin in a highrise', 'description', 'https://l.icdbcdn.com/oh/60907f50-c4d6-4044-9422-b536a7fdabfa.jpg', 'https://l.icdbcdn.com/oh/60907f50-c4d6-4044-9422-b536a7fdabfa.jpg', 99, 0, 2, 2, 'Canada', '1224-1245 Jane St', 'Toronto', 'On', 'M7H 1E4'),
(2, 'Rooftop patio', 'description', 'https://images.unsplash.com/photo-1449158743715-0a90ebb6d2d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FiaW58ZW58MHx8MHx8&w=1000&q=80', 'https://images.unsplash.com/photo-1449158743715-0a90ebb6d2d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FiaW58ZW58MHx8MHx8&w=1000&q=80', 199, 1, 2, 5, 'Canada', '1224-12 Spadina Rd', 'Toronto', 'On', 'M2H 1E4'),
(3, 'The Crib', 'description', 'https://l.icdbcdn.com/oh/60907f50-c4d6-4044-9422-b536a7fdabfa.jpg', 'https://l.icdbcdn.com/oh/60907f50-c4d6-4044-9422-b536a7fdabfa.jpg', 49, 12, 2, 2, 'Canada', '1224 Hwy 115', 'Moosonee', 'On', 'A7H 1E4'),
(1, 'Speed lamp', 'description', 'https://images.unsplash.com/photo-1449158743715-0a90ebb6d2d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FiaW58ZW58MHx8MHx8&w=1000&q=80', 'https://images.unsplash.com/photo-1449158743715-0a90ebb6d2d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FiaW58ZW58MHx8MHx8&w=1000&q=80', 93061, 6, 4, 8, 'Canada', '536 Namsub Highway', 'Sotboske', 'Quebec', 'A7H 1E4'),
(1, 'Blank corner', 'description', 'https://images.unsplash.com/photo-1449158743715-0a90ebb6d2d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FiaW58ZW58MHx8MHx8&w=1000&q=80', 'https://images.unsplash.com/photo-1449158743715-0a90ebb6d2d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FiaW58ZW58MHx8MHx8&w=1000&q=80', 5234, 6, 6, 7, 'Canada', '651 Nami Road', 'Bohbatev', 'Alberta', '83680'),
(2, 'Habit mix', 'description', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbd5q925ruCN-LwVQryFjyB7--EKXicgXXOCasej4dtVRcGhWxhVvAdMWkkTnwZen9hyY&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbd5q925ruCN-LwVQryFjyB7--EKXicgXXOCasej4dtVRcGhWxhVvAdMWkkTnwZen9hyY&usqp=CAU', 555, 0, 5, 6, 'Canada', '1650 Hejto Center', 'Genwezuj', 'Newfoundland And Labrador', '44583');

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