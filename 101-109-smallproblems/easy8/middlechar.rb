
def center_of(str)
  chomped = str
  while chomped.length > 2
    chomped = chomped[1..-2]
  end
  chomped
end

## Tests

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
