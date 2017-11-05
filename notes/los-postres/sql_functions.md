
# Aggregate functions

* `COUNT(*)` counts all rows (therefore avoid in `LEFT JOIN`s if you want to only count rows that have values in both tables)
* `COUNT(x)` counts all rows in which `x` is a non-`NULL` value

* `SUM(x)`
* `AVG(x)`

* `MIN(x)`
* `MAX(x)`

Where `x` can be any value: `column`, `DISTINCT column`, `ROUND(column1 / COALESCE(column2, 0))`, etc.
Note that `NULL` as value is ignored.

# String functions

* Concatenation `||`, e.g.
    * `SELECT 'pi is ' || pi() ;`
    * `SELECT first_name || ' ' || last_name FROM persons;`
    * `SELECT id FROM item WHERE lower(name) = 'whatever letters were capitalized';`

* `length(column)`

* `lower(column)`, `upper(column)`, `initcap(column)` (first letter uppercase, all other letters lower case)

* `substring(column, start_char, number_of_chars)`

# Numeric functions

* `+`, `-`, `*`, `/`
* `mod(x, y)` calculating the remainder of `x/y`

Note that `/` in PostgreSQL is integer division, i.e. `1/4` yields `0` and in order to get `0.25` you have to use decimals (e.g. `1.0/4.0`), e.g. by means of casting `CAST(column AS decimal)`.

* `abs(x)` for the absolute value of `x`

* `round(x)` for rounding to the nearest integer
* `round(x, i)` for rounding to a decimal with `i` decimals (in PostgreSQL this only works when `x` is of type `decimal`)
* `ceil(x)` for rounding up, `floor(x)` for rounding down, and `trunc(x)` for rounding towards 0 (i.e. rounding up for negative numbers and rounding down for positive ones)

# Date and time functions

* `current_date`, `current_time`, `current_timestamp`
* `EXTRACT(field FROM column)`, where `field` can be `YEAR`, `MONTH`, `DAY`, `HOUR`, `MINUTE`, `SECOND`, e.g.
* `AT TIME ZONE '...'` for conversion to local time, e.g. `time AT TIME ZONE 'Europe/Warsaw'`
* `-` for difference between two timestamps
* `+` for moving a date time by an interval (such as `INTERVAL '4' HOUR` or `INTERVAL '1' DAY`)

The operation `-` and `+` are, for example, useful for
* not caring about the specific end date of a month: `date BETWEEN '2010-01-01' AND CAST('2010-02-01' AS date) + INTERVAL '1' MONTH`
* checking for something within the past `x` days (or hours, or the like): `date > CURRENT_DATE - INTERVAL 'x' DAY`
* checking for something older than 10 years: `birth_date < CURRENT_DATE - INTERVAL '10' YEAR`
* something around the current time: `time BETWEEN (CURRENT_TIME - INTERVAL '1' HOUR) AND (CURRENT_TIME + INTERVAL '1' HOUR)`

# Working with `NULL`s

* `COALESCE(value1, value2, ...)` returns the first of the values that is not `NULL`. This is useful, e.g., for default values during query time, e.g.:
    * `SELECT COALESCE(name, 'product ' || id, 'n/a') FROM item;`
    * `COALESCE(number * 2, 0)`
    Note that both values need to have the same data type, i.e. `COALESCE(date, 'no date')` will not work and needs to be `COALESCE(CAST(date AS varchar), 'no date')`.

* `NULLIF(x, y)` returns `NULL` if `x` and `y` are equal, else `x`. This is useful, e.g., for
    * avoiding division by 0: `1 / NULLIF(all - some, 0)`
    * counting only non-0 values: `COUNT(NULLIF(column, 0))`
