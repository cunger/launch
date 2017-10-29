COPY bidders FROM '/home/christina/workspace/launchschool/launch/180/auction/bidders.csv' CSV HEADER;
COPY items   FROM '/home/christina/workspace/launchschool/launch/180/auction/items.csv'   CSV HEADER;
COPY bids    FROM '/home/christina/workspace/launchschool/launch/180/auction/bids.csv'    CSV HEADER;

-- Alternative:
-- $ psql
-- > \copy bidders FROM 'bidders.csv' CSV HEADER DELIMITER ',';
