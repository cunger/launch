class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    comp = self.rank_value <=> other.rank_value
    comp = self.suit_value <=> other.suit_value if comp.zero?
    comp
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def ==(other)
    self.rank == other.rank && self.suit == other.suit
  end

  def rank_value
    case rank
    when Integer then rank
    when 'Jack'  then 11
    when 'Queen' then 12
    when 'King'  then 13
    when 'Ace'   then 14
    end
  end

  def suit_value
    case @suit
    when 'Spades'   then 1
    when 'Hearts'   then 2
    when 'Clubs'    then 3
    when 'Diamonds' then 4
    end
  end
end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @cards.empty?
    @cards.pop
  end

  def all?
    @cards.all?
  end

  def any?
    @cards.any?
  end

  private

  def reset
    @cards = RANKS.product(SUITS).map { |rank, suit| Card.new(rank, suit) }
    @cards.shuffle
  end
end

## Examples and tests

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min == Card.new(8, 'Spades')
puts cards.max == Card.new(8, 'Diamonds')

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
# p drawn
drawn.count { |card| card.rank == 5 } == 4
drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
drawn != drawn2 # Almost always.
