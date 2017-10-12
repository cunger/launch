
/* How many tickets have been sold */
SELECT COUNT(*) FROM tickets;

/* How many customers bought at least one ticket */
SELECT COUNT(DISTINCT customer_id) FROM tickets;

/* The percentage of customers that have purchased a ticket */
   SELECT 100 * (COUNT(DISTINCT tickets.customer_id) / COUNT(DISTINCT customers.id)::float) AS percent
     FROM customers
LEFT JOIN tickets ON tickets.customer_id = customers.id;

/* The name of each event and how many tickets were sold for it,
   in order from most popular to least popular */
   SELECT events.name, COUNT(DISTINCT tickets.id) AS popularity
     FROM events
LEFT JOIN tickets ON tickets.event_id = events.id
 GROUP BY events.id
 ORDER BY popularity DESC;

/* user id, email address, and number of events for all customers
   that have purchased tickets to three events */
SELECT customers.id, customers.email,
       COUNT(DISTINCT tickets.event_id)
  FROM customers
  JOIN tickets ON customers.id = tickets.customer_id
 GROUP BY customers.id
HAVING COUNT(DISTINCT tickets.event_id) = 3;

/* Print out a report of all tickets purchased by the customer with the email address 'gennaro.rath@mcdermott.co'.
   The report should include the event name and starts_at and the seat's section name, row, and seat number. */
SELECT events.name AS event, events.starts_at,
       sections.name AS section,
       seats.row, seats.number AS seat
  FROM customers
  JOIN tickets  ON customers.id = tickets.customer_id
  JOIN events   ON events.id    = tickets.event_id
  JOIN seats    ON seats.id     = tickets.seat_id
  JOIN sections ON sections.id  = seats.section_id
 WHERE customers.email = 'gennaro.rath@mcdermott.co';
