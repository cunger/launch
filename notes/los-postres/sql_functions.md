
## String functions

* Concatenation `||`, e.g.
    * `SELECT 'pi is ' || pi() ;`
    * `SELECT first_name || ' ' || last_name FROM persons;`
    * `SELECT id FROM item WHERE lower(name) = 'whatever letters were capitalized';`

* `length(column)`

* `lower(column)`, `upper(column)`, `initcap(column)` (first letter uppercase, all other letters lower case)

* `substring(column, start_char, number_of_chars)`

## Numeric functions

* `+`, `-`, `*`, `/`
* `mod(x, y)` calculating the remainder of `x/y`

Note that `/` in PostgreSQL is integer division, i.e. `1/4` yields `0` and in order to get `0.25` you have to use decimals (e.g. `1.0/4.0`), e.g. by means of casting `CAST(column AS decimal)`.

* `abs(x)` for the absolute value of `x`

* `round(x)` for rounding to the nearest integer
* `round(x, i)` for rounding to a decimal with `i` decimals (in PostgreSQL this only works when `x` is of type `decimal`)
* `ceil(x)` for rounding up, `floor(x)` for rounding down, and `trunc(x)` for rounding towards 0 (i.e. rounding up for negative numbers and rounding down for positive ones)
