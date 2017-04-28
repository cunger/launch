
def reverse_sentence(str)
  str.split(' ').reverse.join(' ')
end

def reverse_words(str)
  str.split.each { |word| word.reverse! if word.size >= 5 }.join(' ')
end

## Examples

puts reverse_sentence('')
puts reverse_sentence('Hello world')
puts reverse_sentence('Oh my, look at this!')

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
