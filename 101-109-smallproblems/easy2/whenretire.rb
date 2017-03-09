
def get_as_int(message)
  loop do
    print message +" "
    input = gets.chomp.strip
    return Integer(input) rescue puts("Please input a valid integer...")
  end
end

current_age   = get_as_int "What is your age?"
retirment_age = get_as_int "At what age would you like to retire?"

years_ahead     = retirment_age - current_age
current_year    = Time.now.year
retirement_year = current_year + years_ahead

if years_ahead.negative?
  puts "So you're already retired? Congrats!"
else
  puts "It's #{current_year}. You will retire in #{retirement_year}."
  puts "You have only #{years_ahead} years of work to go!"
end
