
# Full name greeting

def get(prompt)
  puts prompt
  gets.chomp
end

first_name = get("What's your first name?")
middle_name = get("What's your middle name? (If you don't have any, just hit Enter.)")
last_name = get("And what's your last name?")

full_name = [first_name, middle_name, last_name].join(" ").gsub(/\s+/," ").strip
full_name = "Nameless Stranger" if full_name == " "

puts "Hello #{full_name}! Nice to meet you."

def letter_length(str)
  str.gsub(/\s+/,"").strip.length
end

number_of_letters = letter_length(first_name) + letter_length(middle_name) + letter_length(last_name)

puts "By the way, did you know your name has #{number_of_letters} letters?"
