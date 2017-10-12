CREATE TABLE people (
    name varchar(255) NOT NULL,
    age int NOT NULL CHECK (age >= 0),
    occupation varchar(80)
);
INSERT INTO people VALUES ('Abby', 34, 'biologist');
INSERT INTO people (name, age) VALUES ('Mu''nisah', 26);
INSERT INTO people VALUES ('Mirabelle', 40, 'contractor');

SELECT * FROM people WHERE age < 30;
SELECT * FROM people WHERE name LIKE 'M%' AND occupation IS NULL;

/* Extracting states and the amount of people living there. */

SELECT state, COUNT(id) AS count
  FROM people
 GROUP BY state
 ORDER BY count DESC
 LIMIT 10;

-- COUNT(*) and COUNT(state) would also work
-- only COUNT(DISTINCT state) would not, as it returns 1


/* Extracting domains from email addresses. */

SELECT substring(email FROM POSITION('@' IN email) + 1) AS domain,
       COUNT(*) AS count
  FROM people
 GROUP BY domain
 ORDER BY count DESC;

/* Upper-case all names of people with a teleworm.us domain. */

UPDATE people
   SET given_name = UPPER(given_name)
 WHERE email LIKE '%teleworm.us';
