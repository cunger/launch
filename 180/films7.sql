CREATE TABLE directorhood (
  id serial PRIMARY KEY,
  film_id integer REFERENCES films (id) ON DELETE CASCADE,
  director_id integer REFERENCES directors (id) ON DELETE CASCADE
);

INSERT INTO directorhood (film_id, director_id) VALUES (1, 1);
INSERT INTO directorhood (film_id, director_id) VALUES (2, 2);
INSERT INTO directorhood (film_id, director_id) VALUES (3, 3);
INSERT INTO directorhood (film_id, director_id) VALUES (4, 4);
INSERT INTO directorhood (film_id, director_id) VALUES (5, 5);
INSERT INTO directorhood (film_id, director_id) VALUES (6, 6);
INSERT INTO directorhood (film_id, director_id) VALUES (7, 3);
INSERT INTO directorhood (film_id, director_id) VALUES (8, 7);
INSERT INTO directorhood (film_id, director_id) VALUES (9, 8);
INSERT INTO directorhood (film_id, director_id) VALUES (10, 4);

ALTER TABLE films DROP COLUMN director_id;

SELECT films.title, directors.name
  FROM films
       JOIN directorhood AS glue
       ON films.id = glue.film_id
       JOIN directors
       ON directors.id = glue.director_id
 ORDER BY films.title;

INSERT INTO directors (name) VALUES ('Joel Coen');
INSERT INTO directors (name) VALUES ('Ethan Coen');
INSERT INTO directors (name) VALUES ('Frank Miller');
INSERT INTO directors (name) VALUES ('Robert Rodriguez');

INSERT INTO films (title, year, genre, duration)
VALUES ('Fargo', 1996, 'comedy', 98);

INSERT INTO films (title, year, genre, duration)
VALUES ('No Country for Old Men', 2007, 'western', 122);

INSERT INTO films (title, year, genre, duration)
VALUES ('Sin City', 2005, 'crime', 124);

INSERT INTO films (title, year, genre, duration)
VALUES ('Spy Kis', 2001, 'scifi', 88);

INSERT INTO directorhood (film_id, director_id) VALUES (11, 9);
INSERT INTO directorhood (film_id, director_id) VALUES (12, 9);
INSERT INTO directorhood (film_id, director_id) VALUES (12, 10);
INSERT INTO directorhood (film_id, director_id) VALUES (13, 11);
INSERT INTO directorhood (film_id, director_id) VALUES (13, 12);
INSERT INTO directorhood (film_id, director_id) VALUES (14, 12);

SELECT directors.name, COUNT(directorhood.film_id) AS films
  FROM directors
       JOIN directorhood
       ON directors.id = directorhood.director_id
 GROUP BY directors.id
 ORDER BY films DESC, directors.name ASC;
