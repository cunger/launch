
def stringy(num, start = 1)
  other = (start - 1).abs
  string = ''
  num.times do |index|
    if index.even?
      string += start.to_s
    else
      string += other.to_s
    end
  end
  string
end

## Interesting:

def stringy_paul_broadfoot(num)
  [1,0].cycle.take(num).join
end

## Tests

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(0) == ''

puts stringy(6,0) == '010101'
puts stringy(9,0) == '010101010'
puts stringy(4,0) == '0101'
puts stringy(7,0) == '0101010'

puts stringy_paul(6) == '101010'
puts stringy_paul(9) == '101010101'
puts stringy_paul(4) == '1010'
puts stringy_paul(7) == '1010101'
