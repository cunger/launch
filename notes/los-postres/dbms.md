
_Relational databases_ persist data in a set of _relations_ (tables).

A _relationship_ is a connection between two entity instances (a row of data). The three types of relationships are _one-to-one_, _one-to-many_, and _many-to-many_. The cardinality of a relationship specifies the number of entities on each side of the relationship; its modality specifies whether it is required or not.

A _conceptual schema_ is a high-level design of entities and relationships, whereas a _physical schema_ is a database-specific design focused on the implementation of the conceptual schema. 

# Relational model

The _relational model_ specifies a mathematically grounded way to store, organize, and manipulate data, that is the foundations of how relational databases work.

## Primary keys

>  A primary key is a unique identifier for a single row in a database table.

It can be _natural_, i.e. one or several values in the row that happen to be unique, or more likely _surrogate_, i.e. created for the specific purpose of being a unique identifier, such as auto-incrementing integers or UUIDs.

```sql
-- In PostgreSQL, the following:
CREATE TABLE colors (id serial, name text);

-- is interpreted as this:
CREATE SEQUENCE colors_id_seq;
CREATE TABLE colors (
    id integer NOT NULL DEFAULT nextval('colors_id_seq'),
    name text
);
```

Each relational table must have exactly one _primary key_, which consists of one or more columns that
* uniquely identify each row in the table
* do not contain blank or NULL values

```sql
-- Pretty much the same:
CREATE TABLE more_colors (id serial PRIMARY KEY, name text);
CREATE TABLE more_colors (id serial NOT NULL UNIQUE, name text);
-- But PRIMARY KEY communicates the intention better.
```

## Foreign keys

A _foreign key (column)_ is a column that refers to the primary key of another table. Foreign key columns need to have the same datatype as the primary key column of the other table, but they don't need to be unique or non-NULL.

Most DBMS allow for expressing _foreign key constraints_, in order to prevent that a table contains a foreign key value that doesn't exist as primary key. Either when creating the table:

```sql
CREATE TABLE t1 (
  ...
  other_id integer NOT NULL
                   REFERENCES others (id)
                   ON DELETE CASCADE,
  ...
);
```

Or separately as a constraint:
```sql
ALTER TABLE table ADD CONSTRAINT table_others_id_fkey
  FOREIGN KEY (other_id)
  REFERENCES others (id)
  ON DELETE CASCADE;
```

## Relations

One-to-one relations

One-to-many relations
Implementation: The _many_-side table will have a foreign key identifying the _one_-side table.

Many-to-many relations
Implementation: As a cross-reference table T3 that uses two foreign keys, to primary key of T1 and primary key of T2, together forming the primary key of T3.

## Normalization

The goal of _normalization_ is to design the schema in a way that it avoids or at least minimizes anomalies, mainly by distributing information across separate tables.

* _Update anomaly:_ If data is duplicated, updating it in one place while not updating it in another leads to inconsistencies, e.g. leading to different answers to a query that should only have one.
* _Insertion and deletion anomaly:_ When storing particular information only together with other information, e.g. contact details in an events table, then that information is not available independently, i.e. it can only be inserted when other information is inserted, and is lost when that other information is deleted.    

## Normal forms

## Indexes

Default index uses the primary key.
