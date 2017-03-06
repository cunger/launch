
AFFIRMATIVE = ["y", "yes", "sure", "yeah"]
NEGATIVE    = ["n", "no", "nope"]

def valid?(str)
  (AFFIRMATIVE + NEGATIVE).include? str
end

def yes?(str)
  AFFIRMATIVE.include? str
end

answer = nil

loop do
  puts "Do you want me to say something?"
  answer = gets.chomp.downcase
  break if valid?(answer)
  puts "Sorry, was expecting 'y' or 'n'..."
end

puts "Something. (Haha!)" if yes?(answer)
