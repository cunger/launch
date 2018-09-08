
The _Active Record_ pattern maps objects to databases:

* classes to tables
* objects to rows of data within a table
* getters and setters to columns in that table

An Active Record model wraps a row in a database table or view, encapsulates the database access, and adds domain logic on that data.

Active Record objects infer their attributes from the table definition with which they're linked. Adding, removing, and changing an attribute is done directly in the database (and through its link to it reflected in the Active Record object).
