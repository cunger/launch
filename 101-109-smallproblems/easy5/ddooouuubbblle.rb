
def crunch(str)
  str.gsub(/(.)\1*/, '\1')
end

def crunch2(str)
  crunched_str = ''
  last_char = ''
  str.chars.each do |char|
    crunched_str << char unless char == last_char
    last_char = char
  end
  crunched_str
end

## Tests

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

p crunch2('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch2('4444abcabccba') == '4abcabcba'
p crunch2('ggggggggggggggg') == 'g'
p crunch2('a') == 'a'
p crunch2('') == ''

p 'ddaaiillyy ddoouubbllee'.squeeze == 'daily double'
p '4444abcabccba'.squeeze == '4abcabcba'
p 'ggggggggggggggg'.squeeze == 'g'
p 'a'.squeeze == 'a'
p ''.squeeze == ''
