module TwentyOne
  SUITS = [:hearts, :spade, :clubs, :diamond]
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
  MAX   = 21

  class Card
    attr_reader   :rank, :suit
    attr_accessor :orientation

    def initialize(rank, suit, orientation=:facedown)
      @rank = rank
      @suit = suit
      @orientation = orientation
    end

    def to_s
      return '??' if @orientation == :facedown

      suit = case @suit
             when :hearts  then "♥"
             when :spade   then "♠"
             when :clubs   then "♣"
             when :diamond then "♦"
             end
      rank = @rank.to_s.capitalize
      "#{suit} #{rank}"
    end
  end

  class Deck
    def initialize
      @cards = []
      SUITS.each do |suit|
        RANKS.each do |rank|
          @cards << Card.new(rank, suit)
        end
      end
    end

    def shuffle!
      @cards.shuffle!
    end

    def deal!(player, orientation=:faceup)
      if @cards.empty?
        initialize
        shuffle!
      end
      card = @cards.pop
      card.orientation = orientation
      player << card
    end
  end

  class Hand
    def initialize
      @cards = []
    end

    def <<(card)
      @cards << card
    end

    def uncover!
      @cards.each { |card| card.orientation = :faceup }
    end

    def value
      aces   = @cards.select { |card| card.rank == :ace }
      others = @cards - aces

      sum = 0
      others.each do |card|
        case card.rank
        when :jack, :queen, :king then sum += 10
        else sum += card.rank
        end
      end

      aces.each do
        sum += sum + 11 <= MAX ? 11 : 1
      end

      sum
    end

    def to_s
      @cards.join(' ')
    end
  end
end
