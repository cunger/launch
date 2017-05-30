require_relative 'cards'
require_relative 'player'

module TwentyOne
  class Game
    attr_reader :player, :dealer

    def initialize
      @player = Human.new
      @dealer = Dealer.new
    end

    def play
      loop do
        Round.new(@player, @dealer).play
        break unless @player.play_again?
      end
    end
  end

  class Round
    def initialize(player, dealer)
      @player = player
      @dealer = dealer
      @hide_dealer = true
    end

    def play
      setup

      turn(@player)

      @dealer.hand.uncover!
      @hide_dealer = false

      turn(@dealer, @player.value) unless @player.busted?

      show_state
      announce_result
    end

    private

    def setup
      @player.empty_hand
      @dealer.empty_hand

      @deck = Deck.new

      @deck.deal!(@player, :faceup)
      @deck.deal!(@dealer, :faceup)
      @deck.deal!(@player, :faceup)
      @deck.deal!(@dealer, :facedown)
    end

    def turn(player, opponent_value = nil)
      loop do
        show_state
        break if player.stay?(opponent_value)
        @deck.deal! player
        show_state
        break if player.busted?
      end
    end

    def show_state
      clear_screen
      dealer_value = @hide_dealer ? '??' : format('%2d', @dealer.value)
      player_value = format('%2d', @player.value)
      puts '----------------------------------------------'
      puts "Dealer (#{dealer_value}): #{@dealer.hand}"
      puts "You    (#{player_value}): #{@player.hand}"
      puts '----------------------------------------------'
      puts ''
    end

    def announce_result
      if @player.busted?
        puts 'You busted! I win.'
      elsif @dealer.busted?
        puts 'I busted! You win.'
      else
        case @player.value <=> @dealer.value
        when -1 then puts 'I win.'
        when  1 then puts 'You win.'
        when  0 then puts 'This is a tie.'
        end
      end
    end

    def clear_screen
      system('clear') || system('cls')
    end
  end
end
