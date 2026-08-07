-- <---------- Session-14 ---------->

-- Task-1
USE foodie_app;
CREATE TABLE Orders2 (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount INT
);

INSERT INTO Orders2 VALUES
(101, 1, '2026-07-01', 450),
(102, 1, '2026-07-05', 320),
(103, 1, '2026-07-10', 600),
(104, 2, '2026-07-02', 280),
(105, 2, '2026-07-08', 500),
(106, 3, '2026-07-03', 700),
(107, 3, '2026-07-09', 650);

-- Task-2
SELECT order_id,user_id,order_date,total_amount,
LAG(total_amount) OVER ( PARTITION BY user_id ORDER BY order_date) AS pre_amount
FROM Orders2;

-- Task-3
SELECT order_id,user_id,order_date,total_amount,
LEAD(total_amount) OVER ( PARTITION BY user_id ORDER BY order_date) AS next_amount
FROM Orders2;

-- Task-4
SELECT order_id,user_id,order_date,total_amount,
SUM(total_amount) 
OVER ( PARTITION BY user_id
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM Orders2;

-- Task-5
SELECT order_id,user_id,order_date,total_amount,
SUM(total_amount) 
OVER ( PARTITION BY user_id ORDER BY order_date
	ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
    /
COUNT(*) 
OVER ( PARTITION BY user_id ORDER BY order_date
	ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM Orders2;