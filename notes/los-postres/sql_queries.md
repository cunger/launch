
# Querying

## Operators

`=`, `<>`, `<`, `<=`, `>`, `>=`

`LIKE`, `NOT LIKE`

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

## Comments

```sql
/* query to retrieve the radius or a circle */
SELECT radius
  FROM circles
 WHERE something      -- fill in condition
   AND something_else -- here as well
```

## Aggregation

`COUNT(*)` counts all rows
`COUNT(column)` counts all rows in which `column` has a non-NULL value

`||` for concatenating strings, e.g.
* `SELECT 'The result is ' || result FROM ...`
* `SELECT column1 || column2 || column3 FROM ...`

`SELECT lower(column)`

## Grouping

`GROUP BY column` groups together all rows that have the same value in `column`.

Example:
```sql
-- select the number of employees in each department in the year 2013
SELECT department, COUNT(*)
  FROM employees
 WHERE year = 2013
 GROUP BY department;
 ```

`GROUP BY column1, column2` groups by `(column1, column2)`, e.g. `GROUP BY last_name, first_name`.

The rest of the columns can have different values within one group, so it makes sense to aggregate on them, but it doesn't make sense to put them in a SELECT clause (which of the values to return?).

Groups can be filtered by means of `HAVING`.

```sql
SELECT last_name, first_name,
       AVG(salary) AS average_salary,
       COUNT(year) AS years_worked
  FROM employees
 GROUP BY last_name, first_name
HAVING years_worked > 2
 ORDER BY average_salary DESC;
```

## Joins

Joins are clause in SQL statements that combine rows from two (or more) tables, based on a related column between them.

_Inner join:_
* **(INNER) JOIN** contains all records in the intersection of both tables

```sql
SELECT *
  FROM table1
       JOIN table2
         ON table2.table1_column = table1.column
 WHERE ...;
```

_Outer joins:_
* **LEFT (OUTER) JOIN** contains all records in the left table (with matching records from the right table if present, otherwise NULL)
* **RIGHT (OUTER) JOIN** contains all records in the right table (with matching records from the left table if present, otherwise NULL)
* **FULL (OUTER) JOIN** combines the results of left and right join (so good for including both rows from T1 that don't have a match in T2 and rows in T2 that don't have a match in T1, without needing a full-blown cross join)

_Cross join:_

* **CROSS JOIN** corresponds to the Cartesian product: all records of the left table matched with each record in the right table.

The cross join is what you get when you `SELECT * FROM table1, table2`.
An inner join then is like `SELECT * FROM table1, table2 WHERE table1.table2_id = table2.id`.

> CROSS JOIN is generally best suited to generating test data rather than production queries.

_Self joins:_

Example: all pairs of students that share the same room

```sql
SELECT s1.name, s2.name
  FROM student AS s1
  JOIN student AS s2
    ON s1.room_number = s2.room_number
 WHERE s1.id <> s2.id ;
 ```
## Subqueries

## Performance

`EXPLAIN sql-statement` constructs a query plan and estimates the costs (in terms of system resources) for executing it.

`EXPLAIN ANAYLYZE sql-statement` in addition executes the query and displays the time needed for planning and execution.

Useful to compare the efficiency of different queries, e.g. usually using sub-queries is much faster than using `JOIN`s.

When it comes to `ORDER BY`, it makes a big difference whether you look at an **unindexed** column, on which sorting is pretty costly (as it needs several passes on the table), or an **indexed** column, for which sorting comes for free because the index already gives you an order (so retrieval actually doesn't need any additional sorting). For example:

```
auction=# EXPLAIN ANALYZE SELECT * FROM bids ORDER BY amount;

                                                QUERY PLAN                                                
----------------------------------------------------------------------------------------------------------
 Sort  (cost=104.83..108.61 rows=1510 width=26) (actual time=0.024..0.025 rows=26 loops=1)
   Sort Key: amount
   Sort Method: quicksort  Memory: 27kB
   ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=26) (actual time=0.004..0.005 rows=26 loops=1)
 Planning time: 0.059 ms
 Execution time: 0.037 ms

auction=# EXPLAIN ANALYZE SELECT * FROM bids ORDER BY item_id;

                                                              QUERY PLAN                                                               
---------------------------------------------------------------------------------------------------------------------------------------
 Index Scan using bids_item_id_bidder_id_idx on bids  (cost=0.15..70.80 rows=1510 width=26) (actual time=0.006..0.012 rows=26 loops=1)
 Planning time: 0.058 ms
 Execution time: 0.034 ms
```
