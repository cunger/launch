# Local variable scope

**Methods create their own scope.** In the sense of starting with an empty slate upon entering. As a result, local variables defined outside the method are not accessible within it. Likewise, what happens in a method, stays in the method; so local variables defined within a method are not accessible from outside. (Unless someone tells the outside.)

Here's where local_variables is really handy, although its primary use case is certainly something much cooler:

```ruby
outside = 23
p local_variables     # => [:outside]
def method
  inside = 47
  p local_variables   # => [:inside]
end
p local_variables     # => [:outside]
```

Another result of starting from an empty slate when entering the method is variable shadowing: variables that have the same name but live in different scopes are different variables. So string outside a method and string inside a method are two separate variables.

```ruby
string = 'Fnord'
p binding.local_variable_get(:string)   # => "Fnord"
def method
  string = '!'
  p binding.local_variable_get(:string) # => "!"
end
p binding.local_variable_get(:string)   # => "Fnord"
```

The same holds not only for `def`, but also for `class` and `module`.

**Blocks create a new scope, extending the scope of their container.** So local variables outside the block are accessible within it, but not vice versa.
This comes with two important facts. (Examples are stolen and adapted from [Darko Gjorgjievski](https://www.sitepoint.com/understanding-scope-in-ruby/).)

First, a block creates a new scope every time it is entered. Therefore, the following:

```ruby
2.times do
  str ||= 'fresh'
  puts str
  str = 'reassigned'
  puts str
end
```

Will output:

```
fresh
reassigned
fresh
reassigned
```

And second, a block creates a new scope at the point where it is defined, not at the point of its invocation (similar to the initialization of variables), as can be demonstrated with a block argument to lambda — which is, like loop, not a keyword but a method in Kernel:

```ruby
def foo
  x = :inside
  lambda { x }
end
x = :outside
p foo.call # => :inside
```

**A local variable will be put into scope whenever it is assigned a value.** Which means: whenever the interpreter sees an assignment, even if this assignment is never executed. Whenever an assignment is parsed, space is allocated to the variable, so it starts existing. Classic example:

```ruby
known = 1
if false
  var = :false
end
p known  # => 1
p var    # => nil
p unkown # => undefined local variable or method `unknown'
```

Keep in mind that `if`, `while`, `until`, and `for` constructs are neither methods nor blocks, and thus do not create an own scope.
