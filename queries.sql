
-- Get total number of users
SELECT COUNT(*) AS total_users FROM Users;

-- Retrieve all song titles
SELECT title FROM Songs;

-- Get song titles along with their artist names
SELECT s.title, a.artist_name
FROM Songs s
JOIN Artists a ON s.artist_id = a.artist_id;

-- Count how many times each song was played
SELECT s.title, COUNT(*) AS play_count
FROM Listening_History h
JOIN Songs s ON h.song_id = s.song_id
GROUP BY s.title
ORDER BY play_count DESC;

-- Find the most played artist
SELECT artist_name
FROM (
SELECT a.artist_name, COUNT(*) AS plays
FROM Listening_History h
JOIN Songs s ON h.song_id = s.song_id
JOIN Artists a ON s.artist_id = a.artist_id
GROUP BY a.artist_name
ORDER BY plays DESC
)
WHERE ROWNUM = 1;

-- Count number of listens per user
SELECT u.username, COUNT(*) AS listens
FROM Listening_History h
JOIN Users u ON h.user_id = u.user_id
GROUP BY u.username;

-- Get all songs in each playlist
SELECT p.playlist_name, s.title
FROM Playlist_Songs ps
JOIN Playlists p ON ps.playlist_id = p.playlist_id
JOIN Songs s ON ps.song_id = s.song_id;

-- Count number of songs in each playlist
SELECT p.playlist_name, COUNT(ps.song_id) AS total_songs
FROM Playlist_Songs ps
JOIN Playlists p ON ps.playlist_id = p.playlist_id
GROUP BY p.playlist_name;

-- View listening history with username and song title
SELECT u.username, s.title, h.listen_date
FROM Listening_History h
JOIN Users u ON h.user_id = u.user_id
JOIN Songs s ON h.song_id = s.song_id;

-- Get songs released after 2015
SELECT title FROM Songs
WHERE release_year > 2015;

-- Find the most active user (highest listens)
SELECT username
FROM (
SELECT u.username, COUNT(*) AS listens
FROM Listening_History h
JOIN Users u ON h.user_id = u.user_id
GROUP BY u.username
ORDER BY listens DESC
)
WHERE ROWNUM = 1;

-- Count total songs per artist
SELECT a.artist_name, COUNT(*) AS total_songs
FROM Songs s
JOIN Artists a ON s.artist_id = a.artist_id
GROUP BY a.artist_name;

-- Calculate average song duration
SELECT AVG(duration) AS avg_duration FROM Songs;

-- Get users and their playlists
SELECT u.username, p.playlist_name
FROM Playlists p
JOIN Users u ON p.user_id = u.user_id;

-- Count total number of streams
SELECT COUNT(*) AS total_streams FROM Listening_History;

-- Rank songs based on number of plays
SELECT title, plays,
RANK() OVER (ORDER BY plays DESC) AS rank_position
FROM (
SELECT s.title, COUNT(*) AS plays
FROM Listening_History h
JOIN Songs s ON h.song_id = s.song_id
GROUP BY s.title
);

-- Rank artists based on total plays using dense rank
SELECT artist_name, plays,
DENSE_RANK() OVER (ORDER BY plays DESC) AS rank
FROM (
SELECT a.artist_name, COUNT(*) AS plays
FROM Listening_History h
JOIN Songs s ON h.song_id = s.song_id
JOIN Artists a ON s.artist_id = a.artist_id
GROUP BY a.artist_name
);

-- Running total of listens per user over time
SELECT user_id, listen_date,
COUNT(*) OVER (PARTITION BY user_id ORDER BY listen_date) AS running_total
FROM Listening_History;

-- Find songs played more than average plays
SELECT title
FROM Songs s
WHERE (
SELECT COUNT(*) FROM Listening_History h
WHERE h.song_id = s.song_id
) >
(
SELECT AVG(cnt)
FROM (
SELECT COUNT(*) AS cnt
FROM Listening_History
GROUP BY song_id
)
);

-- Get top 3 most played songs
SELECT *
FROM (
SELECT s.title, COUNT(*) AS plays,
RANK() OVER (ORDER BY COUNT(*) DESC) rnk
FROM Listening_History h
JOIN Songs s ON h.song_id = s.song_id
GROUP BY s.title
)
WHERE rnk <= 3;

-- Count total listens per month
SELECT TO_CHAR(listen_date, 'MM') AS month,
COUNT(*) AS total_listens
FROM Listening_History
GROUP BY TO_CHAR(listen_date, 'MM')
ORDER BY month;

-- Find the date with highest number of listens
SELECT listen_date
FROM (
SELECT listen_date, COUNT(*) AS cnt
FROM Listening_History
GROUP BY listen_date
ORDER BY cnt DESC
)
WHERE ROWNUM = 1;

-- Find songs that were never played
SELECT title
FROM Songs s
WHERE NOT EXISTS (
SELECT 1 FROM Listening_History h
WHERE h.song_id = s.song_id
);

-- Find songs appearing in multiple playlists
SELECT s.title, COUNT(*) AS playlist_count
FROM Playlist_Songs ps
JOIN Songs s ON ps.song_id = s.song_id
GROUP BY s.title
HAVING COUNT(*) > 1;

-- Find playlist with maximum number of songs
SELECT playlist_name
FROM (
SELECT p.playlist_name, COUNT(*) AS total_songs
FROM Playlists p
JOIN Playlist_Songs ps ON p.playlist_id = ps.playlist_id
GROUP BY p.playlist_name
ORDER BY total_songs DESC
)
WHERE ROWNUM = 1;

-- Find users who never listened to any song
SELECT username
FROM Users u
WHERE NOT EXISTS (
SELECT 1 FROM Listening_History h
WHERE h.user_id = u.user_id
);

-- Calculate average number of listens per user
SELECT AVG(cnt)
FROM (
SELECT COUNT(*) AS cnt
FROM Listening_History
GROUP BY user_id
);

-- Find artist with highest average song duration
SELECT artist_name
FROM (
SELECT a.artist_name, AVG(s.duration) AS avg_duration
FROM Songs s
JOIN Artists a ON s.artist_id = a.artist_id
GROUP BY a.artist_name
ORDER BY avg_duration DESC
)
WHERE ROWNUM = 1;

-- Count repeated listens of same song by same user
SELECT user_id, song_id, COUNT(*) AS repeat_count
FROM Listening_History
GROUP BY user_id, song_id
ORDER BY repeat_count DESC;

-- Calculate percentage contribution of each song to total plays
SELECT title,
COUNT(*) * 100 / SUM(COUNT(*)) OVER() AS percentage
FROM Listening_History h
JOIN Songs s ON h.song_id = s.song_id
GROUP BY title;
