# Movie-Analytics-Dashboard-
A hands-on SQL mini project designed to explore movie data for a streaming service. Includes structured schema, sample data, and query-driven insights such as genre-based ratings, co-actor relationships, and actor activity. Ideal for practicing SQL joins, aggregations, subqueries, and case logic.
# 🎬 Movie Analytics Dashboard (SQL Mini Project)

## 📊 Project Overview

This project is a SQL-based analytics dashboard designed to generate insights from a streaming service's movie database. It showcases how to model relationships between movies, actors, and ratings, and extract useful patterns using intermediate-level SQL joins and aggregations.

---

## 🧱 Database Schema

- **movies(movie_id, title, release_year, genre)**
- **actors(actor_id, actor_name)**
- **movie_actors(movie_id, actor_id)** — (many-to-many)
- **ratings(movie_id, platform, rating)**

---

## 🚀 Features & Queries

- List all movies with genres and release year.
- Display actors for each movie.
- Find IMDb ratings greater than 8.0.
- Count how many movies each actor has starred in.
- Get average IMDb rating per genre.
- List movies with multiple actors.
- Find actors in Sci-Fi movies.
- Categorize movies by rating as High / Moderate / Low.
- Find movies where all platform ratings are above 8.0.
- Identify co-actors who worked with Robert Downey Jr.

---

## 🛠️ Tech Used

- SQL (MySQL-compatible syntax)
- Structured schema + query-based insights

---

## 💡 How to Use

1. Clone or download this repo.
2. Load the `CREATE TABLE` and `INSERT` scripts into your MySQL database.
3. Run each query file from the `queries/` folder to view insights.

---

## 📚 License

This project is open-source and free to use under the [MIT License](LICENSE).
