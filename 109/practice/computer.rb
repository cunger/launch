require 'pry'

DIGITS = { 'zero'  => 0,
           'one'   => 1,
           'two'   => 2,
           'three' => 3,
           'four'  => 4,
           'five'  => 5,
           'six'   => 6,
           'seven' => 7,
           'eight' => 8,
           'nine'  => 9 }

def computer(phrase)
  return 0 if phrase.empty?

  words  = phrase.split(' ')
  value1 = to_integer(words.shift)

  until words.empty?
    op_str  = words.shift
    op_str += ' ' + words.shift if op_str == 'divided'

    value2  = to_integer(words.shift)

    value1 = case op_str
      when 'plus'  then value1 + value2
      when 'minus' then value1 - value2
      when 'times' then value1 * value2
      when 'divided by' then value1.fdiv value2
      end
  end
  value1
end

def to_integer(string)
  if DIGITS.key? string
    DIGITS[string]
  else
    string.to_i
  end
end

p computer("six divided by 2") == 3
p computer("three") == 3
p computer("two plus two") == 4
p computer("seven minus six") == 1
p computer("zero plus 8") == 8
p computer("three minus one plus five minus 4 plus six plus 10 minus four") == 15
p computer("eight times four plus six divided by two minus two") == 17
