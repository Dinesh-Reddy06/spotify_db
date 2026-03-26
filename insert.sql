-- USERS
INSERT ALL
INTO Users VALUES (1, 'Dinesh', 'India', DATE '2023-01-10')
INTO Users VALUES (2, 'Rahul', 'India', DATE '2023-02-15')
INTO Users VALUES (3, 'Anjali', 'India', DATE '2023-03-05')
INTO Users VALUES (4, 'Kiran', 'India', DATE '2023-03-20')
INTO Users VALUES (5, 'Sneha', 'India', DATE '2023-04-01')
SELECT * FROM dual;

-- ARTISTS
INSERT ALL
INTO Artists VALUES (1, 'Arijit Singh')
INTO Artists VALUES (2, 'Ed Sheeran')
INTO Artists VALUES (3, 'Armaan Malik')
INTO Artists VALUES (4, 'Shreya Ghoshal')
INTO Artists VALUES (5, 'Taylor Swift')
SELECT * FROM dual;

-- SONGS
INSERT ALL
INTO Songs VALUES (1, 'Shape of You', 2, 230, 2017)
INTO Songs VALUES (2, 'Tum Hi Ho', 1, 240, 2013)
INTO Songs VALUES (3, 'Kesariya', 3, 210, 2022)
INTO Songs VALUES (4, 'Raabta', 1, 250, 2017)
INTO Songs VALUES (5, 'Blank Space', 5, 231, 2014)
INTO Songs VALUES (6, 'Love Story', 5, 235, 2008)
INTO Songs VALUES (7, 'Tera Ban Jaunga', 4, 215, 2019)
INTO Songs VALUES (8, 'Perfect', 2, 240, 2017)
SELECT * FROM dual;

-- PLAYLISTS
INSERT ALL
INTO Playlists VALUES (1, 1, 'Workout')
INTO Playlists VALUES (2, 2, 'Chill Vibes')
INTO Playlists VALUES (3, 3, 'Romantic Hits')
INTO Playlists VALUES (4, 4, 'Party Mix')
INTO Playlists VALUES (5, 5, 'Sad Songs')
SELECT * FROM dual;

-- PLAYLIST SONGS
INSERT ALL
INTO Playlist_Songs VALUES (1, 1)
INTO Playlist_Songs VALUES (1, 2)
INTO Playlist_Songs VALUES (2, 3)
INTO Playlist_Songs VALUES (2, 5)
INTO Playlist_Songs VALUES (3, 2)
INTO Playlist_Songs VALUES (3, 7)
INTO Playlist_Songs VALUES (4, 1)
INTO Playlist_Songs VALUES (4, 6)
INTO Playlist_Songs VALUES (5, 4)
INTO Playlist_Songs VALUES (5, 7)
SELECT * FROM dual;

-- LISTENING HISTORY
INSERT ALL
INTO Listening_History VALUES (1, 1, 1, DATE '2023-04-10')
INTO Listening_History VALUES (2, 1, 2, DATE '2023-04-11')
INTO Listening_History VALUES (3, 2, 3, DATE '2023-04-12')
INTO Listening_History VALUES (4, 3, 5, DATE '2023-04-13')
INTO Listening_History VALUES (5, 4, 2, DATE '2023-04-14')
INTO Listening_History VALUES (6, 5, 6, DATE '2023-04-15')
INTO Listening_History VALUES (7, 3, 7, DATE '2023-04-16')
INTO Listening_History VALUES (8, 2, 8, DATE '2023-04-17')
SELECT * FROM dual;

COMMIT;
