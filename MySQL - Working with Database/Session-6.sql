-- <---------- Session-6 ---------->


-- Task.1 :- Write an SQL query to display all products from a 'products' table and sort them by price in ascending order, similar to how Flipkart lists items from lowest to highest price.
USE Foodie_App; 
CREATE TABLE Products
(
id INT,
product_name VARCHAR(30),
price DECIMAL(10,2)
);

INSERT INTO Products
VALUES
(1, 'Laptop', 55000.00),
(2, 'Smartphone', 25000.00),
(3, 'Headphones', 1800.00),
(4, 'Keyboard', 1200.00),
(5, 'Mouse', 750.00),
(6, 'Smart Watch', 4500.00),
(7, 'Bluetooth Speaker', 2200.00),
(8, 'Power Bank', 1500.00),
(9, 'USB Cable', 250.00),
(10, 'Monitor', 12000.00),
(11, 'Printer', 8500.00),
(12, 'Webcam', 3200.00),
(13, 'Router', 2800.00),
(14, 'External Hard Drive', 6500.00),
(15, 'Tablet', 18000.00);

SELECT * FROM Products
ORDER BY price ASC;


-- Task.2 :-Modify your previous query to show the top 5 most expensive products using ORDER BY with DESC and LIMIT.
SELECT * FROM Products
ORDER BY price ASC
LIMIT 5;

-- Task.3 :- Given a 'movies' table with columns 'title', 'release_year', and 'rating', write an SQL query to list all movies sorted first by release_year in descending order (latest first), then by rating in descending order (highest rated first).
CREATE Table Movies
(
Title VARCHAR(50),
Release_year YEAR,
rating DECIMAL(2,1) 
);

INSERT INTO Movies
VALUES
('Inception', 2010, 8.8),
('The Dark Knight', 2008, 9.0),
('Interstellar', 2014, 8.7),
('Avengers: Endgame', 2019, 8.4),
('Spider-Man: No Way Home', 2021, 8.2),
('Titanic', 1997, 7.9),
('Joker', 2019, 8.4),
('Avatar', 2009, 7.8),
('3 Idiots', 2009, 8.4),
('Dangal', 2016, 8.3);

SELECT * FROM Movies
ORDER BY release_year DESC;

SELECT * FROM Movies
ORDER BY rating DESC;

-- Task.4 :- Write an SQL query to display the first 10 restaurants from a 'restaurants' table, sorted alphabetically by name, just like Zomato's A-Z listing.
-- Hint: Use ORDER BY with LIMIT
SELECT * FROM Restaurants
ORDER BY name ASC
LIMIT 5; -- I have only 10 rows in my data so i use limit 5

--  Task.5 :- Suppose you want to display the top 3 trending songs from a 'songs' table based on play_count, but if two songs have the same play_count, the more recently added song should come first. Write the SQL query to achieve this.
-- Hint: Use ORDER BY with multiple columns.
CREATE TABLE songs (
    song_id INT,
    title VARCHAR(50),
    artist VARCHAR(50),
    play_count INT,
    added_date DATE
);

INSERT INTO songs
VALUES
(1, 'Shape of You', 'Ed Sheeran', 8500, '2026-07-15'),
(2, 'Blinding Lights', 'The Weeknd', 9200, '2026-07-16'),
(3, 'Levitating', 'Dua Lipa', 7800, '2026-07-18'),
(4, 'Stay', 'The Kid LAROI', 9200, '2026-07-20'),
(5, 'Perfect', 'Ed Sheeran', 6800, '2026-07-22'),
(6, 'Believer', 'Imagine Dragons', 7400, '2026-07-23'),
(7, 'Closer', 'The Chainsmokers', 8100, '2026-07-25'),
(8, 'Senorita', 'Shawn Mendes', 9200, '2026-07-28'),
(9, 'Bad Habits', 'Ed Sheeran', 7600, '2026-07-29'),
(10, 'Heat Waves', 'Glass Animals', 8900, '2026-07-30'),
(11, 'Industry Baby', 'Lil Nas X', 6500, '2026-07-31'),
(12, 'As It Was', 'Harry Styles', 9200, '2026-08-01'),
(13, 'Calm Down', 'Rema', 8400, '2026-08-03'),
(14, 'Starboy', 'The Weeknd', 9200, '2026-08-03'),
(15, 'Unstoppable', 'Sia', 7000, '2026-08-04');

SELECT * FROM songs
ORDER BY DATE(added_date) DESC
LIMIT 3;
