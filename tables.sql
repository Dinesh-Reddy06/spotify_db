CREATE TABLE Users (
    user_id NUMBER PRIMARY KEY,
    username VARCHAR2(50),
    country VARCHAR2(50),
    signup_date DATE
);

CREATE TABLE Artists (
    artist_id NUMBER PRIMARY KEY,
    artist_name VARCHAR2(50)
);

CREATE TABLE Songs (
    song_id NUMBER PRIMARY KEY,
    title VARCHAR2(100),
    artist_id NUMBER,
    duration NUMBER,
    release_year NUMBER,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

CREATE TABLE Playlists (
    playlist_id NUMBER PRIMARY KEY,
    user_id NUMBER,
    playlist_name VARCHAR2(100),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Playlist_Songs (
    playlist_id NUMBER,
    song_id NUMBER,
    PRIMARY KEY (playlist_id, song_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

CREATE TABLE Listening_History (
    history_id NUMBER PRIMARY KEY,
    user_id NUMBER,
    song_id NUMBER,
    listen_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

