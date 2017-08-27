## Iterating 5 times

iterations = 5

(1..iterations).each do |i|
  puts "Iteration number #{i}. #{iterations - i} to go!"
end

## Saying 'Hello!' 5 times

say_hello = true

counter = 0
while say_hello
  puts 'Hello!'
  counter += 1
  say_hello = false if counter == 5
end

## Printing 5 random numbers

numbers = []
numbers << rand(100) while numbers.size < 5

puts numbers

## Count...

# ...down

count = 10

until count < 0
  puts count
  count -= 1
end

# ...up

count = 0

until count > 10
  puts count
  count += 1
end

## Printing more numbers

numbers = [7, 9, 13, 25, 18]
puts numbers.shift until numbers.empty?

## Greet your friends

friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends
  puts "Hello, #{friend}!"
end
