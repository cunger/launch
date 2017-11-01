
# Relational model

The _relational model_ specifies a mathematically grounded way to store, organize, and manipulate data, that is the foundations of how relational databases work.

_Relational databases_ persist data in a set of _relations_ (tables), comprised of _fields_ (columns) and _records_ (rows).

A _conceptual schema_ is a high-level design of entities and relationships, whereas a _physical schema_ is a database-specific design focused on the implementation of the conceptual schema.

# Keys

Keys are specific kinds of constraints (i.e. rules on what kind of data is allowed in a column) and as such part of the schema definition. They are essential for ensuring the integrity of the data.

Keys can be _natural_, i.e. one or several columns that happen to be unique, or more likely _surrogate_, i.e. created for the specific purpose of being a unique identifier, such as auto-incrementing integers or UUIDs.

## Primary keys

A _primary key_ is a collection of one or more columns that uniquely identifies each row in a table. In other words, the constraint `PRIMARY KEY` is the same as `NOT NULL UNIQUE`.

Each relational table can have only one primary key. When a primary key is created, also an index is created, that facilitates data selection and sorting based on the primary key column.

## Foreign keys

A _foreign key_ is a column that refers to the primary key of another table, thereby acting as a cross-reference between tables.
Foreign key columns obviously need to have the same data type as the primary key column of the other table, and in most DBMS the foreign key constraint also prevents foreign key values that don't exist as primary key value.

As opposed to primary keys, foreign keys don't need to be unique, can be `NULL`, and there can be arbitrarily many of them in one table.

A column can be both a primary and a foreign key.

# Relationships

A _relationship_ is a connection between two entity instances (a row of data). The three types of relationships are _one-to-one_, _one-to-many_, and _many-to-many_. The cardinality of a relationship specifies the number of entities on each side of the relationship; its modality specifies whether it is required or not.

One-to-one relations

One-to-many relations
Implementation: The _many_-side table will have a foreign key identifying the _one_-side table.

Many-to-many relations
Implementation: As a cross-reference table T3 that uses two foreign keys, to primary key of T1 and primary key of T2, together forming the primary key of T3.

## Normalization

The goal of _normalization_ is to design the schema in a way that it avoids or at least minimizes anomalies, mainly by distributing information across separate tables.

* _Update anomaly:_ If data is duplicated, updating it in one place while not updating it in another leads to inconsistencies, e.g. leading to different answers to a query that should only have one.
* _Insertion and deletion anomaly:_ When storing particular information only together with other information, e.g. contact details in an events table, then that information is not available independently, i.e. it can only be inserted when other information is inserted, and is lost when that other information is deleted.    

### Normal forms

## Optimization

Also, counting is more efficient when done in the database than in the application, because for the latter case, all data to be counted needs to be transfered.

### N+1 queries

N+1 queries are the result of performing an additional query for each element in a collection.
