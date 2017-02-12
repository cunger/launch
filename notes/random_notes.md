
## Pass by value, not by reference

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

## Methods vs keywords

`while`, `unless` , `until` etc. are keywords, not methods. `each` is a method (more specifically, an iterator, i.e. it takes a block as argument).