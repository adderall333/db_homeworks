-- task 1
SELECT * FROM producers 
WHERE best_movie IN (SELECT id FROM movies WHERE year = 2000);

-- task 2
SELECT * FROM producers 
WHERE (
	SELECT COUNT(*) FROM movie_producer 
	WHERE id = producer_id) > 5;

-- task 3
SELECT id FROM movies 
WHERE (
    SELECT COUNT(*) FROM movie_actor 
    WHERE id = movie_id) > 10;

-- task 4
ALTER TABLE movies ADD COLUMN rating INTEGER NOT NULL DEFAULT = 0;

UPDATE movies SET rating = 10 WHERE id = 1;
UPDATE movies SET rating = 9 WHERE id = 3;
UPDATE movies SET rating = 8 WHERE id = 5;
UPDATE movies SET rating = 7 WHERE id = 2;
UPDATE movies SET rating = 6 WHERE id = 4;
UPDATE movies SET rating = 5 WHERE id = 6;

SELECT * FROM movies 
WHERE country = 'USA' 
ORDER BY rating DESC
LIMIT 10;

-- task 5
INSERT INTO genres (name) VALUES ('horror');

SELECT * FROM movies
WHERE (
    SELECT COUNT(*) FROM movie_genre
    WHERE movie_id = id AND (
        SELECT name FROM genres
        WHERE id = genre_id
    ) = 'horror'
) > 0 AND (
    SELECT COUNT(*) FROM movie_actor
    WHERE movie_id = id AND (
        SELECT motherland FROM actors
        WHERE id = actor_id 
    ) = 'UK'
) > 0;

-- task 6
SELECT * FROM genres
WHERE (
    SELECT COUNT(*) FROM movie_genre
    WHERE genre_id = id
) > 5;

-- task 7
ALTER TABLE movies
ADD COLUMN length INT NOT NULL DEFAULT 0;

UPDATE movies SET length = 154 WHERE id = 1;
UPDATE movies SET length = 152 WHERE id = 3;
UPDATE movies SET length = 160 WHERE id = 5;
UPDATE movies SET length = 159 WHERE id = 2;
UPDATE movies SET length = 165 WHERE id = 4;
UPDATE movies SET length = 161 WHERE id = 6;

SELECT * FROM movies
ORDER BY length DESC
LIMIT 10 OFFSET 10;

-- task 8
SELECT * FROM genres 
WHERE (
    SELECT COUNT(*) FROM movie_genre
    WHERE genre_id = id AND (
        SELECT COUNT(*) FROM producers
        WHERE (motherland = 'UK' OR motherland = 'France') AND (
            SELECT COUNT(*) FROM movie_producer
            WHERE producer_id = id AND movie_id = movie_id
        ) > 0
    ) > 0
) > 0;