
puts "Please specify the start year: "
start_year = gets.chomp.to_i

puts "Please specify the end year: "
end_year = gets.chomp.to_i

puts "Leap years between #{start_year} and #{end_year}:"

leap_years = []
(start_year..end_year).each do |year|
  leap_years << year if (year % 4).zero? && (!(year % 100).zero? || (year % 400).zero?)
end

puts leap_years
