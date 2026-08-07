-- <---------- Session-5 ---------->

-- Task.1 :- Create a table called Restaurants with columns: id, name, cuisine, rating, and city. Insert at least 5 sample records representing real or fictional restaurants you might find on Zomato.
USE foodie_app;

CREATE TABLE Restaurants
(
id INT,
name VARCHAR(20),
cuisine VARCHAR(30),
rating DECIMAL(2,1),
city VARCHAR(15)
);	

INSERT INTO Restaurants
VALUES
(1, 'Spice Garden', 'North Indian', 4.5, 'Ahmedabad'),
(2, 'Pizza Hub', 'Italian', 4.2, 'Surat'),
(3, 'Royal Biryani', 'Mughlai', 4.7, 'Rajkot'),
(4, 'Green Leaf Cafe', 'Continental', 4.1, 'Vadodara'),
(5, 'South Express', 'South Indian', 4.6, 'Gandhinagar'),
(6, 'Spice Villa', 'Indian', 4.3, 'Ahmedabad'),
(7, 'Dragon Wok', 'Chinese', 4.1, 'Surat'),
(8, 'Pasta Paradise', 'Italian', 4.5, 'Rajkot'),
(9, 'Burger Junction', 'Fast Food', 4.0, 'Vadodara'),
(10, 'Ocean Delight', 'Seafood', 4.4, 'Jamnagar');

SELECT * FROM Restaurants;


-- Task.2 :- Write a SQL query to find all restaurants in the Restaurants table that have a rating greater than 4.0 and are located in either 'Ahmedabad' or 'Surat'.
SELECT * FROM Restaurants
WHERE rating > 4.0 AND city IN ("Ahmedabad","Surat");


-- Task.3 :- Using the LIKE operator, write a query to select all restaurants whose names start with 'Swa' (for example, 'Swagat', 'Swadisht') from the Restaurants table.
-- Hint: Use LIKE 'Swa%'.
SELECT * FROM Restaurants
WHERE name LIKE "S%";
-- NOTE:- In my data i have no any names which start from 'SWA' so I have use 'S'.


-- Task.4 :- Write a SQL query using the BETWEEN keyword to find all restaurants in the Restaurants table with a rating between 3.5 and 4.5 (inclusive).
SELECT * FROM Restaurants
WHERE rating BETWEEN 3.5 AND 4.5;


-- Task.5 :- Write a query to find all restaurants whose cuisine is either 'Chinese', 'Italian', or 'South Indian' using the IN operator.
SELECT * FROM Restaurants
WHERE cuisine IN ("Chinese","Italian","South Indian");