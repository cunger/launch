require_relative 'multiplying'

def square(n)
  multiply n, n
end

def power(n, e)
  result = 1
  e.times { result = multiply result, n }
  result
end

## Tests

p square(5) == 25
p square(-8) == 64

p power(3, 1) == 3
p power(3, 2) == 9
p power(3, 4) == 81
p power(3, 0) == 1
