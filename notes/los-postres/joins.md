# Joins

Joins are clause in SQL statements that combine rows from two (or more) tables, based on a related column between them.

## Inner join

**(INNER) JOIN** contains all records in the intersection of both tables

## Outer joins

**LEFT (OUTER) JOIN** contains all records in the left table (with matching records from the right table if present, otherwise NULL)
**RIGHT (OUTER) JOIN** contains all records in the right table (with matching records from the left table if present, otherwise NULL)
**FULL (OUTER) JOIN** combines the results of left and right join (so good for including both rows from T1 that don't have a match in T2 and rows in T2 that don't have a match in T1, without needing a full-blown cross join)

## Cross join

**CROSS JOIN** corresponds to the Cartesian product: all records of the left table matched with each record in the right table.

The cross join is what you get when you `SELECT * FROM table1, table2`.
An inner join then is like `SELECT * FROM table1, table2 WHERE table1.table2_id = table2.id`.

> CROSS JOIN is generally best suited to generating test data rather than production queries.

# Self joins

Example: all pairs of students that share the same room

```sql
SELECT s1.name, s2.name
  FROM student AS s1
  JOIN student AS s2
    ON s1.room_number = s2.room_number
 WHERE s1.id <> s2.id ;
 ```
