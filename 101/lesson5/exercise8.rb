hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |words|
  words.each do |word|
    word.each_char do |char|
      puts char if 'aeiuo'.include? char
    end
  end
end
 
