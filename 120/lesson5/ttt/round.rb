require_relative 'board'
require_relative 'screen_utils'

class Round
  include ScreenUtils

  attr_reader :winner

  def initialize(game)
    @game = game
    @board = Board.new
    @winner = nil
  end

  def play
    gameover = false

    loop do
      clear_screen
      @board.display

      break if gameover

      [@game.human, @game.computer].each do |player|
        player.move @board
        @winner = player if @board.winner?(player.marker)
        gameover = true  if @winner || @board.full?
      end
    end

    announce_winner
  end

  private

  def announce_winner
    case @winner
    when Human    then puts "You win!"
    when Computer then puts "I win!"
    else               puts "It's a tie!"
    end
  end
end
