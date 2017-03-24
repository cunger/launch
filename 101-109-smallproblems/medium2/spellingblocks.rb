
def block_word?(word)
  blocks = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'],
            ['N', 'A'], ['G', 'T'], ['R', 'E'], ['F', 'S'],
            ['J', 'W'], ['H', 'U'], ['V', 'I'], ['L', 'Y'],
            ['Z', 'M']]

  word.chars do |char|
    index = blocks.find_index { |block| block.include? char.upcase }
    return false if index.nil?
    blocks.delete_at index
  end
  true
end

## Tests

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
