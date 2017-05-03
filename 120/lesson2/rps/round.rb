require 'pry'

class Round
  private

  attr_reader :game, :human_move, :computer_move, :winner

  public

  def initialize(game)
    @game = game
  end

  def play
    @human_move = game.human.choose
    @computer_move = game.computer.choose
    display_choices

    @winner = determine_winner
    if winner
      winner.score += 1
      winner.announce_victory
    else
      puts "It's a tie."
    end
  end

  private

  def determine_winner
    return game.human    if human_move.beats?(computer_move)
    return game.computer if computer_move.beats?(human_move)
    nil
  end

  def display_choices
    puts ""
    puts "You chose #{human_move}."
    puts "#{game.computer.name} chose #{computer_move}."
  end
end
