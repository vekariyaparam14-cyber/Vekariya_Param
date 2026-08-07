-- <---------- Session-7 ---------->


-- Task.1 :- Create a table called Orders with columns: order_id, user_name, total_amount, and order_date. Insert 5 sample rows with different users and order amounts, including at least one NULL value for total_amount.
USE foodie_app;

CREATE TABLE Order1
(
order_id INT,
user_name VARCHAR(30),
total_amount DECIMAL(10,2),
order_date DATE
);

INSERT INTO Order1
VALUES
(101, 'Rahul', 1250.50, '2026-08-01'),
(102, 'Priya', 890.00, '2026-08-02'),
(103, 'Amit', NULL, '2026-08-03'),
(104, 'Sneha', 450.75, '2026-08-04'),
(105, 'Karan', 2100.00, '2026-08-05'),
(106,"Rahul",3500.00,'2026-08-02');

-- Task.2 :- Write a SQL query to count how many orders were placed by each user in the Orders table, displaying user_name and the number of orders as order_count.
SELECT user_name,COUNT(order_id) AS order_count FROM Order1
GROUP BY user_name;

-- Task.3 :-Write a SQL query to calculate the average total_amount of all orders in the Orders table, making sure to ignore any NULL values.
SELECT AVG(total_amount) FROM Order1
WHERE total_amount IS NOT NULL;

-- Task.4 :- Suppose you are building a Flipkart-style dashboard: Write a SQL query to find the highest and lowest order amounts (MAX and MIN) from the Orders table, and display both values in a single result row.
SELECT MAX(price),MIN(price) FROM products;

-- Task.5 :- Write a SQL query to calculate the total sales (SUM of total_amount) for all orders, but only include orders where total_amount is not NULL.
-- Hint: Use a WHERE clause to filter out NULL values before applying the SUM function.
SELECT SUM(total_amount) FROM Order1
WHERE total_amount IS NOT NULL;