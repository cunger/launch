require_relative 'move'

class Player
  attr_reader :name, :move

  def initialize
    self.name = pick_name
    self.move = Move.new
  end

  private

  attr_writer :name, :move
end

class Computer < Player
  def choose
    move.random
  end

  def pick_name
    ['R2D2', 'C3PO', 'Hal', 'Number 5', 'Data'].sample
  end
end

class Human < Player
  def choose
    move.prompt
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
end
