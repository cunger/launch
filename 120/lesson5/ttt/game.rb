require_relative 'round'
require_relative 'player'
require_relative 'screen_utils'

class Game
  include ScreenUtils

  attr_reader :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    loop do
      action = menu
      case action
      when :exit then exit
      when :start
        round = Round.new self
        round.play
        puts "\nPress any key to continue."
        gets
      end
    end

    outro
  end

  private

  def menu
    loop do
      clear_screen
      display_intro
      display_options
      case get_input
      when 's' then return :start
      when 'e' then return :exit
      end
    end
  end

  def display_intro
    puts "---------------"
    puts "  Tic Tac Toe  "
    puts "---------------"
  end

  def display_options
    puts ""
    puts "(S)tart new game"
    puts "(E)xit"
    puts ""
  end

  def outro
    puts "Thanks for playing!"
  end
end
