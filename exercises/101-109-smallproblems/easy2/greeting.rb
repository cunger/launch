
def upcase?(str)
  str.upcase == str
end

print "What's your name? "
name = gets.chomp.strip

if name.end_with?("!") || upcase?(name)
  puts "HELLO #{name.delete('!').upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name.capitalize}."
end
