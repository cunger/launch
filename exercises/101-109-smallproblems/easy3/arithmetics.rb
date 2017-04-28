
print 'Enter the first number: '
number1 = Integer(gets.chomp)

print 'Enter the second number: '
number2 = Integer(gets.chomp)

puts 'Calculating...'

puts "#{number1} + #{number2} = #{number1 + number2}"
puts "#{number1} - #{number2} = #{number1 - number2}"
puts "#{number1} * #{number2} = #{number1 * number2}"
puts "#{number1} / #{number2} = #{number1 / number2}" if number2 != 0
puts "#{number1} % #{number2} = #{number1 % number2}" if number2 != 0
puts "#{number1} ** #{number2} = #{number1**number2}"
