-- <---------- Session2 ---------->

-- Task.1 :- Install MySQL Community Server or SQLite on your system and verify the installation by connecting to the database using the command line or a GUI tool like MySQL Workbench or DB Browser for SQLite.
-- Done in Class

-- Task.2 :- Create a new database named 'foodie_app' to simulate a Zomato-style backend.
CREATE DATABASE foodie_app;

-- Task.3 :- Write a CREATE TABLE statement to define a 'restaurants' table in the 'foodie_app' database with the following columns: id (integer, primary key), name (varchar/character, max 100), cuisine (varchar/character, max 50), rating (decimal, e.g., 4.5), and location (varchar/character, max 100).
USE foodie_app;
CREATE TABLE restaurant
(
Id INT,
Name VARCHAR(100),
Cuisine VARCHAR(50),
Rating FLOAT,
Location VARCHAR(100)
);

-- Task.4 :- Design and create a 'users' table for a Flipkart-style app with columns: user_id (primary key), username, email, phone_number, and created_at (date/time). Pick appropriate data types for each column.<br><br><em><strong>Hint:</strong> Think about which columns should be unique and which data types best fit email and phone numbers.</em>
CREATE TABLE users
(
User_Id INT,
Username VARCHAR(100),
Email VARCHAR(100),
Phone_Number BIGINT,
Created_at DATETIME
);

-- Task.5 :- Intentionally make a mistake in your CREATE TABLE statement (such as missing a comma or using an unsupported data type), run it, and then fix the error based on the message you receive.<br><br><em><strong>Hint:</strong> Take a screenshot of the error and the corrected SQL statement for your records.</em>
CREATE TABLE ABC
(
ID INT
);