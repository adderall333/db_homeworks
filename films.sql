CREATE TABLE movies (
    id BIGSERIAL NOT NULL,
	name VARCHAR(40) NOT NULL,
	description VARCHAR(300) NOT NULL,
	year INTEGER NOT NULL CHECK(year > 1900 AND year < 10 + EXTRACT(YEAR FROM now())),
	genres VARCHAR(50) NOT NULL,
	country VARCHAR(20) NOT NULL,
	budget INTEGER NOT NULL CHECK(budget >= 10000),
	PRIMARY KEY(name, year)
);

CREATE TABLE actors (
    id BIGSERIAL PRIMARY KEY NOT NULL,
	surname VARCHAR(20) NOT NULL,
	name VARCHAR(20) NOT NULL,
	birthday DATE NOT NULL,
	motherland VARCHAR(20) NOT NULL,
	number_of_movies INTEGER NOT NULL CHECK(number_of_movies >= 5),
	CONSTRAINT actor_unique UNIQUE(surname, name, birthday) 
);

CREATE TABLE producers (
    id BIGSERIAL PRIMARY KEY NOT NULL,
	surname VARCHAR(20) NOT NULL,
	name VARCHAR(20) NOT NULL,
	birthday DATE NOT NULL,
	motherland VARCHAR(20) NOT NULL DEFAULT 'USA'
);

INSERT INTO movies (name, description, year, genres, country, budget) VALUES ('Pulp Fiction', 'Pulp Fiction is a 1994 American neo-noir black comedy crime film written and directed by Quentin Tarantino, who conceived it with Roger Avary. Starring John Travolta, Samuel L. Jackson, Bruce Willis, Tim Roth, Ving Rhames, and Uma Thurman, it tells several stories of criminal Los Angeles.', 1994, 'drama, criminal, thriller, comedy', 'USA', 8000000);
INSERT INTO movies (name, description, year, genres, country, budget) VALUES ('Reservoir Dogs', 'Reservoir Dogs is a 1992 American crime film written and directed by Quentin Tarantino in his feature-length debut. It stars Harvey Keitel, Tim Roth, Chris Penn, Steve Buscemi, Lawrence Tierney, Michael Madsen, Quentin Tarantino, and Edward Bunker as diamond thieves whose planned heist of a jewelry store goes terribly wrong. The film depicts the events before and after the heist. Kirk Baltz, Randy Brooks, and Steven Wright also play supporting roles. It incorporates many motifs that have become Tarantinos hallmarks: violent crime, pop culture references, profanity, and nonlinear storytelling.', 1992, 'drama, criminal, thriller, comedy', 'USA', 2000000);
INSERT INTO movies (name, description, year, genres, country, budget) VALUES ('Inglourious basterds', 'Inglourious Basterds is a 2009 war film written and directed by Quentin Tarantino and starring Brad Pitt, Christoph Waltz, Michael Fassbender, Eli Roth, Diane Kruger, Daniel Brühl, Til Schweiger and Mélanie Laurent. The film tells an alternate history story of two plots to assassinate Nazi Germanys leadership, one planned by Shosanna Dreyfus (Laurent), a young French Jewish cinema proprietor, and the other by a team of Jewish American soldiers led by First Lieutenant Aldo Raine (Pitt).', 2009, 'drama, thriller, comedy, adventure', 'USA', 70000000);
INSERT INTO movies (name, description, year, genres, country, budget) VALUES ('Django Unchained', 'Django Unchained (/ˈdʒæŋɡoʊ/) is a 2012 American revisionist Western film written and directed by Quentin Tarantino, starring Jamie Foxx, Christoph Waltz, Leonardo DiCaprio, Kerry Washington, and Samuel L. Jackson, with Walton Goggins, Dennis Christopher, James Remar, Michael Parks.', 2012, 'drama, western comedy', 'USA', 100000000);
INSERT INTO movies (name, description, year, genres, country, budget) VALUES ('The Hateful Eight', 'The Hateful Eight (sometimes marketed as The H8ful Eight) is a 2015 American revisionist Western mystery film written and directed by Quentin Tarantino. It stars Samuel L. Jackson, Kurt Russell, Jennifer Jason Leigh, Walton Goggins, Demián Bichir, Tim Roth, Michael Madsen, and Bruce Dern as eight strangers who seek refuge from a blizzard in a stagecoach stopover some time after the American Civil War.', 2015, 'drama, detective, western', 'USA', 44000000);
INSERT INTO movies (name, description, year, genres, country, budget) VALUES ('Once Upon a Time in Hollywood', 'Once Upon a Time in Hollywood is a 2019 American comedy-drama film written and directed by Quentin Tarantino. Produced by Columbia Pictures, Bona Film Group, Heyday Films, and Visiona Romantica and distributed by Sony Pictures Releasing, it is a co-production between the United States, United Kingdom, and China. It features a large ensemble cast led by Leonardo DiCaprio, Brad Pitt, and Margot Robbie.', 2019, 'drama, comedy', 'USA', 161000000);

INSERT INTO actors (surname, name, birthday, motherland, number_of_movies) VALUES ('Di Caprio', 'Leonardo', DATE('1974-11-11'), 'USA', 20);
INSERT INTO actors (surname, name, birthday, motherland, number_of_movies) VALUES ('Robbie', 'Margot', DATE('1990-07-02'), 'Australia', 20);
INSERT INTO actors (surname, name, birthday, motherland, number_of_movies) VALUES ('Pitt', 'Brad', DATE('1963-12-18'), 'USA', 20);
INSERT INTO actors (surname, name, birthday, motherland, number_of_movies) VALUES ('Waltz', 'Christoph', DATE('1956-10-04'), 'Germany', 20);
INSERT INTO actors (surname, name, birthday, motherland, number_of_movies) VALUES ('Thurman', 'Uma', DATE('1970-04-29'), 'USA', 20);
INSERT INTO actors (surname, name, birthday, motherland, number_of_movies) VALUES ('John', 'Travolta', DATE('1954-02-18'), 'USA', 20);

INSERT INTO producers (surname, name, birthday, motherland) VALUES ('Tarantiono', 'Quentin', DATE('1963-03-27'), 'USA');
INSERT INTO producers (surname, name, birthday, motherland) VALUES ('Fincher', 'David', DATE('1962-08-28'), 'USA');
INSERT INTO producers (surname, name, birthday, motherland) VALUES ('Lynch', 'David', DATE('1946-01-20'), 'USA');
INSERT INTO producers (surname, name, birthday, motherland) VALUES ('Spielberg', 'Steven', DATE('1946-12-18'), 'USA');
INSERT INTO producers (surname, name, birthday, motherland) VALUES ('Aronofsky', 'Darren', DATE('1969-02-12'), 'USA');
INSERT INTO producers (surname, name, birthday, motherland) VALUES ('Demme', 'Jonathan', DATE('1944-02-22'), 'USA');

ALTER TABLE movies DROP CONSTRAINT movies_pkey;
ALTER TABLE movies ADD PRIMARY KEY (id);