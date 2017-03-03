
def prompt(what_to_prompt, options = "")
  puts "What's the #{what_to_prompt}? #{options}"
  gets.chomp
end

puts "Welcome to the calculator!"

number1 = prompt("first number")
number2 = prompt("second number")
operation = prompt("operation", "(+, -, *, /)")

result = case operation
         when "+"
           number1.to_i + number2.to_i
         when "-"
           number1.to_i - number2.to_i
         when "*"
           number1.to_i * number2.to_i
         when "/"
           number1.to_f / number2.to_f
         end

puts "#{number1} #{operation} #{number2} = #{result}"
