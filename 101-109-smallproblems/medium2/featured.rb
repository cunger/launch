
# a featured number is an odd number that is a multiple of 7,
# and whose digits occur exactly once each

def featured(number)
  number += 1

  loop do
    remainder = number % 7
    digits = number.to_s.chars # Note: number.digits :: [Int]

    return nil    if digits.size > 10
    return number if remainder.zero? && number.odd? && digits.uniq == digits

    number += 7 - remainder
  end
end

## Tests

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999).nil?
