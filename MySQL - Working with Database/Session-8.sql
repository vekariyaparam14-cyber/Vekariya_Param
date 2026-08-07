-- <---------- Session-8 ---------->

-- Task.1 :- Create a table called Orders with columns: order_id, user_id, payment_method, and amount. Insert at least 8 sample records representing different users and payment methods (like UPI, Card, Wallet, COD).
USE foodie_app;
CREATE TABLE Orders (
    order_id INT,
    user_id INT,
    payment_method VARCHAR(20),
    amount DECIMAL(10,2)
);

INSERT INTO Orders (order_id, user_id, payment_method, amount)
VALUES
(101, 1001, 'UPI', 450.00),
(102, 1002, 'Card', 1250.50),
(103, 1003, 'Wallet', 320.75),
(104, 1001, 'COD', 890.00),
(105, 1002, 'Card', 560.25),
(106, 1006, 'Card', 1500.00),
(107, 1003, 'Wallet', 275.50),
(108, 1008, 'COD', 999.99);
DROP TABLE ORDERS;

-- Task.2 :- Write an SQL query to count how many orders were placed using each payment_method in the Orders table, similar to how Zomato shows payment breakdown in analytics.
SELECT payment_method, COUNT(order_id) FROM Orders
GROUP BY payment_method;

-- Task.3:- Write an SQL query to find the total amount spent by each user_id in the Orders table. Display user_id and their total spend.
SELECT user_id, SUM(amount) as Total_spend FROM Orders
GROUP BY user_id;

-- Task.4 :- Write an SQL query to show only those payment methods where the average order amount is greater than 300, using GROUP BY and HAVING. Hint: Use AVG(amount) in your HAVING clause.
SELECT payment_method, AVG(amount) FROM Orders
GROUP BY payment_method
HAVING AVG(amount) > 300;

-- Task.5 :- Explain the difference between WHERE and HAVING by giving one example query for each, using the Orders table. Your examples should show a scenario where WHERE and HAVING filter different things.
/*
----> WHERE
     --> IT use before the GROUP BY
     --> condition of where is not use in Aggrigate Function
     
----> Having
	--> IT use below the GROUP BY
     --> condition of having in Aggrigate Function
*/

SELECT payment_method, AVG(amount) FROM Orders
GROUP BY payment_method
HAVING AVG(amount) > 300;

SELECT payment_method, COUNT(order_id) FROM Orders
WHERE amount > 800
GROUP BY payment_method;