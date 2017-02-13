
$letters_basic =
  { 1000 => 'M',
     500 => 'D',
     100 => 'C',
      50 => 'L',
      10 => 'X',
       5 => 'V',
       1 => 'I',
  }

$letters_full =
    { 1000 => 'M',
       900 => 'CM',
       500 => 'D',
       400 => 'CD',
       100 => 'C',
        90 => 'XC',
        50 => 'L',
        40 => 'XL',
        10 => 'X',
         9 => 'IX',
         5 => 'V',
         4 => 'IV',
         1 => 'I',
    }

def to_roman(hash,num)

  str = ""

  hash.each do |n,rom|

    full = num/n
    rest = num%n

    if full > 0
      str += rom * full
      num -= full * n
    end
  end

  str
end

def to_oldschool_roman(num)
  to_roman($letters_basic,num)
end

def to_modern_roman(num)
  to_roman($letters_full,num)
end


puts "Give me an integer:"
number = gets.chomp.strip.to_i

puts "The Romans would say:"
puts to_oldschool_roman(number)
puts to_modern_roman(number)
