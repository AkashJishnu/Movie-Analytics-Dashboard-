-- movie-analytics-dashboard

-- -----------------------
-- 🎬 SCHEMA DEFINITION
-- -----------------------

CREATE TABLE movies (
  movie_id INT PRIMARY KEY,
  title VARCHAR(100),
  release_year INT,
  genre VARCHAR(50)
);

CREATE TABLE actors (
  actor_id INT PRIMARY KEY,
  actor_name VARCHAR(100)
);

CREATE TABLE movie_actors (
  movie_id INT,
  actor_id INT,
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
  FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);

CREATE TABLE ratings (
  movie_id INT,
  platform VARCHAR(50),
  rating DECIMAL(3,1),
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);
