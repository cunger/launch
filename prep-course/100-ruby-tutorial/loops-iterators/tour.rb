
stops = [ :Amsterdam, :Bielefeld, :Sydney, :Seoul ]

puts "Welcome to the Magical Mystery Tour! We'll stop in:"

stops.each_with_index do |city,index|
  puts "#{index + 1}. #{city}"
end
