print 'Please type one or more words: '
input = gets.chomp

number_of_chars = input.delete(' ').length

puts "There are #{number_of_chars} characters in \"#{input}\"."
