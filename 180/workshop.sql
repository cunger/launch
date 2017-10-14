CREATE DATABASE workshop;

CREATE TABLE devices (
  id         serial    PRIMARY KEY,
  name       text      NOT NULL,
  created_at timestamp DEFAULT current_timestamp
);

CREATE TABLE parts (
  id          serial  PRIMARY KEY,
  part_number integer UNIQUE NOT NULL,
  device_id   integer NOT NULL REFERENCES devices(id)
);

INSERT INTO devices (name) VALUES ('Accelerometer');
INSERT INTO devices (name) VALUES ('Gyroscope');

INSERT INTO parts (part_number, device_id) VALUES (1, 1);
INSERT INTO parts (part_number, device_id) VALUES (2, 1);
INSERT INTO parts (part_number, device_id) VALUES (3, 1);

INSERT INTO parts (part_number, device_id) VALUES (1, 2);
INSERT INTO parts (part_number, device_id) VALUES (2, 2);
INSERT INTO parts (part_number, device_id) VALUES (3, 2);
INSERT INTO parts (part_number, device_id) VALUES (4, 2);
INSERT INTO parts (part_number, device_id) VALUES (5, 2);

INSERT INTO parts (part_number) VALUES (1);
INSERT INTO parts (part_number) VALUES (2);
INSERT INTO parts (part_number) VALUES (3);

SELECT devices.name, parts.part_number
  FROM devices
       JOIN parts
       ON devices.id = parts.device_id;

SELECT *
  FROM parts
 WHERE part_number::text LIKE '3%';

SELECT devices.name,
       COUNT(parts.id) AS number_of_parts
  FROM devices
       JOIN parts
       ON devices.id = parts.device_id
 GROUP BY devices.id
 ORDER BY devices.name ASC;

SELECT part_number, device_id
  FROM parts
 WHERE device_id IS NOT NULL;

SELECT part_number, device_id
  FROM parts
 WHERE device_id IS NULL;

INSERT INTO devices (name) VALUES ('Magnetometer');
INSERT INTO parts (part_number, device_id) VALUES (1 , 3);

SELECT name
  FROM devices
 ORDER BY created_at ASC
 LIMIT 1;

UPDATE parts SET device_id = 2 WHERE id IN (7, 8);
UPDATE parts SET device_id = 3 WHERE part_number = (SELECT MAX(part_number) FROM parts);

DELETE FROM parts WHERE device_id = 1;
DELETE FROM devices WHERE id = 1;

ALTER TABLE parts ADD CONSTRAINT fkey
  FOREIGN KEY (device_id)
  REFERENCES devices (id)
  ON DELETE CASCADE;
