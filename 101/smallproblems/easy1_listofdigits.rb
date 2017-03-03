
def digit_list_str(integer)
# integer.to_s.split(//).map { |char| char.to_i }
  integer.to_s.chars.map(&:to_i)
end

def digit_list_int(integer)
  digits = []
  while integer >= 10
  # digits.unshift(integer % 10)
  # integer /= 10
    integer, digit = integer.divmod(10)
    digits.unshift(digit)
  end
  digits.unshift(integer)
end

## Notes

# Fixnum#divmod combines / and %, e.g.
# > 12345.divmod(10) [1234, 5]


## Examples

puts digit_list_str(12345) == [1, 2, 3, 4, 5]
puts digit_list_str(7) == [7]
puts digit_list_str(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list_str(444) == [4, 4, 4]

puts digit_list_int(12345) == [1, 2, 3, 4, 5]
puts digit_list_int(7) == [7]
puts digit_list_int(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list_int(444) == [4, 4, 4]
puts digit_list_int(10) == [1, 0]
puts digit_list_int(0) == [0]
