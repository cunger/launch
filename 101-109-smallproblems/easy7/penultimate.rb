
def penultimate(str)
  str.split[-2]
end

def middle(str)
  words = str.split
  if words.size.even?
    ''
  else
    words[words.size / 2]
  end
end

## Tests

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

p middle('Launch School rules!') == 'School'
p middle('Launch!') == 'Launch!'
p middle('Launch School') == ''
p middle('') == ''
