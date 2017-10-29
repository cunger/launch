
## Command line

| Command | Description |
| ------- | ----------- |
| `createdb demo` | creates a new database called `demo` |
| `dropdb demo`   | deletes the database called `demo` |
| `psql -d demo`  | start a `psql` session, connecting to the database `demo` |
| `psql -d demo < dump.sql`  | start a `psql` session, loading the database `demo` from an SQL file |
| `pg_dump -d demo       --inserts > dump.sql` | dump table `t1` of database `demo` into an SQL file |
| `pg_dump -d demo -t t1 --inserts > dump.sql` | dump database `demo` into an SQL file |

## PostgreSQL console

| Command | Description |
| ------- | ----------- |
| `\i /path/to/dump.sql` | load database from file |
| `\l`, `\list` | display all databases |
| `\c demo`     | connect to database `demo` |
| `\dt`         | display all tables of the current database |
| `\d books`    | show the schema of the table `books` |
| `\?`          | list of console commands |
| `\h`          | list of SQL help options |
| `\q`          | quit  |

## Loading data from CSV

`psql` console:
```
\copy table               FROM 'table.csv' CSV HEADER DELIMITER ',';
\copy table (name, color) FROM 'items.csv' CSV HEADER DELIMITER ',';
```

SQL:
```sql
COPY table               FROM 'absolute/path/to/table.csv' CSV HEADER DELIMITER ',';
COPY table (name, color) FROM 'absolute/path/to/table.csv' CSV HEADER DELIMITER ',';
```

Note that `HEADER` just means the first line is going to be ignored;
the headers are not used for matching with the table columns.
So if the order of columns in the CSV differs from the order of columns
in the table schema, the columns have to be specified in the `COPY` statement.

## Datatypes

[SQL datatypes](https://www.w3schools.com/sql/sql_datatypes.asp)
[PostgreSQL datatypes](https://www.postgresql.org/docs/current/static/datatype.html)

* `serial`
* `uuid`
* `integer`, `real`, `decimal(precision, scale)`
* `varchar(length)`, `text`
* `date`, `timestamp`
* `boolean`

Type casts:
```
CAST ( expression AS type )
expression::type
```
