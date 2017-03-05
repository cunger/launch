require 'json'

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

if ARGV.size == 1 && %w(en de).include?(ARGV[0])
  language = ARGV[0]
else
  puts "Usage: ruby calculator.rb <language>"
  puts "Currently supported languages: en, de"
  exit
end

messages = JSON.parse(File.read("calculator_messages.json"))

number_validation   = proc { |str| str =~ /^\d+(.\d+)?$/ }
operator_validation = proc { |str| %w(+ - * /).include? str }
answer_validation   = proc { |str| messages["countsasyes"][language] == str.downcase || messages["countsasno"][language] == str.downcase }

prompt messages["intro"][language]

loop do
  # Get numbers and operator from user.
  number1   = get_answer(messages["first_number"][language], messages["number_error"][language], &number_validation)
  number2   = get_answer(messages["second_number"][language], messages["number_error"][language], &number_validation)
  operation = get_answer(messages["operation"][language], messages["operation_error"][language], &operator_validation)

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
  another_one = get_answer(messages["again"][language], messages["again_error"][language], &answer_validation)
  break if another_one != messages["countsasyes"][language]
end

prompt messages["outro"][language]
