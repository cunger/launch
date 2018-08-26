
## Basic commands

Lists all databases and exit:
```
$ psql -l
```

Connect to database:
```
$ psql hero-database username
```

List all tables the database:
```
hero-database=# \dt
```

### Command line

| Command | Description |
| ------- | ----------- |
| `createdb demo` | creates a new database called `demo` |
| `dropdb demo`   | deletes the database called `demo` |
| `psql -d demo`  | start a `psql` session, connecting to the database `demo` |


## PostgreSQL console

| Command | Description |
| ------- | ----------- |
| `\l`, `\list` | display all databases |
| `\c demo`     | connect to database `demo` |
| `\dt`         | display all tables of the current database |
| `\d books`    | show the schema of the table `books` |
| `\?`          | list of console commands |
| `\h`          | list of SQL help options |
| `\q`          | quit  |

## Importing and exporting data

_Importing from SQL file:_

Command line:
```
psql -d demo < dump.sql
```

`psql` console:
```
\i /path/to/dump.sql
```

_Importing from CSV file:_

`psql` console:
```
\copy table          from 'table.csv' with CSV HEADER DELIMITER ',';
\copy table (c1, c2) from 'table.csv' with CSV HEADER DELIMITER ',';
```
`\copy` invokes the corresponding SQL command `COPY`:
```sql
COPY table               FROM 'absolute/path/to/table.csv' WITH CSV HEADER DELIMITER ',';
COPY table (name, color) FROM 'absolute/path/to/table.csv' WITH CSV HEADER DELIMITER ',';
```

Note that `HEADER` just means the first line is going to be ignored;
the headers are not used for matching with the table columns.
So if the order of columns in the CSV differs from the order of columns
in the table schema, the columns have to be specified in the correct order
in the `COPY` statement.

_Exporting a database or a specific table into an SQL file:_

Command line:
```
pg_dump -d demo [-t table] [--inserts] -f dump.sql
```

## Data types

Data types are used by databases to decide how much memory to allocate to the values, how to perform operations and calculations on them, and how to sort them.

[SQL datatypes](https://www.w3schools.com/sql/sql_datatypes.asp)
[PostgreSQL datatypes](https://www.postgresql.org/docs/current/static/datatype.html)

### Serial

`serial` is a notational shortcut for creating a sequence:

```sql
CREATE TABLE items (
  id serial
);

-- is interpreted as:
CREATE SEQUENCE items_id_seq;
CREATE TABLE items (
  id integer NOT NULL DEFAULT nextval('items_id_seq')
);
```

Sequences are a special kind of database object designed for generating auto-incrementing unique numeric identifiers, usually used for artificial primary key columns. Sequences consist of a single-row table with a value of type `bigint` together with information on the sequence, as well as a generator for incrementing the numeric value. The value can be accessed using `nextval('sequence_name')` and `currval('sequence_name')`, and can be set using `setval('sequence_name', value)`.

```
# select * from items_id_seq;

 sequence_name | last_value | start_value | increment_by |      max_value      | min_value | cache_value | log_cnt | is_cycled | is_called
---------------+------------+-------------+--------------+---------------------+-----------+-------------+---------+-----------+-----------
 items_id_seq  |          1 |           1 |            1 | 9223372036854775807 |         1 |           1 |       0 | f         | f

# select nextval('items_id_seq');

 nextval
---------
       1
(1 row)

# select nextval('items_id_seq');

 nextval
---------
       2
(1 row)
```

Start and incrementing value (default `1`) as well as other options (such as min and max values) can be specified explicitly, e.g.
```sql
CREATE SEQUENCE id_seq
START WITH 10
INCREMENT BY 2;
```

Decrementing sequences can be created by specifying `INCREMENT BY -1`.

A sequence can also be dropped like any other table:
```sql
DROP SEQUENCE id_seq;
```

An alternative for unique identifiers are UUIDs:

* `uuid`, e.g. `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11`

### Numerical values

* `integer` (alias: `int`)

* `real`, with variable precision and special values `Infinity`, `-Infinity`, `NaN`

    Beware that not all floating point numbers (like `pi()`) can be stored exactly, so the binary arithmetic performed on them can lead to errors.
    For example, `1.0 - 0.2 - 1.0 + 0.2` with `real`s likely will not end up to be `0` but something like `5.551115123125783E-17`.
    Therefore, floating point numbers should never be used to store information where exact values are needed (e.g. money).

* `numeric` (alias: `decimal`), `numeric(precision, scale)`, or `numeric(precision)` with `scale = 0`

    `numeric(4, 2)` are precise values with (up to) 4 digits, 2 of which after the decimal point, e.g. `23.55` or `4.7` or `10`.
    Values with more digits after the decimal point are rounded, e.g. `4.798` is stored as `4.80`.
    With `numeric`s, `1.0 - 0.2 - 1.0 + 0.2` equals to `0`, as expected.


### Strings

* `char(fixed-length)`
* `varchar(max-length)`
* `text` (or `clob` for _character large object_) for textual information of any length

Strings are always enclosed by single quotes.
```
'some string'
'A long and winding road'
'That wasn''t a good idea'
'"Indeed!"'
```

Double quotes can be used to escape identifiers that are reserved keywords in SQL, e.g. `"when"`.

When filling an `char(n)` field with a string shorter than `n` characters, it will be filled up with spaces.
When trying to fill it with a string that is longer, an error is thrown (except when the excess characters are all spaces, in this case the string is truncated to the expected length).

If there is an explicit typecast to `char` or `varchar` and the string is longer than the provided length value, the string will be truncated to that length, e.g. `'too long'::varchar(5)` gets `'too l'`.

### Date and time

* `date` as `'yyyy-MM-dd'`, e.g. `'2017-08-20'`
* `time` as `'hh:mm:ss'`, e.g. `'17:00:00'`
* `timestamp` as `'yyyy-MM-dd hh:mm:ss'`, e.g. `'2017-08-20 17:00:00'`

Incomplete timestamps will be filled up automatically, e.g. `'2017-08-20'` becomes `'2017-08-20 00:00:00'`, and `'2017-08-20 17:00'` becomes `'2017-08-20 17:00:00'`. Thus, a condition to include all timestamps in 2017 would be: `t BETWEEN '2017-01-01' AND '2018-01-01'`.

Dates, times, and timestamps can be compared using the numerical comparison operators (`<`, `=`, `BETWEEN`, etc.).

`time` and `timestamp` have variants that include timezone information, e.g. `'2017-8-20 17:00:00+02'` with an 2-hour offset from UTC.

### Boolean

* `boolean`

Values can be `TRUE`, `FALSE`, or `NULL` (unknown).

### Type casts

```
CAST (expression AS type)
expression::type
```
