-- <---------- SESSION-1 ---------->


-- TASK.1 :- Install MySQL or PostgreSQL on your system and create a new database named 'music_streaming_app' using the command line or GUI tool of your choice.
-- ---> Done in Class 

-- Task.2 :- Inside the 'music_streaming_app' database, create a table called 'playlists' with columns: playlist_id (integer, primary key), name (varchar), and created_by (varchar).
CREATE DATABASE Music_Streaming_App;

USE Music_Streaming_App;

CREATE TABLE playlists
(
Id INT,
Name VARCHAR(50),
Created_By VARCHAR(20)
);

-- Task.3 :- Insert three sample rows into the 'playlists' table representing playlists like 'Bollywood Hits', 'Chill Vibes', and 'Workout Mix', each created by a different user.
INSERT INTO playlists
VALUES
(1,"Bollywood Hits","Badshah"),
(2,"Chill Vibes","Honey Singh"),
(3,"Workout Mix","Arjit Singh"); 

-- Task.4 :- Write an SQL SELECT query to display all playlists created by the user 'Amit' from the 'playlists' table.<br><br><em><strong>Hint:</strong> Use the WHERE clause to filter by the 'created_by' column.</em>
SELECT * FROM playlists
WHERE Created_By = "Badshah";

-- Task.5 :- Open ChatGPT or Copilot and ask it to explain the difference between a table, a row, and a column in SQL using an example from a food delivery app like Zomato. Paste the explanation you receive into your assignment.
/*
In SQL, data is organized in tables, which are made up of rows and columns.

1. Table

A table is a collection of related data. It is similar to a spreadsheet.

Example: A Restaurants table in a food delivery app like Zomato.

Restaurant_ID	Restaurant_Name	City	Rating
101	Spice Villa	Ahmedabad	4.5
102	Pizza Hub	Surat	4.2
103	Burger Point	Rajkot	4.0

Here, Restaurants is the table.

2. Row

A row represents a single record or entry in the table.

For example, this is one row:

Restaurant_ID	Restaurant_Name	City	Rating
102	Pizza Hub	Surat	4.2

This row contains all the information about Pizza Hub.

3. Column

A column represents a specific attribute or type of information stored for every record.

Examples of columns are:

Restaurant_ID
Restaurant_Name
City
Rating

The Rating column contains:

Rating
4.5
4.2
4.0

Each value in this column is the rating of a restaurant.

Summary
SQL Term	Meaning	Zomato Example
Table	Collection of related data	Restaurants table
Row	One complete record	102, Pizza Hub, Surat, 4.2
Column	One type of information	Restaurant_Name, City, Rating
Visual Representation
                 Restaurants (Table)
+---------------+-----------------+------------+--------+
| Restaurant_ID | Restaurant_Name | City       | Rating |
+---------------+-----------------+------------+--------+
| 101           | Spice Villa     | Ahmedabad  | 4.5    | ← Row
| 102           | Pizza Hub       | Surat      | 4.2    | ← Row
| 103           | Burger Point    | Rajkot     | 4.0    | ← Row
+---------------+-----------------+------------+--------+
      ↑                 ↑              ↑          ↑
    Column           Column         Column     Column

In simple terms:

Table = A complete list (e.g., all restaurants on Zomato).
Row = One item in the list (one restaurant).
Column = One piece of information about every item (such as name, city, or rating).
*/