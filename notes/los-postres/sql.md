SQL (_Structured Query Language_) is the programming language used to communicate with a relational database.

SQL statements are categorized into:
* _Data Definition Language_ for defining and modifying the **schema** (`INSERT`, `DELETE`, `UPDATE`, `SELECT`, etc), alos called CRUD (for: CREATE data, READ data, UPDATE data and DELETE data).
* _Data Manipulation Language_ for inserting, modifying, deleting, and querying **data** (`CREATE`, `DROP`, `ALTER`, etc).

## Joins

Joins are clause in SQL statements that combine rows from two (or more) tables, based on a related column between them.

**INNER JOIN** contains all records in the intersection of both tables

**LEFT (OUTER) JOIN** contains all records in the left table (with matching records from the right table if present, otherwise NULL)
**RIGHT (OUTER) JOIN** contains all records in the right table (with matching records from the left table if present, otherwise NULL)
**FULL OUTER JOIN**

**CROSS JOIN** corresponds to the Cartesian product: all records of the left table matched with each record in the right table

## Operators

`=`, `<`, `<=`, `>`, `>=`, `LIKE`, `NOT LIKE`

Wildcards:
* `_` matches exactly one character
* `%` matches zero or more characters

`AND`, `OR`

`IS NULL`, `IS NOT NULL`

`IN`, `NOT IN`
e.g.
* `WHERE id IN (1, 2)`
* `WHERE id IN (SELECT ...)`
