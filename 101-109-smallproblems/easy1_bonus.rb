
def calculate_bonus(salary, eligible)
  eligible ? salary / 2 : 0
end

## Tests

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50_000, true) == 25_000
