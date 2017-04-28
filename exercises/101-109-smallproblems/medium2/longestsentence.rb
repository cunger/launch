
def longest(separator, file)
  content = File.read file
  parts = content.split separator
  parts.max_by { |part| part.split(separator == ' ' ? '' : ' ').size }
end

## Examples

SENTENCE = /[.!?]/
PARAGRAPH = /(\n|\n\r|\r\n){2,}/
WORD = ' '

p longest(SENTENCE, 'example1.txt')
p longest(SENTENCE, 'example2.txt')

p longest(PARAGRAPH, 'example1.txt')
p longest(PARAGRAPH, 'example2.txt')

p longest(WORD, 'example1.txt')
p longest(WORD, 'example2.txt')
