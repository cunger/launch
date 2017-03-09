
def get_as_float(what)
  loop do
    print "What is the #{what}? "
    input = gets.chomp.strip
    return Float(input) rescue puts("Please input a valid number...")
  end
end

bill = get_as_float("bill")
tip_percentage = get_as_float("tip percentage")

tip = bill * (tip_percentage / 100)
total = bill + tip

puts "The tip is $#{format('%.2f', tip)}"
puts "The total is $#{format('%.2f', total)}"
