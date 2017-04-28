
def include?(array, value)
  array.each { |a| return true if a == value }
  false
end

# Alternative: !!array.find_index(value)

## Tests

p include?([1, 2, 3, 4, 5], 3) == true
p include?([1, 2, 3, 4, 5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
