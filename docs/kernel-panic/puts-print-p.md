# Putting and printing

What `puts` and `print` have in common: They both call `.to_s`, hand the result to `stdout`, and return `nil`. And they both allow for arbitrarily many arguments. The two main differences:
- `puts` also adds a newline (which `print` doesn't)
- `puts` treats arrays in a special way (which `print` doesn't)

```ruby
print 1, [2, [3, 4], []], 5

1[2, [3, 4], []]5
=> nil

puts 1, [2, [3, 4], []], 5

1
2
3
4
5
=> nil
```

Still shorter and sweeter: `p`. Or as Schiller put it:

> Ich sei, gewährt mir die Bitte,
> In eurem Bunde der Dritte!

`p` calls `.inspect`, adds a newline, hands the result to `stdout`, and returns the arguments it was called on.

```ruby
p 1, [2, [3, 4], []], 5

1
[2, [3, 4], []]
5
=> [1, [2, [3, 4], []], 5]
```

So calling `p` instead of puts makes a difference mostly when it comes to arrays and `nil`.

```ruby
nil.to_s    # => ""
nil.inspect # => "nil"
```

So what about `to_s` and `inspect`? The default implementations of `to_s` and `inspect` live in the class `Object`, where the former builds a string from the object class and ID, while the latter additionally includes instance variables and their values. Except for `Main`, for which both return `"main"`.

In string interpolation, `to_s` is called. So as a rule of thumb: For getting a useful string representation of an object, it's a good idea to override `to_s`. For debugging purposes it's usually a good idea to not override `inspect`.

For more printing power there's `format` and at least the following examples I hope to remember, so I don't have to look up the documentation every time:

```ruby
format("%{x} wants %{y}", x: "Polly", y: "crack")
=> "Polly wants crack"

format("%03d", 7)   # => "007"
format("%.1f", 2)   # => "2.0"

# And mixing them:
format("%06.2f", 4.7) # => "004.70"
```
