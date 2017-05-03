class Move
  def to_s
    self.class.to_s.downcase
  end

  def self.random
    options.sample
  end

  def self.prompt
    choices = options
    loop do
      puts "\nPlease choose your move (#{choices.join(', ')}):"
      choice = parse gets.chomp, choices
      return choice if choice
      puts "Sorry, didn't get that..."
    end
  end

  class << self
    private

    def options
      [Rock.new, Paper.new, Scissors.new, Lizard.new, Spock.new]
    end

    def parse(str, choices)
      str = str.downcase
      choices.each do |choice|
        is_substr = choice.to_s.start_with? str
        is_unique = choices.none? { |c| c != choice && c.to_s.start_with?(str) }
        return choice if is_substr && is_unique
      end
      nil
    end
  end
end

class Rock < Move
  def beats?(move)
    [Lizard, Spock].include? move.class
  end
end

class Paper < Move
  def beats?(move)
    [Rock, Spock].include? move.class
  end
end

class Scissors < Move
  def beats?(move)
    [Paper, Lizard].include? move.class
  end
end

class Lizard < Move
  def beats?(move)
    [Spock, Paper].include? move.class
  end
end

class Spock < Move
  def beats?(move)
    [Scissors, Rock].include? move.class
  end
end
