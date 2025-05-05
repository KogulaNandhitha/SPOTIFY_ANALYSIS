create database spotify_db;

use spotify_db;
CREATE TABLE IF NOT EXISTS spotify_tracks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    track_name VARCHAR(255),
    artist VARCHAR(255),
    album VARCHAR(255),
    popularity INT,
    duration_minutes FLOAT
)


select * from spotify_tracks;

'''1) What is the most popular track in the database?'''
SELECT TRACK_NAME as Popular_Track FROM SPOTIFY_TRACKS ORDER BY popularity DESC LIMIT 1
'''2)What is the average popularity of all tracks?'''
SELECT TRACK_NAME , Avg(popularity) FROM SPOTIFY_TRACKS GROUP BY TRACK_NAME
'''3)Which tracks have a duration longer than 4 minutes?'''
SELECT TRACK_NAME,DURATION_MINUTES FROM SPOTIFY_TRACKS WHERE DURATION_MINUTES>4

'''4)Which artist has the most number of tracks in the database?'''
SELECT ARTIST FROM SPOTIFY_TRACKS GROUP BY ARTIST ORDER BY COUNT(ARTIST)  DESC LIMIT 1;
'''5)What are the top 5 most popular tracks?'''
SELECT TRACK_NAME as Popular_Track FROM SPOTIFY_TRACKS ORDER BY popularity DESC LIMIT 5;

'''6)Which tracks are shorter than 3.5 minutes?'''
SELECT * FROM SPOTIFY_TRACKS WHERE DURATION_MINUTES<3.5

'''7)How is the popularity distributed across defined ranges (e.g., 90-100, 70-89, etc.)?'''
SELECT 
    CASE
        WHEN popularity BETWEEN 90 AND 100 THEN '90-100'
        WHEN popularity BETWEEN 70 AND 89 THEN '70-89'
        WHEN popularity BETWEEN 50 AND 69 THEN '50-69'
        WHEN popularity BETWEEN 30 AND 49 THEN '30-49'
        ELSE 'Below 30'
    END AS popularity_bracket,
    COUNT(*) AS count
FROM spotify_tracks
GROUP BY popularity_bracket
ORDER BY popularity_bracket DESC;

'''8)What is the longest track in the dataset?'''
SELECT TRACK_NAME FROM SPOTIFY_TRACKS ORDER BY DURATION_MINUTES DESC LIMIT 1

'''9)How many tracks have a popularity below 30?'''
SELECT TRACK_NAME FROM SPOTIFY_TRACKS WHERE POPULARITY<75
