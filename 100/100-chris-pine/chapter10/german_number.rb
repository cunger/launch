def german_number(number)

  # Accept numbers between 0 and 1,000,000,000,000
  if number < 0 || number > 1_000_000_000_000
    return 'Please enter a number between 0 and 1,000,000,000,000.'
  end

  # Only special case
  return 'null' if number.zero?

  num_string = '' # This is the string we will return.
  ones_place = ['eins', 'zwei', 'drei', 'vier', 'fünf', 'sechs', 'sieben', 'acht', 'neun']
  tens_place = ['zehn', 'zwanzig', 'dreißig', 'vierzig', 'fünfzig', 'sechzig', 'siebzig', 'achtzig', 'neunzig']
  teenagers  = ['elf', 'zwölf', 'dreizehn', 'vierzehn', 'fünfzehn', 'sechzehn', 'siebzehn', 'achtzehn', 'neunzehn']

  really_big_ones   = { 1_000_000_000_000 => { :sg => 'Billion',   :pl => 'Billionen'  },
                            1_000_000_000 => { :sg => 'Milliarde', :pl => 'Milliarden' },
                                1_000_000 => { :sg => 'Million',   :pl => 'Millionen'  } }
  slightly_big_ones = {             1_000 => 'tausend',
                                      100 => 'hunderd' }


  # "left" is how much of the number we still have left to write out.
  # "write" is the part we are writing out right now.
  # write and left...get it? :)
  left = number
  write = 0

  # Trillions, billions, millions
  really_big_ones.each do |n, strs|

    write = left / n
    left -= write * n

    next if write <= 0

    # Now here's the recursion:
    amount = german_number(write)
    if amount == 'eins'
      amount = 'eine'
      str = strs[:sg]
    else
      str = strs[:pl]
    end
    num_string += amount + ' ' + str + ' '
  end

  # Thousands and hundreds
  slightly_big_ones.each do |n, str|

    write = left / n
    left -= write * n

    next if write <= 0

    # Now here's the recursion:
    amount = german_number(write)
    amount = 'ein' if amount == 'eins'
    num_string += amount + str
  end

  # Main difference between English and German:
  # In German the ones come before the tens (23 = dreiundzwanzig, literally 3-and-20).
  # So compute both of them and then concatenate them afterwards in reverse order.

  tens = ''
  ones = ''

  # Tens

  write = left / 10
  left -= write * 10

  if write > 0
    if write == 1 && left > 0
      tens = teenagers[left - 1]
      left = 0
    else
      tens = tens_place[write - 1]
    end
  end

  # Ones

  write = left
  left = 0

  ones = ones_place[write - 1] if write > 0

  # Concatenating tens and ones

  num_string += if !ones.empty? && !tens.empty?
                  ones + 'und' + tens
                else
                  ones + tens
                end

  # And done!

  num_string
end

puts german_number(0)
puts german_number(9)
puts german_number(10)
puts german_number(11)
puts german_number(17)
puts german_number(32)
puts german_number(88)
puts german_number(99)
puts german_number(100)
puts german_number(101)
puts german_number(234)
puts german_number(3211)
puts german_number(999999)
puts german_number(1000000000)
puts german_number(2000000000)
puts german_number(1000000000000)
puts german_number(103050600012)
