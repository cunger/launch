
CHAR = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
         5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }

def integer_to_string(num)
  negative = num.negative?

  num = num.abs
  str = ''

  loop do
    num, digit = num.divmod 10
    str.prepend CHAR[digit]
    break if num.zero?
  end

  negative ? '-' + str : str
end

## Test

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
p integer_to_string(-123) == '-123'
