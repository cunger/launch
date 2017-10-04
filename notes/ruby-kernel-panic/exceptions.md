# Exceptions

Global variable holding the current exception: `$!`

When another exception is thrown before the current one is handled, it replaces the current one (which is thrown away).

## Structure

```ruby
begin
  # ...
rescue
  # in case of failure
else
  # in case of success
ensure
  # always executed (e.g. cleaning up connection to external service, that would otherwise be left dangling)
end   
```

Every method is implicitly a `begin` block.

```ruby
def fnord
  # ...
rescue
  # ...
end
```

**Notes:**
* Order matters, i.e. more specific exceptions need to be `rescue`d before more general ones.
* `rescue` can match multiple error classes, e.g. `rescue IOError, ParseError, ArgumentError`

**Best practises:**
* Use exceptions only for exceptional situations. Not every time you get an answer you don't like. And not for control flow. (Raising an exception is just another form of `goto` statement, and it's expensive performance-wise.) For example, invalid user input is not unexpected, since you can predict it will happen during normal operation.
* If unsure what is the best fallback strategy, leave the decision to the caller. E.g.
```ruby
def fnord
  # ...
  if all_went_well?
    # yeah
  else
    # oh no
    yield if block_given?
  end
end

fnord { do_something_in_case_not_all_went_well }
```
* Do not `return` from an `ensure` block, as this will hide the exception. Generally, don't suppress exceptions.
* When an exception occurs, make sure to either leave the object in a consistent state, or to roll it back to its original state.
* All application and library exceptions should be descendants of `StandardError`.

## Default arguments

`raise` and `fail` are synonymous methods in Kernel, with three optional arguments: `raise ErrorClass, 'message', backtrace`

Defaults:
* error class is RuntimeError when `raised`, i.e.
    * `raise` = `raise RuntimeError`
    * `raise 'message'` = `raise RuntimeError, 'message'`
* error class is `StandardError` when `rescue`d, i.e.
    * `rescue => error` = `rescue StandardError => error`
* default backtrace is `caller`
