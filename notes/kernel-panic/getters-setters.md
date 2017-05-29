# Getters and setters

```ruby
attr_reader :name

# Equivalent to:

def name
  @name
end
```

```ruby
attr_writer :name

# Equivalent to:

def name=(name)
  @name = name
end
```

```ruby
attr_accessor :name

# Equivalent to:

attr_reader :name
attr_writer :name
```

**Note:** Syntactic sugar setter methods (like `name=`)
* are methods
* allow for syntax to look like assignment
```ruby
obj.name = "Guybrush"

# Syntactic sugar for:

obj.name= "Guybrush" # same as: obj.name=("Guybrush")  
```
* behave like assignment in that they always return the right-hand side value, irrespective of the actual return value of the method
```ruby
def name=(name)
  @name = name
  "Fnord!"
end

obj.name = "Guybrush" # => "Guybrush"
obj.name=("Guybrush") # => "Guybrush"
```
