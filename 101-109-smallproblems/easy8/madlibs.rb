
STORY_TEMPLATES = [
  "Do you %{verb} your %{adjective} %{noun} %{adverb}? That's hilarious!",
  "I %{adverb} heard you %{verb} your %{adjective} %{noun}. Aha!"
]

def prompt(message)
  print message
  gets.chomp.strip
end

noun = prompt('Enter a noun: ')
verb = prompt('Enter a verb: ')
adjective = prompt('Enter an adjective: ')
adverb = prompt('Enter an adverb: ')

story = STORY_TEMPLATES.sample % { noun: noun, verb: verb, adjective: adjective, adverb: adverb }

puts story
