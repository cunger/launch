require 'json'

## Language support

if ARGV.size == 1 && %w(en de).include?(ARGV[0])
  LANGUAGE = ARGV[0]
else
  puts "Usage: ruby calculator.rb <language>"
  puts "Currently supported languages: en, de"
  exit
end

MESSAGES = JSON.parse(File.read("calculator_messages.json"))

## Aux methods

def prompt(message)
  puts "=> #{message}"
end

def get_answer(message, error_message, &validation)
  loop do
    prompt message
    answer = STDIN.gets.chomp.strip
    if validation.call(answer)
      return answer
    else
      prompt error_message
    end
  end
end

def msg(key)
  MESSAGES[key][LANGUAGE]
end

number_validation   = proc { |str| str =~ /^\d+(.\d+)?$/ }
operator_validation = proc { |str| %w(+ - * /).include? str }
answer_validation   = proc { |str| msg("countsasyes") == str.downcase || msg("countsasno") == str.downcase }

## Running the calculator

prompt msg("intro")

loop do
  # Get numbers and operator from user.
  number1   = get_answer(msg("first_number"), msg("number_error"), &number_validation)
  number2   = get_answer(msg("second_number"), msg("number_error"), &number_validation)
  operation = get_answer(msg("operation"), msg("operation_error"), &operator_validation)

  # Perform calculation.
  result = case operation
           when "+"
             number1.to_f + number2.to_f
           when "-"
             number1.to_f - number2.to_f
           when "*"
             number1.to_f * number2.to_f
           when "/"
             number1.to_f / number2.to_f
           end

  # Show result.
  prompt "#{number1} #{operation} #{number2} = #{result}"

  # Ask user whether to perform another calculation.
  another_one = get_answer(msg("again"), msg("again_error"), &answer_validation)
  break if another_one != msg("countsasyes")
end

prompt msg("outro")
