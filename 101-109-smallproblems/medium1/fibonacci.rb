
def fibonacci_rec(n)
  return 1 if n <= 2
  fibonacci_rec(n - 1) + fibonacci_rec(n - 2)
end

def fibonacci_proc(n)
  acc1 = 1
  acc2 = 1
  3.upto n do
    acc1, acc2 = acc2, acc2 + acc1
  end
  acc2
end

def fibonacci_last(n)
  dig1 = 1
  dig2 = 1
  3.upto n do
    dig1, dig2 = dig2, digit_plus(dig1, dig2)  
  end
  dig2
end

def digit_plus(n1, n2)
  n = n1 + n2
  n < 10 ? n : n - 10
end

## Tests

p fibonacci_rec(1) == 1
p fibonacci_rec(2) == 1
p fibonacci_rec(3) == 2
p fibonacci_rec(4) == 3
p fibonacci_rec(5) == 5
p fibonacci_rec(12) == 144
p fibonacci_rec(20) == 6765

p fibonacci_proc(20) == 6765
p fibonacci_proc(100) == 354224848179261915075
p fibonacci_proc(100_001) # => 4202692702.....8285979669707537501

p fibonacci_last(15) == 0        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20) == 5        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100) == 5       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001) == 1   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) == 3 # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) == 4 # -> 4
