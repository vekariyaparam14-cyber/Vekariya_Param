-- <---------- Session-13 ---------->

-- Task-1
USE music_streaming_app;
CREATE TABLE Playlists3 (
    id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    total_likes INT
);

INSERT INTO Playlists3 VALUES
(1, 101, 'Workout Beats', 850),
(2, 101, 'Morning Chill', 420),
(3, 102, 'Party Hits', 1200),
(4, 102, 'Romantic Songs', 950),
(5, 103, 'LoFi Study', 760),
(6, 103, 'Travel Mix', 760),
(7, 104, 'Old Classics', 500),
(8, 101, 'Road Trip', 650);

-- Task-2
SELECT user_id,playlist_name,total_likes, 
ROW_NUMBER() OVER(ORDER BY total_likes DESC) AS row1
FROM playlists3;

-- Task-3
SELECT user_id,playlist_name,total_likes, 
RANK() OVER(ORDER BY total_likes DESC) AS rank1
FROM playlists3;

-- Task-4
SELECT user_id,playlist_name,total_likes, 
DENSE_RANK() OVER(PARTITION BY user_id ORDER BY total_likes DESC) AS dense_rank1
FROM playlists3;

-- Task-5
SELECT playlist_name,user_id,total_likes FROM 
(SELECT  playlist_name,user_id,total_likes ,
ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY total_likes DESC) AS row1
FROM playlists3 ) AS Playlist
WHERE row1 <= 2;