require_relative 'round'
require_relative 'player'
require_relative 'strategy'

class Game
  MOVES = [Rock.new, Paper.new, Scissors.new, Lizard.new, Spock.new]
  WINNING_SCORE = 3

  attr_reader :human, :computer, :rounds, :winner

  def initialize
    @human = Human.new
    @computer = Computer.new(Strategy::Random)
  end

  def set_to_start
    @rounds = []
    human.score = 0
    computer.score = 0
    @winner = nil
  end

  def play
    loop do
      set_to_start
      clear_screen
      display_intro

      until winner
        play_round
        @winner = human    if human.score    == WINNING_SCORE
        @winner = computer if computer.score == WINNING_SCORE
      end

      display_outro
      break unless play_again?
    end
  end

  private

  def play_round
    announce_round

    round = Round.new self
    round.play
    round.freeze

    display_scores

    rounds << round
    human.remember round
    computer.remember round
  end

  def clear_screen
    system 'clear' or system 'cls'
  end

  def display_intro
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

  def display_outro
    puts "\n----------------------------"
    winner.announce_victory
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
