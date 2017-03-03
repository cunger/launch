arr = [1, 2, 3, 4]

arr.each do |a|
  puts "--#{a}--"
  arr.pop
  puts arr
end

puts "Wow, Ruby, that's interesting!"
