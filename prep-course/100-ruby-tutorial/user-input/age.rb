puts "What's your age in years?"

answer = gets.chomp

if answer =~ /^\d+$/
  years = answer.to_i
  puts "Wow, you're #{years * 12} months old!"
else
  puts "Well..."
end
