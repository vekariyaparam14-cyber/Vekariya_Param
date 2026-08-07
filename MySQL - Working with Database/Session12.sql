-- <---------- Session-12 ---------->


-- Task-1
USE foodie_app;
CREATE TABLE Products3 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    rating DECIMAL(2,1)
);

INSERT INTO Products3 VALUES
(1,'Nike Shoes','Footwear',4999,4.8),
(2,'Samsung Galaxy S25','Mobile',74999,4.7),
(3,'Boat Earbuds','Electronics',1999,4.2),
(4,'Levis Jeans','Clothing',2499,4.6),
(5,'Laptop Bag','Accessories',999,4.4);

WITH TopProducts AS (
SELECT * FROM Products3
WHERE rating > 4.5)

SELECT * FROM TopProducts;

-- Task-2
CREATE TABLE Restaurants5 (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    delivery_charge INT
);

INSERT INTO Restaurants5 VALUES
(1,'Dominos','Ahmedabad',40),
(2,'Pizza Hut','Ahmedabad',60),
(3,'Subway','Rajkot',30),
(4,'McDonalds','Surat',25),
(5,'Burger King','Ahmedabad',45);

-- Using subquery
SELECT * FROM (
SELECT * FROM Restaurants5
WHERE city = 'Ahmedabad'
) AS AhmedabadRestaurants
WHERE delivery_charge < 50;

-- Using CTE
WITH AhmedabadRestaurants AS
(SELECT * FROM Restaurants5
 WHERE city = 'Ahmedabad')
 
SELECT * FROM AhmedabadRestaurants
WHERE delivery_charge < 50;

-- Task-3
CREATE TABLE Users2 (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50),
    followers INT
);

INSERT INTO Users2 VALUES
(1,'Amit',2500),
(2,'Priya',5200),
(3,'Rahul',4800),
(4,'Neha',1800),
(5,'Karan',6200);

CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    title VARCHAR(100),
    likes INT
);

INSERT INTO Posts VALUES
(101,'Travel Reel',4500),
(102,'Food Blog',8000),
(103,'Fitness Tips',6200),
(104,'Nature Photo',3200),
(105,'Coding Tricks',9000);

WITH TopUsers AS (
SELECT user_name AS Name,followers AS Value,'User' AS Type FROM Users2
ORDER BY followers DESC
LIMIT 3
),

TopPosts AS (
SELECT title AS Name,likes AS Value,'Post' AS Type FROM Posts
ORDER BY likes DESC
LIMIT 3
)

SELECT * FROM TopUsers
UNION ALL
SELECT * FROM TopPosts;

-- Task-4
WITH RECURSIVE Next7Days AS (
SELECT CURDATE() AS booking_date, 1 AS day_no
UNION ALL
SELECT booking_date + INTERVAL 1 DAY, day_no + 1
FROM Next7Days
WHERE day_no < 7
)

SELECT booking_date
FROM Next7Days;

-- Task-5
-- Messy Query
SELECT * FROM (
SELECT * FROM Users2
WHERE followers > 1000
) AS PopularUsers;

-- CTE
WITH PopularUsers AS (
SELECT * FROM Users2
WHERE followers > 1000
)
SELECT * FROM PopularUsers;