-- -----------------create table-----------------
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);  

-- -------------------- Easy Level-----------------

-- Tracks with more than 1 billion streams:
 -- query
SELECT track 
FROM spotify 
WHERE stream > 1000000000;

-- List all albums with respective artists:
 -- query
SELECT DISTINCT album, artist 
FROM spotify;

-- Total number of comments for licensed tracks: 
SELECT SUM(comments) AS total_comments 
FROM spotify 
WHERE licensed = TRUE;

-- Tracks from album type 'single':	
SELECT track 
FROM spotify 
WHERE album_type = 'single';

-- Count of total tracks by each artist:
SELECT artist, COUNT(*) AS total_tracks 
FROM spotify 
GROUP BY artist;


-- -------------------- Medium Level-----------------


-- Average danceability per album:
SELECT album, AVG(danceability) AS avg_danceability 
FROM spotify 
GROUP BY album;

-- Top 5 tracks by highest energy:
SELECT track, energy 
FROM spotify 
ORDER BY energy DESC 
LIMIT 5;

-- Tracks with views and likes where official_video = TRUE:
SELECT track, views, likes 
FROM spotify 
WHERE official_video = TRUE;

-- Total views per album:
SELECT album, SUM(views) AS total_views 
FROM spotify 
GROUP BY album;

-- Tracks streamed more on Spotify than YouTube:
SELECT track, stream, views
FROM spotify 
WHERE stream > views;


-- -------------------- Advance Queries-----------------


-- Top 3 most-viewed tracks for each artist (Window Function):
SELECT artist, track, views
FROM (
    SELECT artist, track, views,
           RANK() OVER (PARTITION BY artist ORDER BY views DESC) AS view_rank
    FROM spotify
) ranked_tracks
WHERE view_rank <= 3;

-- Tracks where liveness is above average: 
SELECT track, liveness
FROM spotify
WHERE liveness > (SELECT AVG(liveness) FROM spotify);

-- WITH clause to find energy difference (already correct, just fixed typo):
WITH cte AS (
    SELECT 
        album,
        MAX(energy) AS highest_energy,
        MIN(energy) AS lowest_energy
    FROM spotify
    GROUP BY album
)
SELECT 
    album,
    highest_energy - lowest_energy AS energy_diff
FROM cte
ORDER BY energy_diff DESC;

-- Tracks where energy-to-liveness ratio > 1.2: 
SELECT track, energy, liveness, (energy / liveness) AS energy_liveness_ratio
FROM spotify
WHERE liveness > 0 AND (energy / liveness) > 1.2;

-- Cumulative sum of likes ordered by views:
SELECT track, views, likes,
       SUM(likes) OVER (ORDER BY views) AS cumulative_likes
FROM spotify;