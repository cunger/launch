# Equality

> No entity without identity.

`BasicObject` provides:
- `==` (and `!`, which together also gives you `!=`)
- `equal?`

`Object` provides:
- `===`
- `eql?`

They all start as _object identity_: two objects are equal if they are the same object, i.e. have the same object id. Descendant classes then override those methods to provide class-specific behaviour.

## Object equality

`equal?` is never overridden, but kept to determine _object identity_.
```ruby
1.equal? 1.0 # => false
```

## Value equality

`==` is used to capture _value equality_, which allows for comparing the actual content of objects independent of their id.

```ruby
1 == 1.0 # => true
```

`eql?` is used as a stricter version of `==`, requiring the class of the two objects to be equal, in addition to their values. `eql?` is used by Ruby to compare Hash keys. 

## Case equality

`===` is used in `case` statements and often only vaguely resembles equality. `a === b` can rather be understood as: _If I have a drawer `a`, does it make sense to put `b` in?_

- For `Range` it works like inclusion (in the sense of `include?`, not `cover?`).

```ruby
(1..100) === 23 # => true
```

- For `Regexp` it works like string matching (in the sense of `=~`).

```ruby
/Fnord*/ === 'Fnord!' # => true
```

- In addition, classes usually provide `===` as a class method that does the same as `is_a?`.

```ruby
String  === 'Fnord!' # => true  
Integer === 23       # => true  
```

Now, important to know about `case` statements is that the receiver of `===` is the `when` clause, not the `case` clause. Then it's easy to see what happens behind the scenes to create such incredibly convenient case behaviour.

```ruby
case input
when String then 'String!'
when /cool/ then 'Match!'
when 1..100 then 'Peanuts...'
end

# case input
# when String === input ... # input.is_a? String
# when /cool/ === input ... # /cool/ =~ input
# when 1..100 === input ... # (1..100).include? input
# end
```

The style guide says:
> Avoid explicit use of the case equality operator `===`. As its name implies it is meant to be used implicitly by case expressions and outside of them it yields some pretty confusing code.

# Comparison

At the heart of all comparison is the _spaceship operator_ `<=>`.

* The module `Comparable` uses it to implement the comparison methods `<`, `>`, `<=`, `>=`.
* The module `Enumerable` uses it to implement sorting and `min`,`max`.

In order to make objects of a custom class comparable or sortable:
- mixin the relevant module
- implement `<=>` such that `a <=> b` returns
    - `-1` if `a < b`
    - `0` if `a == b`
    - `1` if `a > b`
    - `nil` if `a` and `b` are not comparable

The default implementation of `<=>` in `Object` returns `0` if the two objects are equal (`==`), and `nil` otherwise.
