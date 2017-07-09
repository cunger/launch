def first_fibonacci_numbers(amount)
  fibs = [1, 1]
  return fibs.take(amount) if amount <= 2
  (amount - 2).times do
    fibs << fibs[-1] + fibs[-2]
  end
  fibs
end

p first_fibonacci_numbers(0)
p first_fibonacci_numbers(1)
p first_fibonacci_numbers(2)
p first_fibonacci_numbers(15)

def nth_fibonacci_number(n)
  return nil if n < 1
  return 1   if n == 1 || n == 2

  previous = 1
  current  = 1
  (n - 2).times do
    previous, current = current, current + previous
  end
  current
end

p nth_fibonacci_number(0)
p nth_fibonacci_number(1)
p nth_fibonacci_number(2)
p nth_fibonacci_number(3)
p nth_fibonacci_number(4)
p nth_fibonacci_number(5)
p nth_fibonacci_number(6)
p nth_fibonacci_number(7)

def rec_nth_fib(n)
  return nil if n < 1
  return 1   if n == 1 || n == 2

  rec_fib(n, 2, 1, 1)
end

def rec_fib(n, i, previous, current)
  return current if i == n
  rec_fib(n, i + 1, current, previous + current)
end

p rec_nth_fib(1)
p rec_nth_fib(2)
p rec_nth_fib(3)
p rec_nth_fib(4)
