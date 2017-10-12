INSERT INTO films (title, year, genre, director, duration)
VALUES ('Wayne''s World', 1992, 'comedy', 'Penelope Spheeris', 95);

INSERT INTO films (title, year, genre, director, duration)
VALUES ('Bourne Identity', 2002, 'espionage', 'Doug Liman', 118);

SELECT DISTINCT genre FROM films;
SELECT genre FROM films GROUP BY genre;

SELECT ROUND(AVG(duration)) FROM films;

SELECT genre, ROUND(AVG(duration)) FROM films GROUP BY genre;

SELECT (year / 10) * 10 AS decade,
       ROUND(AVG(duration))
  FROM films
 GROUP BY decade
 ORDER BY decade ASC;

SELECT * FROM films WHERE director LIKE 'John %';

SELECT genre, COUNT(*) AS count
  FROM films
 GROUP BY genre
 ORDER BY count DESC;

SELECT (year / 10) * 10 AS decade,
       genre,
       STRING_AGG(title, ', ') AS films
  FROM films
 GROUP BY decade, genre
 ORDER BY decade ASC;

SELECT genre, SUM(duration) AS total_duration
  FROM films
 GROUP BY genre
 ORDER BY total_duration ASC;
