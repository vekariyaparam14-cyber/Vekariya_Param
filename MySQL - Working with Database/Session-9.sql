-- <---------- Session-9 ---------->

-- Task.1 :-Create two tables in your database: 'restaurants' (id, name, city) and 'dishes' (id, restaurant_id, dish_name, price). Insert at least 3 restaurants and 2-3 dishes for each restaurant.
USE music_streaming_app;

CREATE TABLE Restaurants
(
id INT,
name VARCHAR(20),
city VARCHAR(15)
);	

INSERT INTO Restaurants
VALUES
(1, 'Spice Garden', 'Ahmedabad'),
(2, 'Pizza Hub','Surat'),
(3, 'Royal Biryani','Rajkot'),
(4, 'Green Leaf Cafe','Vadodara'),
(5, 'South Express', 'Gandhinagar'),
(6, 'Spice Villa','Ahmedabad'),
(7, 'Dragon Wok','Surat'),
(8, 'Pasta Paradise', 'Rajkot'),
(9, 'Burger Junction', 'Vadodara'),
(10, 'Ocean Delight','Jamnagar');

CREATE TABLE dishes (
    restaurant_id INT,
    dish_name VARCHAR(50),
    price DECIMAL(10,2)
);
INSERT INTO dishes (restaurant_id, dish_name, price)
VALUES
(6, 'Paneer Butter Masala', 280.00),
(1, 'Veg Biryani', 220.00),
(6, 'Butter Naan', 40.00),
(2, 'Hakka Noodles', 180.00),
(7, 'Manchurian', 200.00),
(4, 'Spring Rolls', 150.00),
(8, 'White Sauce Pasta', 250.00),
(11, 'Margherita Pizza', 300.00),
(8, 'Garlic Bread', 120.00),
(9, 'Cheese Burger', 160.00),
(9, 'French Fries', 90.00),
(10, 'Cold Coffee', 110.00);


-- Task.2 :- Write an SQL INNER JOIN query to display each dish along with its restaurant name and city, similar to how Zomato shows dish details with the restaurant info.
SELECT * FROM Restaurants as r
INNER JOIN dishes as d
ON r.id = d.restaurant_id;

-- Task.3 :- Write an SQL LEFT JOIN query to list all restaurants and their dishes, showing restaurants even if they currently have no dishes on the menu.
-- Hint: Use LEFT JOIN so restaurants without dishes still appear in the results with NULL for dish columns
SELECT * FROM Restaurants as r
LEFT JOIN dishes as d
ON r.id = d.restaurant_id;

-- Task.4 :- Write an SQL RIGHT JOIN query to display all dishes and their restaurant names, including any dishes that might not be linked to a restaurant (simulate a data error where a dish has a restaurant_id that doesn't match any restaurant).
SELECT d.dish_name, id , name FROM Restaurants as r
RIGHT JOIN dishes as d
ON r.id = d.restaurant_id;

-- Task.5 :- Given this scenario: You want to show a list of all playlists and the songs inside them, like Spotify. Explain which JOIN type (INNER, LEFT, or RIGHT) you would use to show all playlists, even if some are empty, and write the SQL query for it.
/*
A LEFT JOIN returns

All records from the left table (playlists).
Matching records from the right table (songs).
NULL values if there is no matching song.
*/

SELECT s.song_id, s.song_name,s.playlist_id,playlist_name
FROM playlist AS  p
LEFT JOIN songs AS s
ON p.playlist_id = s.playlist_id;

