CREATE TABLE menu_items (
    item varchar(255) PRIMARY KEY,
    prep_time integer,
    ingredient_cost decimal(4, 2),
    sales integer,
    menu_price decimal(4, 2)
);

INSERT INTO menu_items VALUES ('omelette', 10, 1.50, 182, 7.99);
INSERT INTO menu_items VALUES ('tacos', 5, 2.00, 254, 8.99);
INSERT INTO menu_items VALUES ('oatmeal', 1, 0.50, 79, 5.99);

SELECT item,
       menu_price - ingredient_cost AS profit
  FROM menu_items
 ORDER BY profit DESC
 LIMIT 1;

SELECT item,
       round(prep_time * (13.0 / 60.0), 2) AS labor,
       menu_price - ingredient_cost - round(prep_time * (13.0 / 60.0), 2) AS profit 
  FROM menu_items
 ORDER BY profit DESC;
