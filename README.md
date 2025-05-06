# 🎧 Spotify Data Analysis with SQL

Welcome to the **Spotify Data Analysis** project!  
This project dives into a dataset of **20,590 Spotify tracks** to uncover powerful insights using SQL on pgAdmin.

---

### 📁 Dataset Link

You can access the dataset used in this project here:  
🔗[Download Dataset](https://www.kaggle.com/datasets/sanjanchaudhari/spotify-dataset)

---

## 📊 Dataset Highlights

Each track includes details like:

- 🎤 **Artist**, 🎵 **Track**, 💿 **Album**, 🏷️ **Album Type**
- 🎚️ **Danceability**, ⚡ **Energy**, 🔊 **Loudness**
- 🗣️ **Speechiness**, 🎻 **Acousticness**, 🥁 **Instrumentalness**
- 🎤 **Liveness**, 😊 **Valence**, 🕒 **Tempo**, ⏱️ **Duration**
- 📺 **Views**, ❤️ **Likes**, 💬 **Comments**
- ✅ **Licensed**, 🎬 **Official Video**, 📈 **Streams**
- 🔁 **Energy: Liveness Ratio**, 🔝 **Most Played On**

---

## 🧪 Analysis Performed

### 🟢 Easy Level Queries

-  Tracks with more than **1 billion streams**
-  All albums with their respective artists
-  Total comments on **licensed** tracks
-  Tracks categorized as **'single'**
-  Count of total tracks by each artist

### 🟡 Medium Level Queries

-  **Average danceability** per album
-  Top 5 tracks with **highest energy**
-  Tracks with **views & likes** where official video = TRUE
-  Total **views per album**
-  Tracks with **more Spotify streams than YouTube views**

### 🔴 Advanced Level Queries

-  **Top 3 most-viewed tracks per artist** using window functions
-  Tracks with **above-average liveness**
-  **Energy gap** per album using `WITH` clause
-  Tracks where **energy:liveness ratio > 1.2**
-  **Cumulative likes** ordered by views (window function)

---

## 🧰 Tech Stack

- **Database**: PostgreSQL (pgAdmin)
- **Language**: SQL
- **Dataset Size**: 20,590 records

---

## 📎 Example Snippet

```sql
-- Top 5 highest energy tracks
SELECT track, energy 
FROM spotify 
ORDER BY energy DESC 
LIMIT 5;
