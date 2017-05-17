require_relative 'cards'
require_relative 'player'

module TwentyOne

  class Game
    attr_reader :player, :dealer

    def initialize
      @player = Human.new
      @dealer = Dealer.new
      @rounds = []
    end

    def play
      loop do
        round = Round.new(@player, @dealer)
        round.play
        round.freeze
        @rounds << round
        break unless @player.play_again?
      end
    end
  end

  class Round
    def initialize(player, dealer)
      @player = player
      @dealer = dealer
      @deck = Deck.new
      @hide_dealer = true
    end

    def play
      setup

      turn(@player)

      @dealer.hand.uncover!
      @hide_dealer = false

      turn(@dealer, @player.value) unless @player.busted?

      announce_result
    end

    private

    def setup
      @player.init_hand
      @dealer.init_hand

      @deck.shuffle!

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
      puts '-----------------------------------'
      puts "Dealer (#{dealer_value}): #{@dealer.hand}"
      puts "You    (#{player_value}): #{@player.hand}"
      puts '-----------------------------------'
      puts ''
    end

    def announce_result
      case
      when @player.busted?
        puts 'You busted!'
        puts 'I win.'
      when @dealer.busted?
        puts 'I busted!'
        puts 'You win.'
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
