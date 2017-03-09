
print "Enter a name: "
name = gets.chomp.strip
name = "Teddy" if name.empty?

age = rand(20..200)

puts "#{name} is #{age} years old!"
