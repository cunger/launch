
def divisible_by?(num, divisor)
  (num % divisor).zero?
end

def leap_year?(year)
  if year < 1752
    return true if divisible_by?(year, 4)
  else
    return true if divisible_by?(year, 4) && !divisible_by?(year, 100)
    return true if divisible_by?(year, 400)
  end
  false
end

## Alternatives using Date (Alex Ross)
#
# require 'date'
#
# Date.new(year, 1, 1, Date::GREGORIAN).leap?
# Date.gregorian_leap?(year)

## Tests

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true
