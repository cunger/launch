class Board
  WINNING_CONFIGURATIONS = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
    [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
    [1, 5, 9], [3, 5, 7]             # diagonals
  ]

  def initialize
    @squares = {}
    (1..9).each { |i| @squares[i] = Square.new }
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

  def mark_at!(index, marker)
    @squares[index] = marker
  end

  def full?
    @squares.none? { |_, square| square.empty? }
  end

  def winner?(marker)
    view = @squares.select { |_, s| s == marker }
    WINNING_CONFIGURATIONS.any? do |squares|
      squares.all? do |square|
        view.include? square
      end
    end
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
