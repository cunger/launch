
def rotate(arr)
  arr[1..-1] + arr[0, 1]
end

def rotate_array(arr)
  return [] if arr.empty?
  rotate(arr)
end

def rotate_string(str)
  return '' if str.empty?
  rotate(str)
end

def rotate_integer(int)
  digits = int.to_s.chars
  rotate(digits).join.to_i
end

def rotate_rightmost_digits(int, index)
  digits = int.to_s.chars
  digit = digits.delete_at(-index)
  (digits + [digit]).join.to_i
end

def max_rotation(int)
  length = int.to_s.length
  length.downto(1) { |i| int = rotate_rightmost_digits(int, i) }
  int
end

## Tests

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
p rotate_array([]) == []

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]
p x == [1, 2, 3, 4]

p rotate_string('!fnord') == 'fnord!'
p rotate_string('') == ''

p rotate_integer(42) == 24
p rotate_integer(12345) == 23451
p rotate_integer(7) == 7

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
