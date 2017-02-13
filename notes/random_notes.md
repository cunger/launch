
## Pass by value

```ruby
v1 = 1
v2 = v1

# 2 variables, 1 object
# v2 => 1

v1 = 2

# 2 variables, 2 objects
# v2 => 1
```

```ruby
flavor  = "vanilla"
flavors = [flavor]

# flavors => ["vanilla"]

flavor = "chocolate"

# flavors => ["vanilla"]
```

So is Ruby pass-by-value?

_[Y]ou might be disappointed with the answer. In a way, Ruby is both!_

## Methods vs keywords

`while`, `unless` , `until` etc. are keywords, not methods. `each` is a method (more specifically, an iterator, i.e. it takes a block as argument).

## Defaults for arguments

```ruby
def say(words="hello world",punct="!")
  puts words + punct
end
```

In `say("whatever")`, `whatever` is assumed to be the first argument.
