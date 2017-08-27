puts "What's your name?"

name = gets.chomp.strip

def greeting(name)
  "Hi #{name}! Nice to meet you. Also hanging out at LaunchSchool, eh? :)"
end

def scream(str)
  str = str.upcase + "!!!"
  puts str
end

scream(greeting(name))

puts "And how old are you?"

age = gets.chomp.strip.to_i

puts "Aha. So in 10 years you will be #{age + 10} years old."
puts "And in 20 years you will be #{age + 20} years old."
puts "And in 30 years you will be #{age + 30} years old."
puts "And in 40 years you will be #{age + 40} years old."
puts "You get the gist, right?"

10.times { puts "Yay!" }
