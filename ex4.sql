-- task 1
CREATE TABLE movie_actor (
    movie_id INT REFERENCES movies (id) NOT NULL,
    actor_id INT REFERENCES actors (id) NOT NULL
);

CREATE TABLE movie_producer (
    movie_id INT REFERENCES movies (id) NOT NULL,
    producer_id INT REFERENCES producers (id) NOT NULL
);

INSERT INTO movie_actor (movie_id, actor_id) VALUES (1, 5);
INSERT INTO movie_actor (movie_id, actor_id) VALUES (1, 6);
INSERT INTO movie_actor (movie_id, actor_id) VALUES (3, 3);
INSERT INTO movie_actor (movie_id, actor_id) VALUES (3, 4);
INSERT INTO movie_actor (movie_id, actor_id) VALUES (4, 1);
INSERT INTO movie_actor (movie_id, actor_id) VALUES (4, 4);
INSERT INTO movie_actor (movie_id, actor_id) VALUES (6, 1);
INSERT INTO movie_actor (movie_id, actor_id) VALUES (6, 2);
INSERT INTO movie_actor (movie_id, actor_id) VALUES (6, 3);

INSERT INTO movie_producer (movie_id, producer_id) VALUES (1, 1);
INSERT INTO movie_producer (movie_id, producer_id) VALUES (2, 1);
INSERT INTO movie_producer (movie_id, producer_id) VALUES (3, 1);
INSERT INTO movie_producer (movie_id, producer_id) VALUES (4, 1);
INSERT INTO movie_producer (movie_id, producer_id) VALUES (5, 1);
INSERT INTO movie_producer (movie_id, producer_id) VALUES (6, 1);

-- task 2
ALTER TABLE producers ADD COLUMN best_movie INT REFERENCES movies (id);
UPDATE producers SET best_movie = 1 WHERE id = 1;

-- task 3 is already done by previous homework

-- task 4
ALTER TABLE producers ALTER COLUMN motherland SET DEFAULT 'UK';

-- task 5
ALTER TABLE actors DROP CONSTRAINT actors_number_of_movies_check;

-- task 6
ALTER TABLE movies DROP CONSTRAINT movies_budget_check;
ALTER TABLE movies ADD CHECK (budget >= 1000);

-- task 7
ALTER TABLE movies DROP COLUMN genres;

CREATE TABLE genres (
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL
);

INSERT INTO genres (name) VALUES ('drama');
INSERT INTO genres (name) VALUES ('criminal');
INSERT INTO genres (name) VALUES ('western');
INSERT INTO genres (name) VALUES ('comedy');
INSERT INTO genres (name) VALUES ('thriller');
INSERT INTO genres (name) VALUES ('detective');
INSERT INTO genres (name) VALUES ('adventure');

CREATE TABLE movie_genre (
    movie_id INT REFERENCES movies (id) NOT NULL,
    genre_id INT REFERENCES genres (id) NOT NULL
);

INSERT INTO movie_genre (movie_id, genre_id) VALUES (1, 1);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (1, 2);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (1, 4);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (1, 5);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (2, 1);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (2, 2);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (2, 4);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (2, 5);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (3, 1);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (3, 4);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (3, 5);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (3, 7);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (4, 1);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (4, 3);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (4, 4);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (5, 1);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (5, 3);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (5, 6);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (6, 1);
INSERT INTO movie_genre (movie_id, genre_id) VALUES (6, 4);

-- task 8
CREATE TYPE country AS ENUM ('USA', 'UK', 'Russia', 'France', 'Germany');

ALTER TABLE producers DROP COLUMN motherland;
ALTER TABLE producers ADD COLUMN motherland country DEFAULT 'UK' NOT NULL;

ALTER TABLE actors DROP COLUMN motherland;
ALTER TABLE actors ADD COLUMN motherland country DEFAULT 'UK' NOT NULL;

-- task 9
ALTER TABLE producers ADD CHECK (birthday < now());
ALTER TABLE actors ADD CHECK (birthday < now());

-- task 10
CREATE VIEW actros_from_new_century_films AS
    SELECT * FROM actors
	WHERE id IN
	(SELECT actor_id 
	 FROM movie_actor
    WHERE movie_id IN (SELECT id FROM movies WHERE year > 2000)
	ORDER BY actor_id);

-- task 11
UPDATE movies SET name = name || '(' || year::varchar || ')';