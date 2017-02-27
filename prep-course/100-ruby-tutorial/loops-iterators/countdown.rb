
def countdown(number)
  if number == 0
    puts "LAUNCH!"
  else
    puts number
    countdown(number - 1)
  end
end

start = gets.chomp.to_i

puts "Initializing countdown."
countdown(start)
