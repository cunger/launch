require_relative 'move'

class Player
  attr_accessor :name, :score

  def initialize
    @name  = pick_name
    @score = 0
  end

  def announce_victory
    puts "#{name} wins."
  end
end

class Computer < Player
  def choose
    Move.random
  end

  def pick_name
    ['R2D2', 'C3PO', 'Hal', 'Number 5', 'Data'].sample
  end
end

class Human < Player
  def choose
    Move.prompt
  end

  def pick_name
    str = ''
    loop do
      print "Your name: "
      str = gets.chomp.strip
      break unless str.empty?
      puts "If you don't want to tell me your name, just type something..."
    end
    str
  end

  def announce_victory
    puts "You win."
  end
end
