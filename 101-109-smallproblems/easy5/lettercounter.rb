
def word_sizes(str)
  counts = {}
  counts.default = 0
  str.split(' ').each do |word|
    word.gsub!(/[^\w]/, '')
    counts[word.length] += 1
  end
  counts
end

# Two ways of specifying default value in a hash:
# * counts = Hash.new(0)
# * counts = {}
#   counts.default = 0

## Tests

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
