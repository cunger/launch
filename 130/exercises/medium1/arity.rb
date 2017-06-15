## Group 1

my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Blocks and procs are lenient when it comes to arguments: they can be called with any number of arguments, independent of the arguments specified in their definition. Argments are bound as they come in; missing arguments are bound to `nil`, and additionally provided arguments are ignored.

# `my_proc` is defined from a block specifying (and using) one argument, `thing`.
# `my_proc.call('cat')` provides one argument, which is bound to `thing`; the call therefore prints "This is a cat.".
# In `my_proc.call`, no argument is provided, therefore the block variable `thing` is assigned to `nil`. Since `puts` prints `nil` as the empty string, the call prints "This is a .".

## Group 2

my_lambda = lambda { |thing| puts "This is a #{thing}" }
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }

# Lambdas behave like methods when it comes to arity rules: they expect exactly the number of arguments that was specified in their definition. In other words, they enforce the number of arguments passed to them. If there is a mismatch, they raise an `ArgumentError`.
# `my_lambda` and `my_second_lambda` are two ways to define the same lambda proc, which expects exactly one argument.
# `my_lambda.call('dog')` provides exactly one argument, which is bound to `thing` and the execution prints "This is a dog".
# `my_lambda.call`, on the other hand, doesn't provide any argument, therefore execution raises an `ArgumentError`.

# `Lambda.new` raises a `NameError`, as there is no class `Lambda`. Lambdas are instances of the `Proc` class (although specific ones).

## Group 3

def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

# `block_method1` expects one argument (`animal`), and as any method can be called with or without a block.
# `yield` is a keyword that calls the block that is provided. If no block is provided, it raises a `LocalJumpError`.
# The second example calls the method without a block, `yield` therefore raises a `LocalJumpError`.
# The first example calls the method with a block, which is executed in the method's body.

## Group 4

def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# animal = 'dolphin'
block_method_2('turtle') { puts "This is a #{animal}."}

# `block_method2` defines a method that takes on argument, `animal`, and calls the block provided to the method during invocation, passing it the argument.
# In the second example, `block_method2` is called with a block that specifies two arguments. Only the first one is passed to it during execution, the second one is therefore set to `nil`.
# In the last example, the block body references a variable that has not been defined within the scope of the block. (Method definitions create an own scope.) If `animal` was defined within the block's scope (as in the commented out line), it would be part of the environment carried along by the closure created by the block, and execution would succeed, printing "This is a dolphin.".
