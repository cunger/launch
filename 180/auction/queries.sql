-- All items that have bids on them

SELECT name AS "Bid on Items"
  FROM items
 WHERE id IN (SELECT DISTINCT item_id FROM bids);

 -- All items that don't have bids on them

 SELECT name AS "Not Bid On"
   FROM items
  WHERE id NOT IN (SELECT DISTINCT item_id FROM bids);

-- Everyone who has bid in an auction

SELECT name
  FROM bidders
 WHERE EXISTS (SELECT * FROM bids WHERE bids.bidder_id = bidders.id);

SELECT DISTINCT name
  FROM bidders
       JOIN bids
         ON bids.bidder_id = bidders.id;

-- Names of all items that have bids of less than 100 dollars

SELECT name AS "Has A Bid Less Than 100 Dollars"
  FROM items
 WHERE 100.00 > ANY (SELECT amount FROM bids WHERE bids.item_id = items.id);

SELECT name AS "Highest Bid Less Than 100 Dollars"
  FROM items
 WHERE EXISTS (SELECT * FROM bids WHERE bids.item_id = items.id)
   AND 100.00 > ALL (SELECT amount FROM bids WHERE bids.item_id = items.id);

-- Alternative:

SELECT name AS "Highest Bid Less Than 100 Dollars"
  FROM items
 WHERE id =  ANY (SELECT item_id FROM bids)
   AND id <> ALL (SELECT item_id FROM bids WHERE amount > 100.00);

-- Find the largest number of bids from an individual bidder

SELECT MAX(number_of_bids)
  FROM (SELECT COUNT(id) AS number_of_bids FROM bids GROUP BY bidder_id) AS t;

-- Number of bids on each item

SELECT items.name,
       (SELECT COUNT(bids.id) FROM bids WHERE bids.item_id = items.id) AS count
  FROM items;

SELECT items.name,
       COUNT(bids.id)
  FROM items
       LEFT JOIN bids
              ON bids.item_id = items.id
 GROUP BY items.id;

-- Get the ID of a specific item

SELECT id
  FROM items
 WHERE name = 'Painting'
   AND initial_price = 100.00
   AND sales_price = 250.00;

-- without AND:

SELECT id
  FROM items
 WHERE ROW('Painting', 100.00, 250.00) = ROW(name, initial_price, sales_price);
