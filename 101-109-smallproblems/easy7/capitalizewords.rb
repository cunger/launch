def word_cap(str)
  # str.split(' ').map(&:capitalize).join(' ')
  words = str.split(' ')
  words.map! { |word|
    chars = word.chars.map(&:downcase)
    chars[0].upcase!
    chars.join
  }
  words.join(' ')
end

## Tests

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
