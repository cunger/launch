# SQL

SQL (_Structured Query Language_) is a special-purpose, declarative programming language to interact with relational databases.

SQL statements are categorized into:
* **DDL** _Data Definition Language_ for defining and modifying the **schema** (`INSERT`, `DELETE`, `UPDATE`, `SELECT`, etc), alos called CRUD (for: CREATE data, READ data, UPDATE data and DELETE data).
* **DML** _Data Manipulation Language_ for retrieval (querying) and manipulation (inserting, modifying, deleting) of **data** (`CREATE`, `DROP`, `ALTER`, etc).
* **DCL** _Data Control Language_ for controlling rights and access roles (`GRANT`).

Adhere to the [style guide](http://www.sqlstyle.guide).

## Create a table and insert data

CREATE TABLE
ALTER TABLE $table
    RENAME TO $name
    ADD COLUMN $name [$options]
    RENAME COLUMN $name TO $new_name
    ALTER COLUMN $name $attribute
    DROP COLUMN $name
DROP TABLE $name


```
CREATE TABLE table_name (
    column1 <datatype> <constraints>,
    column2 <datatype> <constraints>,
    <constraints>
    ...
);
```

**Example:**
```
CREATE TABLE staff (
    PRIMARY KEY (staff_id),
    staff_id       INT(5)       NOT NULL,
    first_name     VARCHAR(100) NOT NULL,
    pens_in_drawer INT(2)       NOT NULL,
                   CONSTRAINT pens_in_drawer_range
                   CHECK(pens_in_drawer >= 1 AND pens_in_drawer < 100)
);
```

Where [datatypes](https://www.w3schools.com/sql/sql_datatypes.asp) include (in PostgreSQL)
* `serial`
* `uuid`
* `integer`, `real`, `decimal(precision, scale)`
* `varchar(length)`, `text`
* `date`, `timestamp`
* `boolean`
and constraints are `NOT NULL`, `UNIQUE`, `PRIMARY KEY`, etc.
Example for defining the primary key as stand-alone constraint:
```
PRIMARY KEY (column)
PRIMARY KEY (column1, column2)
```

```
INSERT INTO table_name [ (column_name [, ...]) ]
VALUES (value [, ...])
```
For example:
```
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```
Or shorter (if all columns are specified in the values, in their respective order):
```
INSERT INTO table_name
VALUES (value1, value2, value3, ...);
```

Update data:

```
UPDATE table_name
   SET column1 = value1, column2 = value2, ...
 WHERE condition;
```

Delete data:

```
DELETE FROM table_name
 WHERE condition;
```

Add a constraint to a table:

```
ALTER TABLE table_name
ADD CONSTRAINT constraint_name CHECK (column_name >= 0);
```
Or shorter (with auto-generated name):
```
ALTER TABLE table_name
ADD CHECK (column_name >= 0);
```

```
DROP TABLE table_name [ , other_table_name ];
DROP DATABASE database_name;
```

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

If either side of the operator equals `NULL`, the result will be `NULL`. In conditions always check with `IS NULL` or `IS NOT NULL`.

`AND`, `OR`

`IS NULL`, `IS NOT NULL`

`IN`, `NOT IN`
e.g.
* `WHERE id IN (1, 2)`
* `WHERE id IN (SELECT ...)`

Mathematical operations, e.g. `SELECT trunc(4 * pi() * radius ^ 2) FROM ...;`

## Strings

Strings are enclosed by single quotes.
```
'some string'
'A long and winding road'
'That wasn''t a good idea'
'"Indeed!"'
```


`||` for concatenating strings, e.g.
* `SELECT 'The result is ' || result FROM ...`
* `SELECT column1 || column2 || column3 FROM ...`

`SELECT lower(column)`

## Comments

```
/* query to retrieve the radius or a circle */
SELECT radius
  FROM circles
 WHERE something      -- fill in condition
   AND something else -- here as well
```
