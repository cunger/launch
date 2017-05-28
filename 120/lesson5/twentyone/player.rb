module TwentyOne
  class Player
    attr_reader :hand, :value

    def initialize
      empty_hand
    end

    def empty_hand
      @hand  = Hand.new
      @value = hand.value
    end

    def <<(card)
      @hand << card
      @value = hand.value
    end

    def busted?
      @value > MAX
    end
  end

  class Dealer < Player
    def stay?(opponent_value)
      value >= MAX - 4 || value > opponent_value
    end
  end

  class Human < Player
    def stay?(_)
      want_to?('Do you want to hit or stay?',
               %w(stay s),
               %w(hit h),
               "Please type 'hit' (or 'h') or 'stay' (or 's').")
    end

    def play_again?
      want_to?('Do you want to play again?',
               %w(yes y),
               %w(no n),
               "Please type 'yes' (or 'y') or 'no' (or 'n').")
    end

    private

    def want_to?(prompt_msg, trues, falses, error_msg)
      loop do
        print prompt_msg + ' '
        answer = gets.chomp
        return true  if trues.include? answer.downcase
        return false if falses.include? answer.downcase
        puts error_msg
      end
    end
  end
end
