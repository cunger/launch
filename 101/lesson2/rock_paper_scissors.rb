
VALID_CHOICES = %w(paper rock scissors lizard spock)

def map_to_valid_choice(str)
  return str if VALID_CHOICES.include? str

  VALID_CHOICES.each do |word|
    is_prefix = word.start_with? str
    is_unique = VALID_CHOICES.none? { |w| w != word && w.start_with?(str) }
    return word if is_prefix && is_unique
  end

  nil
end

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

user_points = 0
computer_points = 0

puts "----------- Rock, paper, scissors, lizard, spock ----------"
puts "Let's play! The first one who wins five times is the champ."

loop do
  puts ""

  computer_choice = VALID_CHOICES.sample

  user_choice = loop do
    print "Make a choice (#{VALID_CHOICES.join(', ')}): "
    input  = gets.chomp.strip
    choice = map_to_valid_choice input
    break choice if choice
    puts "Sorry, don't know what you mean..."
  end

  puts "You chose #{user_choice} and I chose #{computer_choice}."

  if user_choice == computer_choice
    puts "Hm... a draw. We have to do it again."
    next
  end

  if beats(user_choice, computer_choice)
    user_points += 1
    puts "D'oh! You get a point."
  else
    computer_points += 1
    puts "Ha! I get a point."
  end

  puts "(You now have #{user_points}, and I have #{computer_points}.)"

  if user_points == 5
    puts "\nTadah! You're the champ!"
    break
  elsif computer_points == 5
    puts "\nTadah! I'm the champ!"
    break
  end
end
