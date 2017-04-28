
def prompt_input(message)
  print message
  gets.chomp.strip
end

def prompt_integer
  loop do
    input = prompt_input("Please enter an integer greater than 0: ")
    begin
      integer = Integer(input)
    rescue
      puts("Sorry, that is not a valid integer...")
      next
    end
    return integer if integer.positive?
    puts "Note the 'greater than 0' ;-)"
  end
end

def prompt_operation
  loop do
    input = prompt_input("Enter 's' to compute the sum, 'p' to compute the product: ")
    return input if %w(s p).include? input
    puts "Hm, I was expecting 's' or 'p'..."
  end
end

integer   = prompt_integer
operation = prompt_operation

case operation
when 's'
  sum = (1..integer).reduce(:+)
  puts "The sum of the integers between 1 and #{integer} is #{sum}."
when 'p'
  product = (1..integer).reduce(:*)
  puts "The product of the integers between 1 and #{integer} is #{product}."
else
  puts "Uh oh. The impossible happened!"
end

## Note: alternative to (1..integer): 1.up_to(integer)
