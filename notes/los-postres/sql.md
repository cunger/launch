# SQL

SQL (_Structured Query Language_) is a special-purpose, declarative programming language to interact with relational databases.

SQL statements are categorized into:
* **DDL** _Data Definition Language_ for specifying the database structure or **schema**. That is, for creating, modifying and deleting databases and tables. Comprises all SQL commands that define the structure and properties of data, but don't actually manipulate any data records, e.g.:
    - `CREATE` (`DATABASE | TABLE | SEQUENCE`)
    - `ALTER`
    - `DROP` (partly also DML, as it deletes all data from a database)
    - ...
* **DML** _Data Manipulation Language_ for managing **data**, i.e. for retrieval (querying) and manipulation (inserting, modifying, deleting) of data records.
    - `INSERT`
    - `UPDATE`
    - `DELETE`
    - `SELECT`
    - ...
  CRUD are the four basic functions of persistent storage: create data (`INSERT`), read data (`SELECT`), update data (`UPDATE`) and delete data (`DELETE`).
* **DCL** _Data Control Language_ for controlling rights and roles for accessing data.
    - `GRANT`
    - `REVOKE`

Adhere to the [style guide](http://www.sqlstyle.guide).

## DDL

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

Constraints are `NOT NULL`, `UNIQUE`, `PRIMARY KEY`, etc.
Example for defining the primary key as stand-alone constraint:
```
PRIMARY KEY (column)
PRIMARY KEY (column1, column2)
```

**Examples:**

```sql
CREATE TABLE reviews (
  id serial PRIMARY KEY,
  content text,
  product_id integer REFERENCES product(id) NOT NULL
);
```

```sql
CREATE TABLE staff (
    PRIMARY KEY (staff_id),
    staff_id       INT(5)       NOT NULL,
    first_name     VARCHAR(100) NOT NULL,
    pens_in_drawer INT(2)       NOT NULL,
                   CONSTRAINT pens_in_drawer_range
                   CHECK(pens_in_drawer >= 1 AND pens_in_drawer < 100)
);
```

Add a constraint to a table:

```
ALTER TABLE table_name
ADD CONSTRAINT constraint_name CHECK (column_name >= 0);

ALTER TABLE table
ADD CONSTRAINT unique_column UNIQUE(column);
```
Or shorter (with auto-generated name):
```
ALTER TABLE table ADD CHECK (column >= 0);
ALTER TABLE table ADD UNIQUE(column);
```

Add a column:
```
ALTER TABLE table ADD COLUMN id serial PRIMARY KEY;
```

```
ALTER TABLE table ALTER COLUMN column SET NOT NULL;
```

```
ALTER TABLE table_name ALTER COLUMN column SET DEFAULT 0;
ALTER TABLE table_name ALTER COLUMN column SET NOT NULL;
```

Drop:

```
ALTER TABLE table DROP CONSTRAINT constraint_name;

ALTER TABLE table ALTER COLUMN column DROP NOT NULL;

DROP TABLE table_name [ , other_table_name ];
DROP DATABASE database_name;
```

Schema can be used to restrict data injection in three ways:
* datatype
* modifiers like NOT NULL
* constraints like uniqueness, checks for length and structure, etc.

## DML

Injecting data:

```
INSERT INTO table_name [ (column_name [, ...]) ]
VALUES (value [, ...]);
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

## Querying

The GROUP BY clause groups records into summary rows, returning one record for each group.

### Joins

Joins are clause in SQL statements that combine rows from two (or more) tables, based on a related column between them.

**INNER JOIN** contains all records in the intersection of both tables

**LEFT (OUTER) JOIN** contains all records in the left table (with matching records from the right table if present, otherwise NULL)
**RIGHT (OUTER) JOIN** contains all records in the right table (with matching records from the left table if present, otherwise NULL)
**FULL (OUTER) JOIN** combines the results of left and right join (so good for including both rows from T1 that don't have a match in T2 and rows in T2 that don't have a match in T1, without needing a full-blown cross join)

**CROSS JOIN** corresponds to the Cartesian product: all records of the left table matched with each record in the right table.

The cross join is what you get when you `SELECT * FROM table1, table2`.
An inner join then is like `SELECT * FROM table1, table2 WHERE table1.table2_id = table2.id`.

> CROSS JOIN is generally best suited to generating test data rather than production queries.

## Operators

`=`, `<`, `<=`, `>`, `>=`, `LIKE`, `NOT LIKE`

Wildcards:
* `_` matches exactly one character
* `%` matches zero or more characters

If either side of the operator equals `NULL`, the result will be `NULL`. Because `NULL` refers to a missing or unknown value (so the result of the operation is also unknown).

In the results of conditions, such as `column >= 0`, rows with `NULL` in `column` will not be included.
Also, `NULL` values cannot be compared, so in results of statements with `ORDER BY` clauses rows with `NULL` values will appear first or last.

In conditions always check for `NULL` with `IS NULL` or `IS NOT NULL`.

`AND`, `OR`

`IN`, `NOT IN`
e.g.
* `WHERE id IN (1, 2)`
* `WHERE id IN (SELECT ...)`

Mathematical operations, e.g. `SELECT trunc(4 * pi() * radius ^ 2) FROM ...;`

`BETWEEN`

In PostgreSQL, `a BETWEEN x AND y` is equivalent to `a >= x AND a <= y`.

## Strings

Strings are enclosed by single quotes.
```
'some string'
'A long and winding road'
'That wasn''t a good idea'
'"Indeed!"'
```

Double quotes can be used to escape identifiers that are reserved keywords in SQL, e.g. `"when"`.

`||` for concatenating strings, e.g.
* `SELECT 'The result is ' || result FROM ...`
* `SELECT column1 || column2 || column3 FROM ...`

`SELECT lower(column)`

## Timestamps

`'2017-8-20 17:00:00'`

## Comments

```sql
/* query to retrieve the radius or a circle */
SELECT radius
  FROM circles
 WHERE something      -- fill in condition
   AND something_else -- here as well
```
