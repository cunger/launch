# Data Manipulation Language

## Inserting records

```sql
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...),
       (value1, value2, value3, ...);
```

`NULL` is inserted for all columns that are omitted in the `INSERT` statement.

If all columns are included in their expected order, the column names can be omitted:
```sql
INSERT INTO table_name
VALUES (value1, value2, value3, ...);
```

## Updating records

```sql
UPDATE table_name
   SET column1 = value1,
       column2 = value2, ...
 WHERE condition;
```

It is also possible to use arithmetic expressions, e.g. `SET price = 2 * price` or `SET years = years + 1`.

## Deleting records

Deleting specific records:
```sql
DELETE FROM table_name
 WHERE condition;
```

Deleting all records:
```sql
DELETE FROM table_name;
```
