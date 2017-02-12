
words = []

input = "fnord"
until input.empty?
  input = gets.chomp.strip
  words << input
end

puts "And now in alphabetical order:"
puts words.sort
