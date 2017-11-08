# DDL

## Creating and dropping tables

```sql
CREATE TABLE table_name (
    PRIMARY KEY (column1),
    column1 <datatype> <column_constraints>,  
    column2 <datatype> <column_constraints>,
    <table_constraints>
);
```

_Addind and dropping a column:_

```sql
ALTER TABLE table ADD  COLUMN column <datatype> <constraints>;
ALTER TABLE table DROP COLUMN column;
```

_Dropping tables and databases:_

```sql
DROP TABLE table_name [ , other_table_name ];

DROP DATABASE database_name;
```

## Constraints

The database schema can be used to restrict data injection in three ways:
* datatype
* modifiers (column constraints)
* table constraints

| Modifier | Constraint |
|----------|------------|
| `NOT NULL` | `CHECK (column IS NOT NULL)` |
| `UNIQUE`   | `UNIQUE (column)` |
|            | `UNIQUE (column1, column2, ...)` |  
| `DEFAULT value` | - |
| `PRIMARY KEY` | `PRIMARY KEY (column)` |
|               | `PRIMARY KEY (column1, column2, ...)` |
| `REFERENCES other_table (column)` | `FOREIGN KEY (column) REFERENCES other_table (column)` |
| `CHECK condition` | `CHECK condition` |

Constraints can be explicitly named by prefixing `CONSTRAINT constraint_name ...`.

Options for foreign keys:
* `ON UPDATE CASCADE`
* `ON DELETE CASCADE`
* `ON DELETE SET NULL`
* `ON DELETE SET DEFAULT`
* and others

`FOREIGN KEY (c1) REFERENCES table (c2) ON DELETE CASCADE` means that if a value in the referenced column `c2` is deleted, all rows with that value in `c1` are deleted as well. Alternatively, the value in `c1` can be set to `NULL` or the column's default value.

`FOREIGN KEY (c1) REFERENCES table (c2) ON UPDATE CASCADE` means that updates of values in `c2` are copied to the respective occurrences in `c1`.

If no options are specified, the default is `ON UPDATE RESTRICT` and `ON DELETE RESTRICT`, i.e. updating and deleting values in `c2` is not allowed if they are referenced in `c1`.

If a table has a multi-column primary key, the foreign key would be accordingly multi-column, e.g. `FOREIGN KEY (person_first_name, person_last_name) REFERENCES person (first_name, last_name)`

### Adding a constraint

During table creation:

```sql
-- Column constraint as modifier

CREATE TABLE table (
  id    serial       PRIMARY KEY,
  other integer      REFERENCES table (column),
  age   integer      CHECK (age BETWEEN 0 AND 100),
  email varchar(100) CHECK (email LIKE '%@%')
);

-- Table constraint

CREATE TABLE table (
  PRIMARY KEY (id),
  id    serial,
  other integer,
  age   integer,
  year  integer,
  CHECK (age > 0 AND 2017 - age = year),
  FOREIGN KEY (other) REFERENCES table (column)
);
```

To an existing table:

```sql
ALTER TABLE ADD CONSTRAINT name PRIMARY KEY (column);
ALTER TABLE ADD CONSTRAINT name FOREIGN KEY (column) REFERENCES table (column);
```

```sql
ALTER TABLE table_name ALTER COLUMN column [ADD CONSTRAINT name] SET DEFAULT 0;
ALTER TABLE table_name ALTER COLUMN column [ADD CONSTRAINT name] SET NOT NULL;
```

### Deleting constraints

```sql
ALTER TABLE table DROP CONSTRAINT constraint_name;

ALTER TABLE table ALTER COLUMN column DROP NOT NULL;
```

### Enums

Either as constraint:
```sql
CHECK (column IN ('value1', 'value2', 'value3'))
```

Or by creating an own data type:
```sql
CREATE TYPE weekday AS ENUM('monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday');
```
