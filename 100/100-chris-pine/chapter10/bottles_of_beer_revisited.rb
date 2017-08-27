require_relative 'english_number'

def bottles(i)
  if i.zero?
    "no more bottles of beer"
  else
    str = english_number(i)
    if i == 1
      "#{str} bottle of beer"
    else
      "#{str} bottles of beer"
    end
  end
end

if ARGV.empty?
  puts "Usage:   ruby bottles_of_beer_revisited.rb <integer>"
  puts "Example: ruby bottles_of_beer_revisited.rb 99"
else
  num = ARGV.first.to_i
  (1..num).reverse_each do |i|
    puts "#{bottles(i).capitalize} on the wall, #{bottles(i)}."
    puts "Take one down and pass it around, #{bottles(i - 1)} on the wall."
    puts ""
  end
end
