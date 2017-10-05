
CREATE TABLE films (
    title varchar(255),
    year integer,
    genre varchar(100)
);

INSERT INTO films VALUES ('Die Hard', 1988, 'action');
INSERT INTO films VALUES ('Casablanca', 1942, 'drama');
INSERT INTO films VALUES ('The Conversation', 1974, 'thriller');

SELECT * FROM films WHERE length(title) < 12;

ALTER TABLE films ADD COLUMN director varchar(255);
ALTER TABLE films ADD COLUMN duration integer CHECK (length > 0);

UPDATE films SET director = 'John McTiernam', duration = 132 WHERE title = 'Die Hard';
UPDATE films SET director = 'Michael Curtiz', duration = 102 WHERE title = 'Casablanca';
UPDATE films SET director = 'Francis Ford Coppola', duration = 113 WHERE title = 'The Conversation';

INSERT INTO films VALUES ('1984', 1956, 'scifi', 'Michael Anderson', 90);
INSERT INTO films VALUES ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127);
INSERT INTO films VALUES ('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);

/* Return the title and age in years of each movie, with newest movies listed first. */
SELECT title,
       EXTRACT(YEAR FROM NOW()) - year AS age
  FROM films
 ORDER BY age ASC;

/* Return the title and duration of each movie longer than two hours, with the longest movies first. */
SELECT title, duration
  FROM films
 WHERE duration > 120
 ORDER BY duration DESC;

/* Return the title of the longest movie. */
SELECT title
  FROM films
 ORDER BY duration DESC
 LIMIT 1;
