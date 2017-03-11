## Question 1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.key? "Spot"
# Alternatives:
p ages.include? "Spot"
p ages.member? "Spot"
# However, include? and member? don't use == to test equality.

## Question 2

munsters_description = "The Munsters are creepy in a good way."

p munsters_description.downcase.capitalize == "The munsters are creepy in a good way."
p munsters_description.swapcase == "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
p munsters_description.downcase == "the munsters are creepy in a good way."
p munsters_description.upcase == "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

## Question 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge! additional_ages

p ages

## Question 4

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.match? "Dino"

## Question 5 + 6

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"

p flintstones

## Question 7

flintstones = %w(Fred Barney Wilma Betty)
flintstones.push('BamBam').push('Pebbles')
flintstones.concat %w(Dino Hoppy)

p flintstones

## Question 8

advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(/(?<keep>.*)house/, "keep")
p advice

advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0, advice.index("house"))
p advice

## Question 9

statement = "The Flintstones Rock!"
p statement.count 't'

## Question 10

title = "Flintstone Family Members"
p title.center(40)
