-- -----------------------
-- 🧠 ANALYTICS QUERIES
-- -----------------------

-- 1. List all movies with their genres and release year
SELECT 
  title, 
  genre, 
  release_year 
FROM movies;

-- 2. Show all movies along with the actors who starred in them
SELECT 
  movies.title AS movie_title, 
  actors.actor_name AS actor_name 
FROM movies 
INNER JOIN movie_actors ON movies.movie_id = movie_actors.movie_id 
INNER JOIN actors ON movie_actors.actor_id = actors.actor_id;

-- 3. Find movies that have a rating greater than 8.0 on IMDb
SELECT 
  movies.title AS movie_title, 
  ratings.rating 
FROM movies 
INNER JOIN ratings ON movies.movie_id = ratings.movie_id 
WHERE ratings.platform = 'IMDb' AND ratings.rating > 8.0;

-- 4. Display each actor's name and the number of movies they have acted in
SELECT 
  actors.actor_name AS actor_name, 
  COUNT(movies.title) AS movie_count 
FROM actors 
INNER JOIN movie_actors ON actors.actor_id = movie_actors.actor_id 
INNER JOIN movies ON movie_actors.movie_id = movies.movie_id 
GROUP BY actors.actor_name;

-- 5. Get the average IMDb rating for each genre
SELECT 
  movies.genre AS genre, 
  AVG(ratings.rating) AS avg_rating 
FROM movies 
INNER JOIN ratings ON movies.movie_id = ratings.movie_id 
WHERE ratings.platform = 'IMDb' 
GROUP BY movies.genre;

-- 6. List movies that feature more than one actor
SELECT 
  movies.title AS movie_title 
FROM movies 
INNER JOIN movie_actors ON movies.movie_id = movie_actors.movie_id 
INNER JOIN actors ON movie_actors.actor_id = actors.actor_id 
GROUP BY movies.title 
HAVING COUNT(actors.actor_name) > 1;

-- 7. Find actors who starred in Sci-Fi movies
SELECT DISTINCT 
  actors.actor_name AS actor_name 
FROM actors 
INNER JOIN movie_actors ON actors.actor_id = movie_actors.actor_id 
INNER JOIN movies ON movie_actors.movie_id = movies.movie_id 
WHERE movies.genre = 'Sci-Fi';

-- 8. Show all movies and categorize them by rating
SELECT 
  movies.title AS movie_title, 
  ratings.rating AS rating,
  CASE 
    WHEN ratings.rating >= 8.5 THEN 'High'
    WHEN ratings.rating BETWEEN 7.5 AND 8.4 THEN 'Moderate'
    ELSE 'Low' 
  END AS rating_category 
FROM movies 
INNER JOIN ratings ON movies.movie_id = ratings.movie_id 
WHERE ratings.platform = 'IMDb';

-- 9. Display only those movies whose rating is always above 8.0 on all platforms
SELECT 
  movies.title AS movie_title 
FROM movies 
INNER JOIN ratings ON movies.movie_id = ratings.movie_id 
GROUP BY movies.title 
HAVING MIN(ratings.rating) > 8.0;

-- 10. Find the actor(s) who worked with Robert Downey Jr.
SELECT DISTINCT 
  movies.title AS movie_title, 
  actors.actor_name AS co_actor 
FROM movie_actors 
INNER JOIN actors ON movie_actors.actor_id = actors.actor_id 
INNER JOIN movies ON movie_actors.movie_id = movies.movie_id 
WHERE movie_actors.movie_id IN (
  SELECT movie_actors.movie_id 
  FROM movie_actors 
  INNER JOIN actors ON movie_actors.actor_id = actors.actor_id 
  WHERE actors.actor_name = 'Robert Downey Jr.'
) 
AND actors.actor_name != 'Robert Downey Jr.';
