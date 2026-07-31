-- <---------- Session-4 ---------->

-- Task.1 :- Create a table named MusicPlaylist with columns: id, song_name, artist, genre, and duration. Insert at least 5 records representing songs from your favorite Spotify playlist, then write a SELECT statement to retrieve all columns for all songs.

CREATE TABLE Music_Playlist
(
Id INT,
Song_name VARCHAR(50),
Artist VARCHAR(20),
Genre VARCHAR(20),
Duration INT
);

INSERT INTO Music_Playlist
VALUES
(1,"Hanuman Chalisa","Aditya Gadhvi","Bhajan",600),
(2,"Deva Deva","Arjit Singh","Bollywood",300),
(3,"Thakar Mane Jiv Thi Vala","Zenisha Ahir","Devoition",200),
(4,"Somnath Mahadev","Amit Dhorda","Bhajan Flok",180),
(5,"Victory Anthem","Khushi TDT","Hip-Hop",150);

SELECT* FROM Music_Playlist;

-- Task.2 :- Write a SQL query to display only the song_name and artist columns from the MusicPlaylist table, showing just the first 3 records using the LIMIT keyword.

SELECT Song_name, Artist FROM Music_Playlist
LIMIT 3;

-- Task.3 :- Suppose you have a table named FoodOrders with columns: id, restaurant, food_item, and order_date. Write a SQL query to list all unique restaurant names where you have placed orders, using the DISTINCT keyword.

CREATE TABLE FoodOrders (
    id INT PRIMARY KEY,
    restaurant VARCHAR(100),
    food_item VARCHAR(100),
    order_date DATE
);

INSERT INTO 
FoodOrders (id, restaurant, food_item, order_date)
VALUES
(1, 'Domino''s', 'Veg Pizza', '2026-07-01'),
(2, 'McDonald''s', 'Burger', '2026-07-02'),
(3, 'Domino''s', 'Garlic Bread', '2026-07-03'),
(4, 'KFC', 'Chicken Bucket', '2026-07-04'),
(5, 'Subway', 'Veg Sandwich', '2026-07-05'),
(6, 'McDonald''s', 'French Fries', '2026-07-06'),
(7, 'Pizza Hut', 'Cheese Pizza', '2026-07-07'),
(8, 'Domino''s', 'Pasta', '2026-07-08'),
(9, 'KFC', 'Zinger Burger', '2026-07-09'),
(10, 'Subway', 'Wrap', '2026-07-10');

SELECT Distinct restaurant FROM FoodOrders;

-- Task.4 :- Write a SQL query on the FoodOrders table to select food_item as 'Dish' and order_date as 'Date Ordered', displaying only these two columns with the column aliases in the output.

SELECT food_item as "Dish", order_date as "Date Ordered" 
FROM  FoodOrders;

-- Task.5 :- You tried running this query: SELECT DISTINCT food_item, restaurant FROM FoodOrders LIMIT 2, but it returns an error or doesn't work as expected. Identify and fix the mistake in the query.<br><br><em><strong>Hint:</strong> Check the correct placement and usage of the LIMIT keyword in SQL syntax.</em>

SELECT DISTINCT food_item, restaurant 
FROM FoodOrders 
LIMIT 2;
/* Here Error is Synatx Error and It is Fixed By doing Semicolon At the Last*/