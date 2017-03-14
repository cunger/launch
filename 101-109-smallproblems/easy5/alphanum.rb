require_relative '../../prep-course/100-chris-pine/chapter10/english_number'

def alphabetic_number_sort(numbers)
  numbers.sort_by { |n| english_number(n) }
end

## Test

p alphabetic_number_sort((0..19).to_a) == [
    8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
    6, 16, 10, 13, 3, 12, 2, 0
  ]
