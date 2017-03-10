
def palindrome?(reversible)
  reversible == reversible.reverse
end

def real_palindrome?(str)
  alphanum_part = str.downcase.gsub(/[^\w\d]/, '')
  # alternative: .delete('^a-z0-9')
  palindrome? alphanum_part
end

def palindromic_number?(num)
  palindrome? num.to_s
end

## Tests

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?(%w(blah blubb blubb blah)) == true
p palindrome?([1, 2, 3, 4]) == false
p palindrome?('') == true
p palindrome?([]) == true

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
