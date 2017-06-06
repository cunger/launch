
DIGITS = { 'zero'  => '0',
           'one'   => '1',
           'two'   => '2',
           'three' => '3',
           'four'  => '4',
           'five'  => '5',
           'six'   => '6',
           'seven' => '7',
           'eight' => '8',
           'nine'  => '9' }
DIGITS.freeze

def word_to_digit(str)
  DIGITS.each do |word, digit|
    str.gsub! /\b#{word}\b/i, digit
  end
  str.gsub! /(\d)\s(\d)/, '\1\2'
  str.gsub! /(\d)\s(\d)/, '\1\2'
  # Is there a better way than to call this substitution twice?
  str.gsub! /(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3'
  str
end

## Test

p word_to_digit('Please call me at five five five one two three four. Thanks.')
  # == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

p word_to_digit('Please call me at ONE TWO THREE four five six seven eight nine zero. Thanks.')
  # == 'Please call me at (123) 456-7890. Thanks.'
