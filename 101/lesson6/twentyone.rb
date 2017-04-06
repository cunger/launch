
CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
MAX = 21

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

def deal(deck, hand)
  hand << deck.pop
end

def want_to_stay?
  loop do
    print 'Do you want to hit or stay? '
    answer = gets.chomp
    return true  if answer.downcase == 'stay' || answer.downcase == 's'
    return false if answer.downcase == 'hit'  || answer.downcase == 'h'
    puts "Please type 'hit' (or 'h') or 'stay' (or 's')."
  end
end

def show(dealer_hand, player_hand, hidden = true)
  system 'clear'
  puts '----------------------------------------'
  puts "Dealer (??): #{dealer_hand[0]} ?" if hidden
  puts "Dealer (#{format('%2d', value(dealer_hand))}): #{dealer_hand.join(' ')}" if !hidden
  puts "You    (#{format('%2d', value(player_hand))}): #{player_hand.join(' ')}"
  puts '----------------------------------------'
  puts ''
end

def game_on
  deck = CARDS * 4
  deck.shuffle!

  dealer_hand = []
  player_hand = []

  2.times do
    deal(deck, player_hand)
    deal(deck, dealer_hand)
  end

  show(dealer_hand, player_hand)

  player_busted = false
  dealer_busted = false

  until want_to_stay?
    deal(deck, player_hand)
    show(dealer_hand, player_hand)
    if busted?(player_hand)
      show(dealer_hand, player_hand, false)
      puts 'BUSTED!'
      player_busted = true
      break
    end
  end

  if !player_busted
    show(dealer_hand, player_hand, false)
    sleep 1
    while value(dealer_hand) < MAX - 4 || value(dealer_hand) < value(player_hand)
      puts 'Dealer decides to hit.'
      sleep 1
      deal(deck, dealer_hand)
      show(dealer_hand, player_hand, false)
      if busted?(dealer_hand)
        puts 'BUSTED!'
        dealer_busted = true
        break
      end
    end
    puts 'Dealer decides to stay.' unless dealer_busted
  end

  puts ''
  print 'Game over. '
  case
  when player_busted
    puts 'Dealer wins.'
  when dealer_busted
    puts 'You win.'
  when value(player_hand) == value(dealer_hand)
    puts 'It\'s a tie.'
  when value(player_hand) > value(dealer_hand)
    puts 'You win.'
  when value(player_hand) < value(dealer_hand)
    puts 'Dealer wins.'
  end
end

## Let's go!

game_on
