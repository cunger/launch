
def swap(str)
  words = str.split(' ')
  words.map! do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end
  words.join(' ')
end

## Tests

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
p swap('') == ''
