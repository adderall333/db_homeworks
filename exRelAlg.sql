-- task 1
SELECT * 
FROM movies
WHERE year = 2012

-- task 2
SELECT DISTINCT name
FROM producers
JOIN movie_producer
ON producers.id = producer_id;

-- task 3
SELECT name
FROM movies
JOIN movie_producer
ON movies.id = movie_producer.id
WHERE rating > 7 AND motherland = 'Russia'

-- task 4
SELECT name
FROM actors
WHERE motherland = 'USA' AND (
    SELECT COUNT(*)
    FROM movie_actor
    WHERE actor_id = actors.id
) > 10;

-- task 5
SELECT name
FROM (
	SELECT DISTINCT name, genre_id
	FROM movie_genre
	NATURAL JOIN movie_producer
	JOIN producers
	ON producers.id = producer_id
) AS foo
GROUP BY name
HAVING COUNT(*) = (
    SELECT COUNT(*)
    FROM genres
);

-- task 6
WITH specific_years AS (
    SELECT DISTINCT year 
    FROM movie_actor
    JOIN movies ON movies.id = movie_id
    JOIN actors ON actors.id = actor_id
    WHERE actors.name = 'Аль Пачино'
    ORDER BY year
)
SELECT name 
FROM movie_producer 
JOIN producers ON producers.id = producer_id
WHERE year IN(specific_years);
