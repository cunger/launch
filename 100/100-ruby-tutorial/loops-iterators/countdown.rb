
def countdown(number)
  if number.zero?
    puts "LAUNCH!"
  else
    puts number
    countdown(number - 1)
  end
end

start = gets.chomp.to_i

puts "Initializing countdown."
countdown(start)
