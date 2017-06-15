## Group 1

def check_return_with_proc
  my_proc = proc { return }
  my_proc.call
  puts "This will never output to screen."
end

check_return_with_proc

# Procs return from the context in which they were defined. In this example this is the method, i.e. it returns not only from the block but also from the method it is part of, and the string will never be printed.

## Group 2

my_proc = proc { return }

def check_return_with_proc_2(my_proc)
  my_proc.call
end

check_return_with_proc_2(my_proc)

# When `my_proc` is called, it again tries to return from its context. However, this context now differs, as the proc was defined outside of the method, at the top-level of the program. It therefore tries to return from the top-level, which is not possible; a `LocalJumpError` is thrown.

## Group 3

def check_return_with_lambda
  my_lambda = lambda { return }
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda

# Lambdas, on the other hand, only return from their own context, i.e. from the block, and hand control back to the calling context.
# Therefore `my_lambda.call` returns from the block, handing control to `check_return_with_lambda` (the context where the lambda was defined), which proceeds as defined, printing the string.

## Group 4

my_lambda = lambda { return }

def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)

# The same happens here: `return` returns from the block and hand control to the calling context, which is the method `check_return_with_lambda`, which proceeds as defined and prints the string.

## Group 5

def block_method_3
  yield
end

block_method_3 { return }

# Blocks behave like non-lambda procs: they return from their context (the context during initialization, not during execution). This is, again, not a method but the top-level, from which we can't return.
