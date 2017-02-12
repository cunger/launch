
@translation =
    { 'M'  => 1000,
      'CM' =>  900,
      'D'  =>  500,
      'CD' =>  400,
      'C'  =>  100,
      'XC' =>   90,
      'L'  =>   50,
      'XL' =>   40,
      'X'  =>   10,
      'IX' =>    9,
      'V'  =>    5,
      'IV' =>    4,
      'I'  =>    1 }

def roman_to_integer(roman)

  str = roman.upcase
  num = 0

  until str.empty?
    num1 = @translation[str[0..1]]
    num2 = @translation[str[0]]
    if not num1.nil?
      num += num1
      str  = str[2..-1]
    elsif not num2.nil?
      num += num2
      str  = str[1..-1]
    else
      puts "'#{roman}' is not a valid Roman numeral."
      return nil
    end
  end

  num
end

puts roman_to_integer('mcmxcix')
puts roman_to_integer('mmmhhh...')
