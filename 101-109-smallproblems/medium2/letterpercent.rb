
def letter_percentages(str)
  total = str.size
  counts = { lowercase: 0, uppercase: 0, neither: 0 }

  str.chars.each do |char|
    case
    when char.swapcase == char
      counts[:neither] += 1
    when char.upcase == char
      counts[:uppercase] += 1
    when char.downcase == char
      counts[:lowercase] += 1
    end
  end

  counts.transform_values { |count| 100 * (count.fdiv total) }
end

## Tests

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
