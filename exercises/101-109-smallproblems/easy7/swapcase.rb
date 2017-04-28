
def swapcase(str)
  chars = str.chars
  chars.map! { |char|
    if char.upcase == char
      char.downcase
    else
      char.upcase
    end
  }
  chars.join
end

## Tests

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
p swapcase('Motörhead RULEZ. Not.') == 'mOTÖRHEAD rulez. nOT.'
