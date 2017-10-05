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
