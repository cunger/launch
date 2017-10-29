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

## Enums
