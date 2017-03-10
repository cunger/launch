
INT_BASE = 10
INT_DIGITS = Hash.new(0).update( '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
                                 '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9)

HEX_BASE = 16
HEX_DIGITS = Hash.new(0).update( '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
                                 '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
                                 'A' => 10, 'B' => 11, 'C' => 12,
                                 'D' => 13, 'E' => 14, 'F' => 15)


def integer(str,base,digits)
  chars = str.chars.map(&:upcase)

  int = 0
  factor = 1

  chars.each_with_index do |char, index|
    factor = base**(chars.length - index - 1)
    int += digits[char] * factor
  end

  str.start_with?('-') ? -int : int
end

def string_to_integer(str)
  integer(str, INT_BASE, INT_DIGITS)
end

def hexadecimal_to_integer(str)
  integer(str, HEX_BASE, HEX_DIGITS)
end

# def to_int(str)
#   digits = str.chars.map { |char| DIGITS[char] }
#
#   int = 0
#   digits.each { |digit| value = 10 * value + digit }
#   int
# end

## Tests

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('9000004322776') == 9000004322776
p string_to_integer('007') == 7
p string_to_integer('fnord') == 0
p string_to_integer('4321') == 4321
p string_to_integer('-570') == -570
p string_to_integer('+100') == 100

p hexadecimal_to_integer('4D9f') == 19871
p hexadecimal_to_integer('D1CE') == 53710
