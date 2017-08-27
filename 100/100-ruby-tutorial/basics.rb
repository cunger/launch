
##########################
puts "\n## Exercise 2\n\n"

def digits(number)
  puts "----- #{number} -----"

  [1000, 100, 10, 1].each do |n|
    digit  = number / n
    number = number % n
    spaces = ' ' * (4 - n.to_s.size)
    puts "#{n}-er place: #{spaces}#{digit}"
  end
end

digits(4723)
digits(350)
digits(198_300)

##########################
puts "\n## Exercise 3\n\n"

movies = { 'Andrei Rublev' => 1962,
           'Solaris'       => 1972,
           'Mirror'        => 1975,
           'Stalker'       => 1979 }

movies.each { |_, year| puts year.to_s }

##########################
puts "\n## Exercise 4\n\n"

arr0 = [1962, 1972, 1975, 1979]

arr1 = []
movies.each { |_, year| arr1 << year }

arr2 = movies.map { |_, year| year }

arr3 = movies.values

puts arr0
puts "\nTests: "
puts arr1 == arr0
puts arr2 == arr0
puts arr3 == arr0

##########################
puts "\n## Exercise 5\n\n"

def factorial(num)
  return 1 if num.zero?
  num * factorial(num - 1)
end

(0..9).each { |n| puts "factorial(#{n}) = #{factorial(n)}" }

##########################
puts "\n## Exercise 6\n\n"

puts 3.14 * 3.14
puts 3.14**2
puts 3.14**2.0
