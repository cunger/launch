
# Bigger, better favourite number

fav = ""
until fav.match(/[\d.]+/)
  if not fav.empty?
    puts "That's not a number..."
  end
  puts "Say, what's your favourite number?"
  fav = gets.chomp
end

better = fav.to_i + 1

puts "Nice, but how about #{better}? That's even cooler, isn't it?"
