# Spotify Database System (Oracle SQL)

## Overview

This project is a music database system that's similar to Spotify. It was built using Oracle SQL. The system does things that a music streaming platform does including:

* Users

* Artists

* Songs

* Playlists

* Listening History

---

## Database Design

The database has the following tables:

* Users. This is where we store information about the users

* Artists. This is where we store information about the artists

* Songs. This is where we store information about the songs and we link them to the artists

* Playlists. These are playlists that the users create

* Playlist_Songs. This is how we connect playlists to songs because one playlist can have songs and one song can be on many playlists

* Listening_History. This is where we track what the users are listening to

---

## Relationships

* One user can have playlists

* One artist can have songs

* Many songs can be on playlists

* Users and songs are connected through the listening history

---

## Features Implemented

* We can add data to the database using INSERT ALL

* We can use INNER JOIN to connect tables

* We can use COUNT and AVG to get some statistics

* We can use subqueries to get specific data

* We can use window functions, like RANK and DENSE_RANK

* We can ask questions

* We can make the database look like it has data

---

## Sample Queries

* We can find out what the played songs are

* We can find out who the active users are

* We can find out who the top artists are

* We can analyze the playlists

* We can see what the listening trends are

---

## Technologies Used

* Oracle SQL

* SQL Developer

---

## How to Run

1. Open Oracle SQL Developer

2. Run the SQL file

3. Execute queries to see the results

---

## Future Enhancements

* We can make a web frontend using HTML, CSS and JS

* We can integrate the backend using Node.js or Java

* We can make a recommendation system

---

## Author

**Dinesh Reddy**
