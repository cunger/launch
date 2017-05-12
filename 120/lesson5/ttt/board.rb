module TTT
  class Board
    def initialize
      @squares = {}
      (1..9).each { |i| @squares[i] = Square.new }
    end

    def [](index)
      @squares[index]
    end

    def []=(index, marker)
      @squares[index].mark! marker
    end

    def display
      puts "     |     |"
      puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]} "
      puts "     |     |"
      puts "-----+-----+-----"
      puts "     |     |"
      puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]} "
      puts "     |     |"
      puts "-----+-----+-----"
      puts "     |     |"
      puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]} "
      puts "     |     |"
    end

    def valid_choices
      empty_squares = @squares.select { |_, square| square.empty? }
      empty_squares.keys
    end

    def full?
      @squares.none? { |_, square| square.empty? }
    end

    def view(marker)
      View.new(self, marker)
    end
  end

  class Square
    EMPTY_MARKER = ' '

    attr_reader :marker

    def initialize
      @marker = EMPTY_MARKER
    end

    def mark!(str)
      @marker = str
    end

    def empty?
      @marker == EMPTY_MARKER
    end

    def to_s
      @marker
    end
  end

  class View
    WINNING_CONFIGURATIONS = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
      [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
      [1, 5, 9], [3, 5, 7]             # diagonals
    ]

    attr_reader :threatened_positions,
                :winning_positions,
                :promising_positions

    def initialize(board, marker)
      @board  = board
      @marker = marker
      @winning_positions    = []
      @promising_positions  = []
      @threatened_positions = []
      calculate
    end

    def winner?
      WINNING_CONFIGURATIONS.any? { |config|
        config.all? { |index| @board[index].marker == @marker }
      }
    end

    private

    def calculate
      WINNING_CONFIGURATIONS.each do |config|
        filled = config.select { |index| @board[index] == @marker }
        other  = config.select { |index| @board[index] != @marker }
        empty  = config.select { |index| @board[index].empty? }
        case
        when filled.size == 2 && empty.size == 1
          @winning_positions << empty.first
        when filled.size == 1 && empty.size == 2
          @promising_positions << empty.first
        when other.size == 2 && empty.size == 1
          @threatened_positions << empty.first
        end
      end
    end
  end
end
