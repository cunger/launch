
def sum_square_difference(number)
  squared_sum = 1.upto(number).reduce(:+)**2
  sum_squares = 1.upto(number).map { |n| n**2 }.reduce(:+)
  (squared_sum - sum_squares).abs
end

## Tests

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
