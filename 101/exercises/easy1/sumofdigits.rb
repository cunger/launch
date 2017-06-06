
def sum(int)
  int.to_s.chars.map(&:to_i).reduce(:+)
end

## Tests

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
