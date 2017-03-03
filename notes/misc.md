

## `#to_i` and `Kernel#Integer`

Both methods convert numeric values directly.

```ruby
> Integer(23.999) # => 23
> 23.999.to_i     # => 23
```

However, they differ when it comes to non-numeric input.

`String#.to_i` converts the longest prefix of the string that represents a numeric value into an integer.

```ruby
"99 red balloons".to_i # => 99
```

If there is no such prefix, it returns zero. It takes an optional argument for the base (2..36), and fails only if the base is not valid.
`Integer`, on the other hand, expects strings to strictly conform to numeric expressions. It also takes the base as optional second argument.


```ruby
> Integer("0x1a") # => 26
> "0x1a".to_i     # => 0
> "0x1a".to_i(26) # => 26
> "0a".to_i(200)  # => ArgumentError (invalid radix)
> Integer("1x1a") # => ArgumentError (invalid value for Integer())
> "1x1a".to_i     # => 1
> Integer(nil)    # => TypeError
> nil.to_i        # => 0
```

`Integer` converts non-string values by trying `to_int`, then `to_i`.

```ruby
Integer("111", 2)   # => 7
Integer("0930", 10) # => 930
```
