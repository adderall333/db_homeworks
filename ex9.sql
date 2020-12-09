-- task 1
WITH RECURSIVE factorial AS (
    SELECT 
        1 AS i, 
        1 AS factorial_of_i

    UNION 

    SELECT 
        i + 1 AS i, 
        factorial_of_i * (i + 1) AS factorial_of_i 
    FROM factorial
    WHERE i < 19
)
SELECT * FROM factorial;

-- task 2
CREATE TABLE geo (
    id SERIAL PRIMARY KEY NOT NULL,
    par_id INT DEFAULT 1,
    name VARCHAR(30) NOT NULL
);

INSERT INTO geo (name) VALUES ('Планета Земля');
INSERT INTO geo (par_id, name) VALUES (1, 'Континент Евразия');
INSERT INTO geo (par_id, name) VALUES (1, 'Континент Северная Америка');
INSERT INTO geo (par_id, name) VALUES (2, 'Европа');
INSERT INTO geo (par_id, name) VALUES (4, 'Россия');
INSERT INTO geo (par_id, name) VALUES (4, 'Германия');
INSERT INTO geo (par_id, name) VALUES (5, 'Москва');
INSERT INTO geo (par_id, name) VALUES (5, 'Санкт-Петербург');
INSERT INTO geo (par_id, name) VALUES (6, 'Берлин');

WITH RECURSIVE func AS (
    SELECT 
        id, par_id, name, 
        1 AS nesting_level
    FROM geo
    WHERE name = 'Европа'

    UNION

    SELECT 
        geo.id, geo.par_id, geo.name, 
        func.nesting_level + 1 AS nesting_level
    FROM geo
    JOIN func ON geo.par_id = func.id
)
SELECT * FROM func;

-- task 3


-- task 4
CREATE TYPE gender AS ENUM ('male', 'female');
ALTER TABLE producers ADD COLUMN gender gender DEFAULT 'male' NOT NULL;

CREATE VIEW simple_view AS
    SELECT * 
    FROM producers
    WHERE gender = 'male' AND EXISTS (
        SELECT 1 
        FROM movie_producer
        JOIN movies ON movie_id = movies.id
        WHERE producer_id = producers.id AND budget > 1000000
    );

CREATE MATERIALIZED VIEW materialized_view AS
    SELECT * 
    FROM producers
    WHERE gender = 'male' AND EXISTS (
        SELECT 1 
        FROM movie_producer
        JOIN movies ON movie_id = movies.id
        WHERE producer_id = producers.id AND budget > 1000000
    );

UPDATE producers SET gender = 'female' WHERE id = 1;
-- simple_view изменился, materialized_view - нет

UPDATE producers SET gender = 'male' WHERE id = 1;

-- task 5
SELECT movies.name
FROM movies 
JOIN movie_producer ON movies.id = movie_id
JOIN simple_view ON producer_id = simple_view.id;

-- task 6
SELECT year
FROM (
    SELECT year, COUNT(*) AS movies_count
    FROM movies
    WHERE budget > 300000 
    GROUP BY year
) AS foo
WHERE movies_count = 3;

-- task 7
SELECT *
FROM producers
WHERE id IN (
    SELECT producer_id
    FROM movies
    JOIN movie_actor ON movies.id = movie_actor.movie_id
    JOIN movie_producer ON movies.id = movie_producer.movie_id 
    GROUP BY producer_id
    HAVING COUNT(*) > 5
);

-- task 8
SELECT id, name, surname
FROM actors
JOIN movie_actor ON actors.id = actor_id
GROUP BY id
HAVING COUNT(*) BETWEEN 3 AND 7;


