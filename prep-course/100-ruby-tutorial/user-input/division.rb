def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

def get_number(name, zero_allowed = true)

  loop do
    puts "Please enter the #{name}:"
    input = gets.chomp

    case
    when !zero_allowed && input == "0"
      puts "Nice try!"
    when valid_number?(input)
      return input.to_i
    else
      puts "Invalid input. Only integers are allowed."
    end
  end
end

numerator = getNumber("numerator")
denominator = getNumber("denominator", false)

puts "#{numerator} / #{denominator} = #{numerator / denominator}"
