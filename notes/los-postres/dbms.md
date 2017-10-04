
# Relational model

## Primary and foreign keys

>  A Primary Key is a unique identifier for a row of data.

Each relational table must have exactly one _primary key_, which consists of one or more columns that
* uniquely identify each row in the table
* do not contain blank or NULL values

A _foreign key_ is one or more columns that refer to the primary key of another table. They don't need to be unique or non-NULL. Some DBMS allow for expressing constraints on foreign keys, in order to prevent that a table contains a foreign key value that doesn't exist as primary key.

## Relations

One-to-one relations

One-to-many relations

Many-to-many relations

cross-reference table T3 that uses two foreign keys, to primary key of T1 and primary key of T2, together forming the primary key of T3

## Normal forms

## Indexes

Default index uses the primary key.
