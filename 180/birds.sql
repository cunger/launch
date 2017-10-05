CREATE TABLE birds (
    name varchar(80) NOT NULL,
    length decimal(3, 1),
    wingspan decimal(3, 1),
    family varchar(80),
    extinct boolean DEFAULT false
);

INSERT INTO birds VALUES ('Spotted Towhee', 21.6, 26.7, 'Emberizidae', false);
INSERT INTO birds VALUES ('American Robin', 25.5, 36.0, 'Turdidae', false);
INSERT INTO birds VALUES ('Greater Koa Finch', 19.0, 24.0, 'Fringillidae', true);
INSERT INTO birds VALUES ('Carolina Parakeet', 33.0, 55.8, 'Psittacidae', true);
INSERT INTO birds VALUES ('Common Kestrel', 35.5, 73.5, 'Falconidae', false);

SELECT name, family FROM birds WHERE extinct = false ORDER BY length DESC;

SELECT round(avg(wingspan), 1), min(wingspan), max(wingspan) FROM birds;
