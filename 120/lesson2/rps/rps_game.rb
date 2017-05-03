require_relative 'player'
require_relative 'round'

class RPSGame
  WINNING_SCORE = 3

  attr_reader :human, :computer, :rounds

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def reset
    @rounds = []
    human.score = 0
    computer.score = 0
    clear_screen
  end

  def play
    loop do
      reset
      intro

      winner = nil
      until winner
        announce_round

        round = Round.new self
        round.play
        rounds << round

        display_scores

        winner = human    if human.score    == WINNING_SCORE
        winner = computer if computer.score == WINNING_SCORE
      end
      puts "\n----------------------------"
      winner.announce_victory

      break unless play_again?
    end

    outro
  end

  private

  def clear_screen
    system 'clear' or system 'cls'
  end

  def intro
    msg1 = "Rock Paper Scissors Lizard Spock"
    msg2 = "#{human.name} vs #{computer.name}"
    msg3 = "First to #{WINNING_SCORE} wins!"
    line = '-' * [msg1.length, msg2.length, msg3.length].max

    puts ''
    puts line
    puts msg1
    puts msg2
    puts msg3
    puts line
  end

  def announce_round
    puts "\n---- Round #{rounds.size + 1}"
  end

  def display_scores
    puts ""
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
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

  def outro
    puts "\nThanks for playing."
  end
end
