def prompt(msg)
  puts ">> #{msg}"
end

def get_valid_input(msg, &validation)
  loop do
    prompt msg
    input = gets.chomp
    return input if validation.call(input)
  end
end

def run
  int_msg = "Please enter an integer greater than 0:"
  opr_msg = "Enter 's' to compute the sum, 'p' to compute the product."

  int_input = get_valid_input(int_msg) { |input| input.to_i.to_s == input && input.to_i > 0 }
  opr_input = get_valid_input(opr_msg) { |input| input == 's' || input == 'p' }

  integer = int_input.to_i

  case opr_input.downcase
  when 's'
    operation = :+
    operation_name = 'sum'
  when 'p'
    operation = :*
    operation_name = 'product'
  end

  result = (1..integer).reduce(operation)

  puts "The #{operation_name} of the integers from 1 to #{integer} is #{result}."
end

run
