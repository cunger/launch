
def negative(num)
  num.positive? ? -num : num
  # Alternative: -number.abs
end

## Tests

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0
