# SQL

SQL (_Structured Query Language_) is a special-purpose, declarative programming language to interact with relational databases.

SQL statements are categorized into:

* The _Data Definition Language (DDL)_ is a vocabulary for specifying the database **schema**, i.e. for creating, modifying and deleting databases and tables. This comprises all SQL commands that define the structure and properties of data, but don't actually manipulate any data records, e.g.:
    - `CREATE` (`DATABASE | TABLE | SEQUENCE`)
    - `ALTER`
    - `DROP` (partly also DML, as it deletes all data from a database)
    - ...

* The _Data Manipulation Language (DML)_ is a vocabulary for managing **data**, i.e. for retrieval of data records (querying) and manipulation of data records (inserting, modifying, deleting). Also known as CRUD, the four basic functions of persistent storage:
      * **C**reate data (`INSERT`)
      * **R**ead data (`SELECT`)
      * **U**pdate data (`UPDATE`)
      * **D**elete data (`DELETE`)

* The _Data Control Language (DCL)_ is a vocabulary for controlling rights and roles for accessing data.
    - `GRANT`
    - `REVOKE`

Adher to the [SQL style guide](http://www.sqlstyle.guide).
