
def multiple_of_any?(num, divisors)
  divisors.each do |d|
    return true if (num % d).zero?
  end
  false
end

def multisum(num)
  multiples = []
  (1..num).each do |n|
    multiples << n if multiple_of_any?(n, [3, 5])
  end
  multiples.reduce(0,:+)
end

## Tests

p multisum(1) == 0
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(20) == 98
p multisum(1000) == 234168
