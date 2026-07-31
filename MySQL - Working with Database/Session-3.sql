-- <---------- SESSION3 ---------->

-- Task.1 :- Create a table called Playlist with columns: id (INT, primary key), song_name (VARCHAR), artist (VARCHAR), and duration (INT, seconds). Insert a single row for your current favorite song.
CREATE TABLE fav_playlists (
Artist_name Varchar(20),
Song_name VARCHAR(20),
Duration INT
);

INSERT INTO fav_playlists
VALUES
("Talwinder","Wishes", 145);

-- Task.2 :- Insert 3 new rows into the Playlist table for songs you recently listened to on Spotify, including their song_name, artist, and duration.
INSERT INTO fav_playlists VALUES
("Aditya Gadhvi", "Kalayug No Kanaiyo", 250),
("Arjit Singh", "Soulmate", 350),
("Badshah", "xyz", 200);

-- Task.3 :- Update the artist name for one of your Playlist entries to fix a typo (for example, change 'Arjit Singh' to 'Arijit Singh') using the UPDATE statement with a WHERE clause.
UPDATE fav_playlists
SET
Artist_name = "Arijit Singh"
WHERE Song_name = "Deva";

-- Task.4 :- Delete a song from the Playlist table where the duration is less than 120 seconds using the DELETE statement and a WHERE clause.<br><br><em><strong>Hint:</strong> Make sure your WHERE clause is specific so you don’t accidentally delete all rows.</em>
DELETE FROM fav_playlists
WHERE Duration < 150;

-- Task 5. :- Write an SQL statement that would update the song_name for all songs by 'AP Dhillon' in your Playlist to add '(Remix)' at the end of the name, but only if the duration is more than 180 seconds.<br><br><em><strong>Constraint:</strong> Combine UPDATE with WHERE to target only the correct rows.</em>

UPDATE Fav_playlists
SET
Song_name = "Remix"
WHERE Artist_name = "Badshah" AND Duration > 180;

SELECT * FROM fav_playlists;