
$affirmative = [ "y", "yes", "sure", "yeah" ]
$negative    = [ "n" "no", "nope" ]

def valid?(str)
  ($affirmative + $negative).include? str
end

def yes?(str)
  $affirmative.include? str
end

answer = nil

loop do
  puts "Do you want me to say something?"
  answer = gets.chomp.downcase
  break if valid?(answer)
  puts "Sorry, was expecting 'y' or 'n'..."
end

puts "Something. (Haha!)" if yes?(answer)
