-- <---------- Session-11 ---------->


-- Task.1 :- Create a SQL query using a subquery in the WHERE clause to find all restaurants from a 'Restaurants' table whose average rating is higher than the average rating of all restaurants in the city.
USE foodie_app;

SELECT * FROM RESTAURANTS;

SELECT id, name, rating, city
FROM Restaurants
WHERE rating > (
    SELECT AVG(rating)
    FROM Restaurants
);

-- Task.2 :- Write a SQL query that uses a subquery in the SELECT statement to display each user's name from a 'Users' table along with the total number of orders they have placed from an 'Orders' table, like a summary you might see in a Zomato user profile.
SELECT
    u.id,
    u.username,
    (
        SELECT COUNT(*)
        FROM Orders1 o
        WHERE o.user_id = u.id
    ) AS total_orders
FROM Users1 u;

-- Task.3 :- Given a 'Movies' table and a 'Reviews' table, write a SQL query using IN with a subquery to list all movies that have at least one review with a rating of 5 stars, as seen in BookMyShow's top-rated section.
USE amazon;
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    genre VARCHAR(50),
    release_year INT
);

INSERT INTO Movies VALUES
(1, 'Avengers: Endgame', 'Action', 2019),
(2, 'Spider-Man: No Way Home', 'Action', 2021),
(3, '3 Idiots', 'Comedy', 2009),
(4, 'KGF Chapter 2', 'Action', 2022),
(5, 'Pushpa', 'Action', 2021),
(6, 'Inception', 'Sci-Fi', 2010),
(7, 'Interstellar', 'Sci-Fi', 2014),
(8, 'Dangal', 'Sports', 2016),
(9, 'Jawan', 'Action', 2023),
(10, 'Pathaan', 'Action', 2023);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    movie_id INT,
    user_name VARCHAR(50),
    rating INT,
    review_date DATE,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

INSERT INTO Reviews VALUES
(101, 1, 'Rahul', 5, '2026-01-10'),
(102, 2, 'Amit', 4, '2026-01-12'),
(103, 3, 'Priya', 5, '2026-01-15'),
(104, 4, 'Karan', 3, '2026-01-18'),
(105, 5, 'Sneha', 5, '2026-01-20'),
(106, 6, 'Riya', 4, '2026-01-22'),
(107, 7, 'Vikas', 5, '2026-01-25'),
(108, 8, 'Anjali', 2, '2026-01-27'),
(109, 9, 'Jay', 5, '2026-01-29'),
(110, 10, 'Neha', 3, '2026-02-01');

SELECT movie_id, movie_name, genre
FROM Movies
WHERE movie_id IN 
(SELECT movie_id FROM Reviews
WHERE rating = 5);

-- Task.4 :- Write a nested SQL query to find the names of all sellers from a 'Sellers' table on a Flipkart-style platform who have sold products in every category listed in a 'Categories' table.<br><br><em><strong>Hint:</strong> Use nested subqueries to compare seller's categories with the complete list of categories.</em>
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO Categories VALUES
(1, 'Electronics'),
(2, 'Fashion'),
(3, 'Books'),
(4, 'Home Appliances'),
(5, 'Sports');

CREATE TABLE Sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(50)
);

INSERT INTO Sellers VALUES
(101, 'TechWorld'),
(102, 'FashionHub'),
(103, 'MegaStore'),
(104, 'BookPlanet'),
(105, 'SuperMart');

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    seller_id INT,
    category_id INT,
    FOREIGN KEY (seller_id) REFERENCES Sellers(seller_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

INSERT INTO Products VALUES
(1, 'Laptop', 101, 1),
(2, 'Mobile Phone', 101, 1),
(3, 'Shirt', 102, 2),
(4, 'Novel', 104, 3),
(5, 'Microwave', 103, 4),
(6, 'Football', 103, 5),
(7, 'Headphones', 103, 1),
(8, 'Jeans', 103, 2),
(9, 'Story Book', 103, 3),
(10, 'Refrigerator', 105, 4),
(11, 'Sports Shoes', 105, 5),
(12, 'Tablet', 105, 1);

SELECT seller_name FROM Sellers s
WHERE NOT EXISTS 
(SELECT category_id FROM Categories c
WHERE NOT EXISTS 
(SELECT product_id FROM Products p
WHERE p.seller_id = s.seller_id AND p.category_id = c.category_id)
);