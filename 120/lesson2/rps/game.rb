require_relative 'player'

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    intro
    loop do
      human.choose
      computer.choose
      announce_winner
      break unless play_again?
    end
    outro
  end

  def intro
    msg  = "Welcome #{human.name}! You're playing against #{computer.name}."
    line = '-' * msg.length

    puts ''
    puts line
    puts msg
    puts line
  end

  def outro
    puts "\nThanks for playing."
  end

  def announce_winner
    puts "\nYou chose #{human.move} and #{computer.name} chose #{computer.move}."

    if human.move.beats? computer.move
      puts "--> You win."
    elsif computer.move.beats? human.move
      puts "--> #{computer.name} wins."
    else
      puts "--> It's a tie."
    end
  end

  def play_again?
    puts ""
    loop do
      print "Would you like to play again? (y/n) "
      answer = gets.chomp.strip.downcase
      return true  if %(yes y).include? answer
      return false if %(no n).include? answer
    end
  end
end
