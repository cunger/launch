# Closures

> A function or a reference to a function together with a referencing environment.

As [Paul Cantrell](https://innig.net/software/ruby/closures-in-ruby) puts it: A _closure_ is a block of code that

* can be passed around as a value, 
* can be executed on demand by anyone who has that value, and at that point 
* can refer to variables from the context in which is was created.

The means that it contains references to the variable bindings, not copies of the values. So if the value associated with a variable changes later \(either being changed outside the closure or by the closure itself\), the context reflects that change.

```
> name = 'fred'
> p = proc {}
> p.binding.eval('name')
=> "fred"
> name = 'bob'
> p.binding.eval('name')
=> "bob"
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

Closures are _closed_ with respect to variables defined in the context where they were created, regardless of the context in which they are called.

> Closures are important because they preserve the partial running state of a program.
>
> One of the most important aspects of Proc objects is their service as _closures_: anonymous functions that preserve the local variable bindings that are in effect when the procs are created.

## Procs

_Procs_ are _callable objects_ of type `Proc`, a direct subclass of `Object`. They are created from a code block

* `p = Proc.new { ... }`
* `p = proc {...}`

which can later be executed:

* `p.call`

Like any object, they can be assigned to variables, put into arrays and hashes, passed to methods as arguments \(in whatever number and order\), returned from methods, and so on.

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

_Lambdas_ differ from other _procs_ in two major respects. First, **arity rules**: _lambdas_ behave like methods, while _procs_ and blocks are lenient \(see below\). Second, **control flow**, in particular behavior upon `return`: _Lambdas_ return only from the block that defines them, and hand control back to the calling context - independent of the context in which they were defined. That is, the following two cases both print output to the screen:

```ruby
def test
  my_lambda = lambda { return }
  my_lambda.call
  puts 'This will be output to screen.'
end

test
```

```ruby
l = lambda { return }

def test(some_lambda)
  some_lambda.call
  puts "This will be output to screen."
end

test(l)
```

Other _procs_ behave like being part of the enclosing method \(meaning: the method that is enclosing them when they are defined\) by returning not only from their block but also from that method.

```ruby
def calling(p)
  p.call
end

def defining
  p = proc { return 42 }

  puts 'Go!'
  calling(p)
  puts 'Done.'
end

# > defining
# Go!
# => 42
```

Note that `return` is tied to the context at the time of creation of the _proc_. So if the _proc_ is either defined at the top-level, from which you can't return, or if the creating context no longer exists upon calling, e.g. by calling the _proc_ at the top-level of the program, this will result in a `LocalJumpError`.

If there is a need to return early from a _proc_, use `next`, which returns from the current block \(just like `return` in a _lambda_\).

```ruby
def meditate
  puts 'Adjusting posture...'
  p = Proc.new do
        puts 'Ringing bell...'
        next
        puts 'Getting distracted!'
    end
    p.call
    puts 'Sitting still...' 
    true 
end

# > meditate
# Adjusting posture...
# Ringing bell...
# Sitting still...
# => true
```

## Blocks

Blocks are syntactic constructs:

* `{ ... }` and `{ |arg| ... }`
* `do ... end` and `do |arg| ... end`

More specifically, they are part of the method invocation syntax. They contain everything necessary to create a _proc_ object, but they are not objects themselves. Thus they cannot be assigned to variables, they cannot be returned by methods, and the like. So in a way they are also not real closures. But they are closures in the sense of remembering their context upon creation:

> \[...\] a Ruby block carries around the context in which it was defined. A block can reference the variables that were in scope when it was defined, even if those variables later go out of scope.
>
> -- Ruby Cookbook

Each Ruby method can optionally be provided a block, which is independent of the argument list. It can be made explicit in the argument signature, however, by means of `&` \(see [& and curry](/and-and-curry.md "the section on \`&amp;\`")\), e.g.

```ruby
def method(*args, &block)
end
```

This is necessary if you want to further process the block, e.g. pass it to another method:

```ruby
def method(*args, &block)
  another_method(&block)
end
```

Methods cannot be provided more than one block, because they are not method arguments, they are part of the method invocation syntax.

`yield` is a keyword that tells Ruby to execute the block that was passed to the method. If there was no block \(which can be checked using `Kernel#block_given?`\), this results in a `LocalJumpError`.

```ruby
def method_implicit
  yield if block_given?
end

def method_explicit(&block)
  raise ArgumentError, 'expected a block' unless block
  block.call
end
```

Blocks can be captured in _proc_ objects with either `proc { ... }` or `lambda { ... }`.

## Methods

Methods are not objects, but you can get a `Method` object by means of `Object#method`:

```ruby
m = 1.method(:+) 
m.call 2 # => 3

module Demo
  def self.run
   'Hello world!'
  end
end

Demo::run # => 'Hello world!'

m = Demo.method(:run)
m.call # => 'Hello world!'
```

There are two main differences between methods on the one-hand side and blocks and _procs_ on the other hand side. One concerns arity rules, the other concerns variable scope.

### Arity

While methods raise an `ArgumentError` when they are not provided arguments as specified in the method definition, blocks and non-lambda _procs_ are very lenient when it comes to arguments: they don't care about the number of arguments they receive.

* missing arguments are bound to `nil`
* additional arguments are ignored

### Scope

Block arguments are local to the block.

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

```ruby
var = 1
p = proc { puts "var = #{var}" } # NameError if var is no yet defined at this point

p.call # => var = 1

var = 2

p.call # => var = 2
```



