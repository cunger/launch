
puts "Please specify the start year: "
start_year = gets.chomp.to_i

puts "Please specify the end year: "
end_year = gets.chomp.to_i

puts "Leap years between #{start_year} and #{end_year}:"

leap_years = []
(start_year..end_year).each do |year|
  if year%4 == 0 && (year%100 != 0 or year%400 == 0)
    leap_years << year
  end
end

puts leap_years
