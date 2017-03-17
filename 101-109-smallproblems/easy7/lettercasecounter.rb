
def letter_case_count(str)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  # str.each_char do |char|
  #   if char.swapcase == char
  #     counts[:neither] += 1
  #   elsif char.upcase == char
  #     counts[:uppercase] += 1
  #   elsif char.downcase == char
  #     counts[:lowercase] += 1
  #   end
  # end
  counts[:uppercase] = str.scan(/[A-Z]/).size
  counts[:lowercase] = str.scan(/[a-z]/).size
  counts[:neither] = str.length - counts[:uppercase] - counts[:lowercase]
  counts
end

## Tests

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
