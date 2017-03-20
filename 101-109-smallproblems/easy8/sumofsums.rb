
def sum_of_sums(numbers)
  sum = 0
  1.upto(numbers.size) { |n| sum += numbers.take(n).reduce(:+) }
  sum
end

## Tests

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
p sum_of_sums([]) == 0
