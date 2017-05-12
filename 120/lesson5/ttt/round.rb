require_relative 'board'
require_relative 'screen_utils'

module TTT
  class Round
    include ScreenUtils

    attr_reader :winner

    def initialize(game)
      @game   = game
      @board  = Board.new
      @winner = nil
    end

    def play
      loop do
        refresh_screen

        make_move @game.human
        break if @winner || @board.full?

        make_move @game.computer
        break if @winner || @board.full?
      end

      refresh_screen
      announce_winner
    end

    private

    def refresh_screen
      clear_screen
      puts ""
      display_info
      puts ""
      @board.display
      puts ""
    end

    def display_info
      puts "You: #{@game.human.marker}"
      puts "Me:  #{@game.computer.marker}"
    end

    def make_move(player)
      player.move @board
      @winner = player if @board.view(player.marker).winner?
    end

    def announce_winner
      case @winner
      when Human    then puts "You win!"
      when Computer then puts "I win!"
      else               puts "It's a tie!"
      end
      puts "Again." if again?
    end

    def again?
      !@game.rounds.empty? && @game.rounds.last.winner == @winner
    end
  end
end
