
def repeater(str)
  doubled = ''
  str.chars.each { |char| doubled << char * 2 }
  doubled
end

def double_consonants(str)
  doubled = ''
  str.chars.each do |char|
    doubled << char
    doubled << char if consonant?(char)
  end
  doubled
end

def consonant?(char)
  char =~ /[a-zA-Z]/ && char =~ /[^aeiou]/
end

## Tests

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
