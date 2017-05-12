require_relative 'screen_utils'

module TTT
  class Player
    def move(board)
      square = pick_square(board)
      board[square] = marker
    end
  end

  class Human < Player
    include ScreenUtils

    MARKER = 'X'

    def marker; MARKER end

    def pick_square(board)
      options = board.valid_choices
      puts "Make a move (#{options.join(', ')}): "
      loop do
        choice = get_input.to_i
        return choice if options.include? choice
        puts "Please make a valid choice."
      end
    end
  end

  class Computer < Player
    MARKER = 'O'

    def marker; MARKER end

    def pick_square(board)
      view = board.view(MARKER)
      
      priority = view.winning_positions\
               + view.threatened_positions\
               + view.promising_positions\
               + (board[5].empty? ? [5] : [])

      priority.fetch(0, board.valid_choices.sample)
    end
  end
end
