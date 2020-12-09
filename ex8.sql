-- task 1 is already done by previous homework

-- task 2 is already done by previous homework

-- task 3 is already done by previous homework

-- task 4 is already done by previous homework

-- task 5 is already done by previous homework

-- task 6
SELECT surname, name
FROM actor 
JOIN actor_movie ON actor.id = actor_id
JOIN movie ON movie.id = movie_id
WHERE year BETWEEN 2007 AND 2010 AND (
    SELECT motherland FROM producer
    WHERE producer.id = (
        SELECT producer_id 
        FROM movie_producer
        WHERE movie_id = movie.id 
    ) = 'UK'
);

-- task 7
SELECT AVG(budget)
FROM movies
WHERE year < 2000;

SELECT AVG(budget)
FROM movies
WHERE year BETWEEN 2000 AND 2005;

SELECT AVG(budget)
FROM movies
WHERE year BETWEEN 2005 AND 2010;

SELECT AVG(budget)
FROM movies
WHERE year > 2010;

-- task 8
SELECT SUM(budget)
FROM movies
JOIN movie_producer ON id = movie_id
JOIN producers ON id = producer_id
WHERE SUBSTRING(surname from CHAR_LENGTH(surname) for 1) = 'v' OR
SUBSTRING(surname from CHAR_LENGTH(surname) for 1) = "n";

-- task 9
SELECT MAX(budget)
FROM movies 
GROUP BY year; 

-- task 10
SELECT * 
FROM movies 
WHERE year < 2010 AND budget < (
    SELECT MIN(budget)
    FROM movies
    WHERE year > 2010
);

-- task 11
SELECT * 
FROM producers
WHERE EXISTS(
    SELECT 1 
    FROM movies
    JOIN movie_producer ON movies.id = movie_id
    WHERE producer_id = producers.id AND budget BETWEEN (
        SELECT MIN(budget)
        FROM movies 
        WHERE year = 2015
    ) AND (
        SELECT MAX(budget)
        FROM movies 
        WHERE year = 2016
    )
);

-- task 12
SELECT * 
FROM producers
WHERE EXISTS (
    SELECT 1
    FROM movie_producer
    JOIN movies ON movies.id = movie_id
    WHERE producer_id = producers.id AND year < 2000 
) OR (
    SELECT COUNT(*)
    FROM movie_producer
    WHERE producers.id = producer_id
) = 10;

