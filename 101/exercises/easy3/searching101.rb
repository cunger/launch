
def ordinal(number)
  case number
  when 1 then '1st'
  when 2 then '2nd'
  when 3 then '3rd'
  else number.to_s + 'th'
  end
end

def elicit(number)
  print "Enter the #{ordinal(number + 1)} number: "
  Integer(gets.chomp.strip)
end

numbers = []

6.times { |n| numbers << elicit(n) }

last_number = numbers.pop

neg = 'not '
neg = '' if numbers.include? last_number

puts "The number #{last_number} is #{neg}included among #{numbers.join(', ')}."
