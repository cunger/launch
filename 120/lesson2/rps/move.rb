class Move
  OPTIONS = [:rock, :paper, :scissors, :lizard, :spock]

  attr_reader :choice

  def random
    @choice = OPTIONS.sample
  end

  def prompt
    pick = nil
    loop do
      puts "\nPlease choose your move (#{OPTIONS.join(', ')}):"
      pick = parse gets.chomp
      break unless pick.nil?
      puts "Sorry, didn't get that..."
    end
    @choice = pick
  end

  def beats?(other)
    [
      [:scissors, :paper],
      [:paper, :rock],
      [:rock, :lizard],
      [:lizard, :spock],
      [:spock, :scissors],
      [:scissors, :lizard],
      [:lizard, :paper],
      [:paper, :spock],
      [:spock, :rock],
      [:rock, :scissors]
    ].include? [choice, other.choice]
  end

  def to_s
    choice.to_s
  end

  private

  def parse(str)
    str = str.downcase
    OPTIONS.each do |option|
      is_prefix = option.to_s.start_with? str
      is_unique = OPTIONS.none? { |o| o != option && o.to_s.start_with?(str) }
      return option if is_prefix && is_unique
    end
    nil
  end
end
