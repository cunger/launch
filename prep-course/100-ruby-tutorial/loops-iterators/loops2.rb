count = 1

loop do
  if count.even?
    puts "#{count} is even!"
  else
    puts "#{count} is odd!"
  end
  break if count == 5
  count += 1
end

loop do
  number = rand(100)
  puts number
  break if number.between?(0,10)
end

# Note: #between? is inclusive, i.e. 0.between?(0,10) => true

## Math quiz

loop do
  n1 = rand(100)
  n2 = rand(100)

  puts "What does #{n1} + #{n2} equal?"
  answer = gets.chomp.to_i

  if answer == n1 + n2
    puts "Yay! Correct!"
    break
  end

  puts "Nope... Try again."
end

## Collecting numbers

numbers = []

loop do
  puts 'Enter any number:'
  numbers << gets.chomp.to_i
  break if numbers.size == 5
end
puts "Your lucky numbers:"
puts numbers

##

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.empty?
end

##

5.times do |index|
  puts index
  break if index == 2
end

# Note: 5.times { |index| ... } means index in (0..4)

## First to 5

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next unless number_a < 5 || number_b < 5
  puts "5!"
  break
end

## More greetings

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end
