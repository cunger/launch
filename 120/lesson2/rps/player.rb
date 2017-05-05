require_relative 'move'

class Player
  attr_reader   :name
  attr_accessor :score

  def initialize
    pick_name
    @score  = 0
    @memory = []
  end

  def remember(round)
    @memory << round
  end

  def announce_victory
    puts "#{name} wins."
  end
end

class Computer < Player
  def initialize(strategy)
    @strategy = strategy
    super()
  end

  def pick_name
    @name = ['R2D2', 'C3PO', 'Hal', 'Number 5', 'Data'].sample
  end

  def choose(options)
    @strategy.compute_from(options, @memory)
  end
end

class Human < Player
  def pick_name
    loop do
      print "Your name: "
      @name = gets.chomp.strip
      break unless @name.empty?
      puts "If you don't want to tell me your name, just type something..."
    end
  end

  def choose(options)
    choice = nil
    loop do
      puts "\nPlease choose your move (#{options.join(', ')}):"
      choice = Move.parse(gets.chomp, options)
      break if choice
      puts "Sorry, didn't get that..."
    end
    choice
  end

  def announce_victory
    puts "You win."
  end
end
