
def bottles(i)
  if i.zero?
    "no more bottles of beer"
  elsif i == 1
    "1 bottle of beer"
  else
    "#{i} bottles of beer"
  end
end

(1..99).reverse_each do |i|

  puts "#{bottles(i)} on the wall, #{bottles(i)}."
  puts "Take one down and pass it around, #{bottles(i - 1)} on the wall."
  puts ""
end
