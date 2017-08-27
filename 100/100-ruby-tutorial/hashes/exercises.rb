
## Exercise 1

family = {  uncles:   ["bob", "joe", "steve"],
            sisters:  ["jane", "jill", "beth"],
            brothers: ["frank", "rob", "david"],
            aunts:    ["mary", "sally", "susan"] }

puts family.select { |k,_| [:sisters,:brothers].include? k }
           .values
           .flatten
           .to_s

## Exercise 2

static_hash  = { v1: "one", v2: "two" }
dynamic_hash = { v1: "one", v2: "two" }

puts static_hash.merge({ v3: "three" }) != static_hash

puts dynamic_hash.merge!({ v3: "three" }) == dynamic_hash
puts dynamic_hash == dynamic_hash.merge!(v4: "four")

## Exercise 3

buddy_check = { Tachierjacket: ["Inflator", "Schnellablass", "manuelles Aufblasen"],
                Blei: ["Bleigurte", "Maskenband", "Flossenbänder"],
                Schnallen: ["Bauchgurt", "Brustgurt", "Flaschenhalterung"],
                Luft: ["Flasche offen", "Finimeter", "Atemregler", "Oktopus"] }

buddy_check.each_key { |k| puts "* " + k.to_s }
buddy_check.each_value { |v| puts v.join(", ") }
buddy_check.each { |k,v| puts k.to_s + ": " + v.join(", ") }

## Exercise 5

if buddy_check.any? { |_,v| v.include? "Inflator" }
  puts "You are checking the inflator."
else
  puts "You forgot to check the inflator!"
end

## Exercise 6

require 'set'

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
         'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
         'flow', 'neon']

# anagrams = Set.new
# words.each do |word|
#   anagrams << words.select { |w| Set.new(w.chars) == Set.new(word.chars) }
# end
# anagrams.each { |ls| puts ls.to_s }

# Building each anagram list only once:
anagram_lists = []
words.each do |word|
  # Find all anagrams of word and store them
  anagrams = words.select { |w| Set.new(w.chars) == Set.new(word.chars) }
  anagram_lists << anagrams
  # Then delete them from the list
  anagrams.each { |w| words.delete(w) }
end
anagram_lists.each { |ls| puts ls.to_s }
