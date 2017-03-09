
## Question 3

advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub! "important", "urgent"

puts advice

## Question 5

puts (10..100).cover? 42

## Question 6

famous_words = "seven years ago..."
famous_words.prepend "Four score and "
puts famous_words

famous_words = "seven years ago..."
famous_words = "Four score and " << famous_words
puts famous_words

# Note: << mutates the caller, i.e. "Four score and " in the above example

famous_words = "seven years ago..."
famous_words.insert 0, "Four score and "
puts famous_words

## Question 7

def succ(num)
  num + 1
end

zero = 0

def natural_number(int)
  number = "zero"
  int.times { number.gsub! "zero", "succ(zero)" }
  number
end

p natural_number(5)
p eval natural_number(5)

## Question 8

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
flintstones.flatten!

p flintstones

## Question 9

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p flintstones.to_a[2]
p flintstones.assoc "Barney"
