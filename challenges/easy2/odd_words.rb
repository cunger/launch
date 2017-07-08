# INPUT
# text = sequence of words (made up of letters), separated by space(s), optionally terminated by a period

# OUTPUT
# text with words at odd indices reversed
# separated by one space
# if terminal period is present, it is kept (without spaces before it)

# STRATEGY
# * separate input text into an array of words
# * map over words with index: if index.odd? then word.reverse else word
# * join words again, using one space

def process(text)
  text.split(' ')
      .map.with_index { |word, index| index.odd? ? word.reverse : word }
      .join(' ')
      .gsub(/\s\./, '.')
end

## BONUS
# read characters one at a time

# STRATEGY
# * switch for reversing or not
# * for each char in input text:
#     * if char is a space, words << word , increase index by 1, and start a new word
#       (unless previous char was a space already)
#     * if char is a letter:
#         if index.even? then word << char
#         else word.prepend char
# * join words using one space

def process_char_by_char(text)
  words = []
  word = ''
  prev_char = nil
  reverse = false

  text.each_char do |char|
    # switching at spaces
    if char == ' '
      next if prev_char == ' '
      reverse = !reverse
      words << word
      word = ''
    # composing word of letters
    else
      reverse ? word.prepend(char) : word << char
    end
    prev_char = char
  end
  words << word unless word.empty?
  words.join(' ').gsub(/\s\./, '.')
end
