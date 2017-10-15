/* Set up the database. */

CREATE DATABASE billings;

CREATE TABLE customers (
  id            serial  PRIMARY KEY,
  name          text    NOT NULL,
  payment_token char(8) UNIQUE CHECK (payment_token ~ '^[A-Z]{8}$')
);

INSERT INTO customers VALUES
  (1, 'Pat Johnson',   'XHGOAHEQ'),
  (2, 'Nancy Monreal', 'JKWQPJKL'),
  (3, 'Lynn Blake',    'KLZXWEEE'),
  (4, 'Chen Ke-Hua',   'KWETYCVX'),
  (5, 'Scott Lakso',   'UUEAPQPS'),
  (6, 'Jim Pornot',    'XKJEYAZA');

CREATE TABLE services (
  id          serial         PRIMARY KEY,
  description text           NOT NULL,
  price       numeric(10, 2) NOT NULL CHECK (price >= 0.00)
);

INSERT INTO services VALUES
  (1, 'Unix Hosting',          5.95),
  (2, 'DNS',                   4.95),
  (3, 'Whois Registration',    1.95),
  (4, 'High Bandwidth',       15.00),
  (5, 'Business Support',    250.00),
  (6, 'Dedicated Hosting',    50.00),
  (7, 'Bulk Email',          250.00),
  (8, 'One-to-one Training', 999.00);

CREATE TABLE subscriptions (
  id          serial  PRIMARY KEY,
  customer_id integer NOT NULL REFERENCES customers (id) ON DELETE CASCADE,
  service_id  integer NOT NULL REFERENCES services (id),
  UNIQUE (customer_id, service_id)
);

INSERT INTO subscriptions (customer_id, service_id)
  VALUES (1, 1),
         (1, 2),
         (1, 3),
         (3, 1),
         (3, 2),
         (3, 3),
         (3, 4),
         (3, 5),
         (4, 1),
         (4, 4),
         (5, 1),
         (5, 2),
         (5, 6),
         (6, 1),
         (6, 6),
         (6, 7);

/* Retrieve the customer data for every customer
   who currently subscribes to at least one service. */

SELECT DISTINCT customers.*
  FROM customers
       JOIN subscriptions
         ON customers.id = subscriptions.customer_id;

SELECT DISTINCT customers.*
  FROM subscriptions
       JOIN customers
         ON subscriptions.customer_id = customers.id;

/* Retrieve the customer data for every customer
   who does not currently subscribe to any services. */

SELECT DISTINCT customers.*
  FROM customers
       LEFT JOIN subscriptions
              ON customers.id = subscriptions.customer_id
 WHERE subscriptions.service_id IS NULL;

/* Display all customers with no services and
   all services that currently don't have any customers. */

SELECT *
  FROM subscriptions
       FULL JOIN customers
              ON customers.id = subscriptions.customer_id
       FULL JOIN services
              ON services.id = subscriptions.service_id
 WHERE subscriptions.customer_id IS NULL
    OR subscriptions.service_id  IS NULL;

/* Display a list of all services that are not currently in use.
   (Using RIGHT OUTER JOIN...) */

SELECT services.description
  FROM subscriptions
       RIGHT JOIN services
               ON services.id = subscriptions.service_id
 WHERE subscriptions.service_id IS NULL;

/* Display a list of all customer names together with a comma-separated list
   of the services they use. */

SELECT customers.name,
       string_agg(services.description, ', ') AS services
  FROM customers
       LEFT JOIN subscriptions
              ON subscriptions.customer_id = customers.id
       LEFT JOIN services
              ON subscriptions.service_id = services.id
 GROUP BY customers.id;

/* Display the description for every service that is subscribed to
   by at least 3 customers. Include the customer count. */

SELECT services.description,
       COUNT(subscriptions.customer_id)
  FROM subscriptions
       JOIN services
         ON services.id = subscriptions.service_id
 GROUP BY services.id
HAVING COUNT(subscriptions.customer_id) >= 3;

/* Gross income to expect when every customer pays their services. */

SELECT SUM(services.price) AS gross
  FROM services
       JOIN subscriptions
         ON subscriptions.service_id = services.id;

/* Onboarding John Doe... */

INSERT INTO customers
VALUES (7, 'John Doe', 'EYODHLCN');

INSERT INTO subscriptions (customer_id, service_id)
VALUES (7, 1), (7, 2), (7, 3);

/* Expected income from "big ticket" services (price > $100). */

SELECT SUM(services.price)
  FROM services
       JOIN subscriptions
         ON subscriptions.service_id = services.id
 WHERE services.price > 100.00;

/* Maximum income the company could achieve if it managed to convince all of
   its customers to select all of the company's big ticket items. */

SELECT SUM(services.price)
  FROM services
       CROSS JOIN customers
 WHERE services.price > 100.00;

/* Deleting records. */

-- without DELETE CASCADE
DELETE FROM subscriptions WHERE service_id = 7;
DELETE FROM services      WHERE id = 7;
-- with DELETE CASCADE
DELETE FROM customers     WHERE id = 4;
