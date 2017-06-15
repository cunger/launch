# Closures

> A function or a reference to a function together with a referencing environment.

> Closures are important because they preserve the partial running state of a program.

In Ruby, there are three ways to define closures:
* blocks
* procs
* lambdas

## Procs

_Procs_ are objects of type `Proc`, a direct subclass of `Object`. They are created from a code block
* `Proc.new { ... }`
* `proc {...}`

which can later be executed:
* `p.call`

Like any object, they can be assigned to variables, put into arrays and hashes, passed to methods as arguments (in whatever number and order), returned from methods, and so on.

## Lambdas

_Lambdas_ are also `Proc` objects, just of a slightly different flavor.

```
> p = proc {}
=> #<Proc:0x00000000ffdca0>

> l = lambda {}
=> #<Proc:0x00000000fd2230 (lambda)>
```

They can be created
* from code blocks with the `lambda` method: `lambda { ... }`
* by means of the literal _lambda_ constructor, with or without arguments:
    * `-> { ... }`
    * `->(arg) { ... }`

_Lambdas_ differ from other _procs_ in two major respects:

* Arity rules: _lambdas_ behave like methods, while _procs_ and blocks are lenient (see below).
* Behavior upon `return`:
    * _Lambdas_ return from their own context: They simply return from their block and hand control back to the calling method.
    * Other _procs_ return from their calling context: They behave like being part of the calling method, i.e. return from their block as well as the calling method.

## Blocks

Blocks are syntactic constructs:
* `{ ... }` and `{ |arg| ... }`
* `do ... end` and `do |arg| ... end`

More specifically, they are part of the method invocation syntax. They contain everything necessary to create a _proc_ object, but they are not objects themselves. Thus they cannot be assigned to variables, they cannot be returned by methods, and the like.

Each Ruby method can optionally take a block as argument, which can be either implicit or explicit in the argument signature. Methods cannot take more than one block, because they are not method arguments, they are part of the method invocation syntax.

Blocks can be captured in _proc_ objects with either `proc { ... }` or `lambda { ... }`.

## The & operator

```ruby
def execute(&block) # `&` takes the block that is part of the method invocation,
                    # turns it into a `Proc` object (by calling `to_proc`),
                    # and binds it to the variable `block`.
  block.call
end

execute  { puts 'Yay!' }

p = proc { puts 'Yay!' }
execute(&p)         # `&` hands `p` to the method as the block it can take,
                    # so this is the same as saying `execute { puts 'Yay!' }`.
                    # Without `&`, `p` would be passed as a normal method argument.
```

`to_proc` is defined in `Proc` and `Symbol`, and can be defined by any class as a class or instance method. The one in symbol allows you to say `&:capitalize` and get back a _proc_ that captures the `capitalize` method. Note that, like above, the `&` in `array.map &:capitalize` tells `map` that `:capitalize.to_proc` takes the place of the block that can be part of the method invocation (as in `array.map { |item| item.capitalize }`).

`Symbol#to_proc` basically works like this:

```ruby
class Symbol
  def to_proc
    proc { |obj, args| obj.send(self, *args) }
  end
end
```

## Methods vs blocks and procs

There are two main differences between methods on the one-hand side and blocks and _procs_ on the other hand side. One concerns arity rules, the other concerns variable scope.

### Arity

While methods raise an `ArgumentError` when they are not provided arguments as specified in the method definition, blocks and non-lambda _procs_ are very lenient when it comes to arguments: they don't care about the number of arguments they receive.
 * missing arguments are bound to `nil`
 * additional arguments are ignored

### Scope

> One of the most important aspects of Proc objects is their service as _closures_: anonymous functions that preserve the local variable bindings that are in effect when the procs are created.

```ruby
def execute(p)
  str = 'string in method scope'
  puts str
  p.call
end

str = 'string in scope when proc is created'
p = proc { puts str }
```

```
> p.call
string in scope when proc is created

> execute(p)
string in method scope
string in scope when proc is created
```

**Example: counters**

```ruby
def make_counter
  n = 0
  return proc { n += 1 }
end

counter1 = make_counter
counter1.call # => 1
counter1.call # => 2

counter2 = make_counter
counter2.call # => 1

counter1.call # => 3
```
