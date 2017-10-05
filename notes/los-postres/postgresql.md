
## Command line

| Command | Description |
| ------- | ----------- |
| `createdb demo` | creates a new database called `demo` |
| `dropdb demo`   | deletes the database called `demo` |
| `psql -d demo`  | start a `psql` session, connecting to the database `demo` |
| `psql -d demo < dump.sql`  | start a `psql` session, loading the database `demo` from an SQL file |

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

## Datatypes

## Options / Contraints
