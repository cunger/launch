def english_number(number)

  # Accept numbers between 0 and 1,000,000,000,000
  if number < 0 or number > 1_000_000_000_000
    return 'Please enter a number between 0 and 1,000,000,000,000.'
  end

  # Only special case
  if number == 0
    return 'zero'
  end

  num_string = '' # This is the string we will return.
  ones_place = [ 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' ]
  tens_place = [ 'ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety' ]
  teenagers  = [ 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen' ]
  big_ones   = { 1_000_000_000_000 => 'trillion',
                     1_000_000_000 => 'billion',
                         1_000_000 => 'million',
                             1_000 => 'thousand',
                               100 => 'hundred' }


  # "left" is how much of the number we still have left to write out.
  # "write" is the part we are writing out right now.
  # write and left...get it? :)
  left  = number
  write = 0

  # Millions, thousands, hundreds, etc.
  big_ones.each do |n,str|

    write = left/n
    left = left - write*n 

    if write > 0
      # Now here's the recursion:
      amount = english_number(write)
      num_string = num_string + amount + ' ' + str

      if left > 0
        num_string = num_string + ' '
      end
    end
  end

  # Tens:
  # Since we can't write "ten-two" instead of "twelve",
  # we have to make a special exception for teenagers.
  write = left/10
  left = left - write*10

  if write > 0
    if ((write == 1) and (left > 0))
      num_string = num_string + teenagers[left-1]
      # Since we took care of the digit in the ones place already, we have nothing left to write.
      left = 0
    else
      num_string = num_string + tens_place[write-1]
    end
    if left > 0
      num_string = num_string + '-'
    end
  end

  # Ones
  write = left
  left = 0
  if write > 0
    num_string = num_string + ones_place[write-1]
  end

  # Now we just return "num_string"...
  num_string
end

puts english_number( 0)
puts english_number( 9)
puts english_number( 10)
puts english_number( 11)
puts english_number( 17)
puts english_number( 32)
puts english_number( 88)
puts english_number( 99)
puts english_number(100)
puts english_number(101)
puts english_number(234)
puts english_number(3211)
puts english_number(999999)
puts english_number(1000000000000)
