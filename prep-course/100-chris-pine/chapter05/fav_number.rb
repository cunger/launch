
# Bigger, better favourite number

fav = ""
until fav =~ /[\d.]+/
  puts "That's not a number..." unless fav.empty?
  puts "Say, what's your favourite number?"
  fav = gets.chomp
end

better = fav.to_i + 1

puts "Nice, but how about #{better}? That's even cooler, isn't it?"
