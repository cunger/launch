
CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
MAX = 21

def deal(deck, hand)
  hand << deck.pop
end

def value(hand)
  aces   = hand.select { |card| card == :ace }
  others = hand - aces

  sum = 0
  others.each do |card|
    case card
    when :jack, :queen, :king then sum += 10
    else sum += card
    end
  end

  aces.each do
    sum += sum + 11 <= MAX ? 11 : 1
  end

  sum
end

def busted?(hand)
  value(hand) > MAX
end

def want_to?(prompt_msg, trues, falses, error_msg)
  loop do
    print prompt_msg + ' '
    answer = gets.chomp
    return true  if trues.include? answer.downcase
    return false if falses.include? answer.downcase
    puts error_msg
  end
end

def want_to_stay?
  want_to?('Do you want to hit or stay?',
           %w(stay s),
           %w(hit h),
           "Please type 'hit' (or 'h') or 'stay' (or 's').")
end

def want_to_play_again?
  puts ''
  want_to?('Do you want to play again?',
           %w(yes y),
           %w(no n),
           "Please type 'yes' (or 'y') or 'no' (or 'n').")
end

def show_value(hand, hidden = false)
  hidden ? '??' : format('%2d', value(hand))
end

def show_hand(hand, hidden = false)
  hidden ? "#{hand[0]} ?" : hand.join(' ')
end

def show_state(dealer_hand, player_hand, hidden = true)
  dealer_value = show_value(dealer_hand, hidden)
  player_value = show_value(player_hand)
  system('clear') || system('cls')
  puts '-----------------------------------'
  puts "Dealer (#{dealer_value}): #{show_hand(dealer_hand, hidden)}"
  puts "You    (#{player_value}): #{show_hand(player_hand)}"
  puts '-----------------------------------'
  puts ''
end

def players_turn(deck, dealer_hand, player_hand)
  loop do
    break if want_to_stay?
    deal(deck, player_hand)
    show_state(dealer_hand, player_hand)
    break if busted?(player_hand)
  end
  value(player_hand)
end

def dealers_turn(deck, dealer_hand, player_hand)
  loop do
    if value(dealer_hand) < MAX - 4 || value(dealer_hand) < value(player_hand)
      puts 'Dealer decides to hit.'
      sleep 1
      deal(deck, dealer_hand)
      show_state(dealer_hand, player_hand, false)
      break if busted?(dealer_hand)
    else
      puts 'Dealer decides to stay.'
      sleep 1
      break
    end
  end
  value(dealer_hand)
end

def announce_winner(dealer_hand, player_hand)
  puts ''
  case value(player_hand) <=> value(dealer_hand)
  when  0 then puts 'It\'s a tie.'
  when  1 then puts 'You win.'
  when -1 then puts 'Dealer wins.'
  end
end

def game_on
  # Set up game

  deck = CARDS * 4
  deck.shuffle!

  dealer_hand = []
  player_hand = []

  2.times do
    deal(deck, player_hand)
    deal(deck, dealer_hand)
  end

  show_state(dealer_hand, player_hand)

  # Player's turn

  player_score = players_turn(deck, dealer_hand, player_hand)

  show_state(dealer_hand, player_hand, false)

  if player_score > MAX
    puts 'BUSTED!'
    puts 'Dealer wins.'
    return
  end

  # Dealer's turn

  dealer_score = dealers_turn(deck, dealer_hand, player_hand)

  if dealer_score > MAX
    puts 'BUSTED!'
    puts 'You win.'
    return
  end

  # Game over!

  announce_winner(dealer_hand, player_hand)
end

## Game on!

loop do
  game_on
  break unless want_to_play_again?
end
