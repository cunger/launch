require_relative 'substrings'

def palindromes(str)
  palindromes = []
  substrings(str).each do |substring|
    if palindrome?(substring)
      palindromes << substring
    end
  end
  palindromes
end

def palindrome?(str)
  str.size > 1 && str == str.reverse
end

def palindromic?(str)
  str_ignorestuff = str.downcase.delete '^a-z0-9'
  str_ignorestuff.size > 1 && str_ignorestuff == str_ignorestuff.reverse
end

## Tests

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

p palindromic?('AbCcBa') == true
p palindromic?('Ab-CcBa--') == true
p palindromic?('---') == false # ??
