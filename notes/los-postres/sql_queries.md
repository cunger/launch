
# Querying

## Operators

_String matching:_

`LIKE`, `NOT LIKE`

Wildcards:
* `_` matches exactly one character
* `%` matches zero or more characters

_Boolean:_

`AND`, `OR`

_Set inclusion:_

`IN`, `NOT IN`
e.g.
* `WHERE id IN (1, 2)`
* `WHERE id IN (SELECT ...)`

_Comparison:_

`=`, `<>`, `<`, `<=`, `>`, `>=`, `BETWEEN ... AND ...`

In PostgreSQL, `a BETWEEN x AND y` is equivalent to `a >= x AND a <= y`, i.e. works for numbers and date times and is inclusive.

If either side of an operator equals `NULL`, the result will be `NULL`. This is because `NULL` refers to a missing or unknown value, so the result of the comparison is also unknown. The same holds for most [functions](sql_functions.md).

Return values that are `NULL` are not be included in the result set.
Also, `NULL` values cannot be compared, so in results of statements with `ORDER BY` clauses rows with `NULL` values will appear either first or last.

_Equality with `NULL`_:
* A condition `column = NULL` will never be true, i.e. the result will always be empty.
* A condition `column <> 'some value'` will not return rows where `column` is `NULL`.
Therefore, in conditions checking for `NULL`, always use `IS NULL` or `IS NOT NULL`.
This includes arrays like `('value1', 'value2', ...)`: they cannot contain `NULL`.

## Grouping

`GROUP BY c` groups together all rows that have the same value in column `c`.

_Example:_
```sql
-- select the number of employees in each department in the year 2013
SELECT department, COUNT(*)
  FROM employees
 WHERE year = 2013
 GROUP BY department;
 ```

Columns other than `c` can have different values within one group, so it makes sense to aggregate on them, but it doesn't make sense to put them in a `SELECT` clause without aggregation (which of the values to return?).

`GROUP BY column1, column2` groups by `(column1, column2)`, e.g. `GROUP BY last_name, first_name`.

In addition, groups can be filtered by means of `HAVING`.

_Example:_
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

Joins are clause in SQL statements that combine rows from two or more tables, based on a related column between them.

_Inner join:_

* **(INNER) JOIN** contains all records in the intersection of both tables.

```sql
SELECT *
  FROM table1
       JOIN table2
         ON table2.table1_column = table1.column
 WHERE ...;
```

This can get as complex as necessary:

```sql
SELECT *
  FROM table1
       JOIN table2
         ON table2.table1_column = table1.column
       JOIN table3
         ON (table3.column1, table3.column2) = (table1.column1, table1.column2)
       ...
 WHERE ...;
```

_Outer joins:_

* **LEFT (OUTER) JOIN** contains all records in the left table, with matching records from the right table if present (otherwise `NULL`).
* **RIGHT (OUTER) JOIN** contains all records in the right table, with matching records from the left table if present (otherwise `NULL`).
* **FULL (OUTER) JOIN** combines the results of left and right join. This is particularly useful for including rows from T1 that don't have a match in T2 as well as rows in T2 that don't have a match in T1 without needing a full-blown cross join.

_Cross join:_

* **CROSS JOIN** corresponds to the Cartesian product and contains all records of the left table matched with each record in the right table.

The cross join is what you get when you `SELECT * FROM table1, table2`.
An inner join then is like `SELECT * FROM table1, table2 WHERE table1.table2_id = table2.id`.

> CROSS JOIN is generally best suited to generating test data rather than production queries.

_Self joins:_

A table can also be joined with itself.

_Example:_
```sql
-- all pairs of students that share the same room
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

Also, counting is more efficient when done in the database than in the application, because for the latter case, all data to be counted needs to be transfered.

Also, avoid N+1 queries i the application, i.e. queries that are the result of performing an additional query for each element in a collection.

## Comments

```sql
/* query to retrieve the radius or a circle */
SELECT radius
  FROM circles
 WHERE something      -- fill in condition
   AND something_else -- here as well
```

## Views

A view is a virtual table, created by specifying the query from which is results and a name:
```sql
CREATE VIEW view_name
AS <query>
```
It can then be queried like any other table (`SELECT * FROM view_name;`), with the only difference that virtual tables are not stored physically: every time data is retrieved from a view, the database re-runs the underlying query.

Views can be deleted as expected:
```sql
DROP VIEW view_name;
```
