# SQL

SQL (_Structured Query Language_) is a special-purpose, declarative programming language to interact with relational databases.

The SQL vocabulary is categorized into three sub-vocabularies:

* The _Data Definition Language (DDL)_ is a vocabulary for specifying the database **schema**, in articular for creating, modifying and deleting databases, tables, and constraints. This comprises all SQL commands that define the structure and properties of data but don't actually manipulate any data records, such as `CREATE`, `ALTER`, and `DROP`. (The latter is partly also DML, as dropping a database also deletes all data records in it.)

* The _Data Manipulation Language (DML)_ is a vocabulary for managing **data**, i.e. for retrieval of data records (querying) and manipulation of data records (inserting, modifying, deleting). Also known as CRUD, the four basic functions of persistent storage:
      * Create data (`INSERT`)
      * Read data (`SELECT`)
      * Update data (`UPDATE`)
      * Delete data (`DELETE`)

* The _Data Control Language (DCL)_ is a vocabulary for controlling rights and roles for accessing data. This comprises in particular `GRANT` and `REVOKE`.

Adher to the [SQL style guide](http://www.sqlstyle.guide).
