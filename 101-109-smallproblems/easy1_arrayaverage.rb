def average(arr)
  arr.sum.to_f / arr.size
# arr.reduce(:+).to_f / arr.size
end

## Tests

puts average([1, 5, 87, 45, 8, 8]) == 25.666666666666668
puts average([9, 47, 23, 95, 16, 52]) == 40.333333333333336
