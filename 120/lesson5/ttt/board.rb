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
    CONFIGURATIONS = [
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
      CONFIGURATIONS.any? do |config|
        config.all? do |index|
          @board[index].marker == @marker
        end
      end
    end

    private

    def calculate
      CONFIGURATIONS.each do |config|
        empty_squares = config.select { |index| @board[index].empty? }

        next if empty_squares.empty?

        empty_square = empty_squares.first
        if number_other(config) == 2
          @threatened_positions << empty_square
        elsif number_owned(config) == 2
          @winning_positions    << empty_square
        elsif number_owned(config) == 1 && empty_squares.size == 2
          @promising_positions  << empty_square
        end
      end
    end

    def number_owned(config)
      config.count { |i| @board[i].marker == @marker }
    end

    def number_other(config)
      config.count { |i| @board[i].marker != @marker && !@board[i].empty? }
    end
  end
end
