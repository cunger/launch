require_relative 'screen_utils'

class Player
  def move(board)
    square = pick_square(board)
    board.mark_at!(square, marker)
  end
end

class Human < Player
  include ScreenUtils

  MARKER = 'X'

  def marker
    MARKER
  end

  def pick_square(board)
    puts "Your choice (#{board.valid_choices.join(', ')}): "
    loop do
      choice = get_input.to_i
      return choice if board.valid_choices.include? choice
      puts "Please mke a valid choice."
    end
  end
end

class Computer < Player
  MARKER = 'O'

  def marker
    MARKER
  end

  def pick_square(board)
    board.valid_choices.sample
  end
end
