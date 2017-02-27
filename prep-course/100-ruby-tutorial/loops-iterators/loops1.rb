## Iterating 5 times

iterations = 5

for i in 1..iterations
  puts "Iteration number #{i}. #{iterations-i} to go!"
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

while numbers.size < 5
  numbers << rand(100)
end

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

until numbers.empty?
  puts numbers.shift
end

## Greet your friends

friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends
  puts "Hello, #{friend}!"
end
