def prompt(message)
  puts "=> #{message}"
end

def get_answer(message, error_message, &validation)
  loop do
    prompt message
    answer = gets.chomp.strip
    if validation.call(answer)
      return answer
    else
      prompt error_message
    end
  end
end

number_validation   = proc { |str| str =~ /^\d+$/ }
operator_validation = proc { |str| %w(+ - * /).include? str }
answer_validation   = proc { |str| %w(y n).include? str.downcase }

prompt "Welcome to the calculator!"

loop do
  # Get numbers and operator from user.
  number1 = get_answer("What's the first number?",
                       "Hmm... That doesn't look like a valid number.",
                       &number_validation)
  number2 = get_answer("What's the second number?",
                       "Hmm... That doesn't look like a valid number.",
                       &number_validation)

  operation_prompt = <<-STR
    What operation would you like to perform?
    + (addition)
    - (subtraction)
    * (multiplication)
    / (division)
  STR
  operation = get_answer(operation_prompt,
                         "Please choose +, -, *, or /.",
                         &operator_validation)

  # Perform calculation.
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

  # Show result.
  prompt "#{number1} #{operation} #{number2} = #{result}"

  # Ask user whether to perform another calculation.
  another_one = get_answer("Do you want to perform another operation? y/n",
                           "Please say 'y' or 'n'.",
                           &answer_validation)
  break if another_one != 'y'
end

prompt "Ciao!"
