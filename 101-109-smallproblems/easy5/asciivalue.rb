
def ascii_value(str)
  str.chars.map(&:ord).reduce(0,:+)
end

## Tests

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

p 'f'.ord.chr == 'f'
