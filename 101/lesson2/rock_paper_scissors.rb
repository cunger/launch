
valid_choices = %w(paper rock scissors lizard spock)

def beats(one_choice, other_choice)
  [
    %w(scissors paper),
    %w(paper rock),
    %w(rock lizard),
    %w(lizard spock),
    %w(spock scissors),
    %w(scissors lizard),
    %w(lizard paper),
    %w(paper spock),
    %w(spock rock),
    %w(rock scissors)
  ].include? [one_choice, other_choice]
end

loop do
  computer_choice = valid_choices.sample

  user_choice = loop do
    print "Make a choice (#{valid_choices.join(', ')}): "
    input = gets.chomp.strip
    break input if valid_choices.include? input
  end

  puts "You chose #{user_choice} and I chose #{computer_choice}."

  if user_choice == computer_choice
    puts "Hm... a draw. We have to do it again."
    next
  end

  if beats(user_choice, computer_choice)
    puts "D'oh! You win."
  else
    puts "Ha! I win."
  end

  print "Wanna play again? (y/n) "
  break if gets.chomp == "n"
end
