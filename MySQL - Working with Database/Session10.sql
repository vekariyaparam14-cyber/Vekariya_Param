-- <---------- Session-10 ---------->

-- Task-1. :-  Create two tables: Influencers (id, name) and Collaborations (id, influencer1_id, influencer2_id, collab_date). Write a SQL FULL JOIN query to list all influencers and show their collaboration partner names if any, including influencers with no collaborations.
USE music_streaming_app;
CREATE TABLE influencers(
id INT PRIMARY KEY,
name VARCHAR(20)
);

CREATE TABLE collaborations(
id INT PRIMARY KEY,
influencer1_id INT,
influencer2_id INT,
collab_date DATE,
FOREIGN KEY (influencer1_id) REFERENCES influencers(id),
FOREIGN KEY (influencer2_id) REFERENCES influencers(id)
);

INSERT INTO influencers VALUES
(1,"Aman Sharma"),
(2,"Priya Verma"),
(3,"Neha Soni"),
(4,"Karan Mehta"),
(5,"Ramesh Shah");

INSERT INTO collaborations VALUES
(1,1,2,'2025-01-15'),
(2,2,3,'2025-02-10'),
(3,1,4,'2025-05-13'),
(4,3,4,'2025-07-19'),
(5,2,4,'2025-10-05');

SELECT i1.name AS influencer_name, i2.name AS collaboration_partner, c.collab_date FROM influencers i1
LEFT JOIN collaborations c
ON i1.id = c.influencer1_id
LEFT JOIN influencers i2
ON c.influencer2_id = i2.id 
UNION
SELECT i2.name AS influencer_name, i1.name AS collaboration_partner, c.collab_date FROM influencers i2
LEFT JOIN collaborations c
ON i2.id = c.influencer2_id
LEFT JOIN influencers i1
ON c.influencer1_id = i1.id ;


-- Task-2. :- Using a SELF JOIN, write a query on a table called Playlists (id, user_id, playlist_name, parent_playlist_id) to display each playlist alongside its parent playlist name, similar to how Spotify shows nested playlists.<br><br><em><strong>Hint:</strong> Join Playlists with itself on parent_playlist_id = id.</em>
CREATE TABLE Playlists2(
id INT PRIMARY KEY,
user_id INT,
playlist_name VARCHAR(100),
parent_playlist_id INT,
FOREIGN KEY (parent_playlist_id) REFERENCES Playlists2(id)
);

INSERT INTO Playlists2 VALUES
(1, 101, 'Music', NULL),
(2, 101, 'Pop Songs', 1),
(3, 101, 'Rock Hits', 1),
(4, 102, 'Workout', NULL),
(5, 102, 'Gym Mix', 4);

SELECT p1.playlist_name AS playlist, p2.playlist_name AS parent_playlist
FROM Playlists2 p1
LEFT JOIN Playlists2 p2
ON p1.parent_playlist_id = p2.id;


-- Task-3. Given three tables: Users (id, username), Orders (id, user_id, order_date), and Payments (id, order_id, amount), write a SQL query using multiple JOINs to display each username, their order date, and payment amount, showing all users even if they have no orders or payments.
USE foodie_app;
CREATE TABLE Users1 (
    id INT PRIMARY KEY,
    username VARCHAR(100)
);

CREATE TABLE Orders1 (
    id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users1(id)
);

CREATE TABLE Payments (
    id INT PRIMARY KEY,
    order_id INT,
    amount INT,
    FOREIGN KEY (order_id) REFERENCES Orders1(id)
);

INSERT INTO Users1 VALUES
(1, 'Amit'),
(2, 'Sneha'),
(3, 'Rahul'),
(4, 'Priya'),
(5, 'Karan');

INSERT INTO Orders1 VALUES
(101, 1, '2026-01-10'),
(102, 2, '2026-01-15'),
(103, 3, '2026-02-01'),
(104, 1, '2026-02-10');

INSERT INTO Payments VALUES
(1, 101, 1200),
(2, 102, 850),
(3, 103, 500),
(4, 104, 1500);

SELECT u.username,o.order_date,p.amount FROM Users1 u
LEFT JOIN Orders1 o
ON u.id = o.user_id
LEFT JOIN Payments p
ON o.id = p.order_id;


-- Task-4. :- You notice that your JOIN query between Zomato's Restaurants and Reviews tables is returning duplicate rows for some restaurants. Modify your query to eliminate duplicates and explain in one line why the duplicates were happening.<br><br><em><strong>Hint:</strong> Use DISTINCT or GROUP BY and consider the relationship between restaurants and reviews.</em>
CREATE TABLE Restaurants4 (
    id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Reviews (
    id INT PRIMARY KEY,
    restaurant_id INT,
    review_text VARCHAR(255),
    rating INT,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants4(id)
);

INSERT INTO Restaurants4 VALUES
(1, 'Spice Hub', 'Ahmedabad'),
(2, 'Pizza World', 'Surat'),
(3, 'Food Palace', 'Vadodara');

INSERT INTO Reviews VALUES
(1, 1, 'Excellent food', 5),
(2, 1, 'Nice ambience', 4),
(3, 2, 'Good pizza', 5),
(4, 2, 'Average service', 3),
(5, 3, 'Loved the desserts', 5);

SELECT DISTINCT r.restaurant_name,rv.review_text,rv.rating FROM Restaurants4 r
JOIN Reviews rv
ON r.id = rv.restaurant_id;

-- Explanation:
-- Duplicates occurred because one restaurant can have multiple reviews , causing repeated restaurant records after the JOIN.


-- Task-5.:- Write two different JOIN queries on a Products and Categories table (like Flipkart) to list all products with their category names, but use different join conditions in each. Briefly explain which join condition is more efficient and why.
CREATE TABLE Categories (
    id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE Products1 (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price INT,
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

INSERT INTO Categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');

INSERT INTO Products1 VALUES
(101, 'Laptop', 1, 55000),
(102, 'Smartphone', 1, 25000),
(103, 'T-Shirt', 2, 799),
(104, 'Jeans', 2, 1499),
(105, 'SQL Basics Book', 3, 599);

SELECT p.product_name,c.category_name FROM Products1 p
INNER JOIN Categories c
ON p.category_id = c.id;

SELECT product_name,category_name FROM Products1 p
INNER JOIN Categories c
USING (category_id);

-- Efficiency:
-- JOIN ... ON is generally more flexible and commonly used because it supports different column names and complex join conditions.
-- JOIN ... USING is shorter and easier to read but only works when both tables have the same column name.