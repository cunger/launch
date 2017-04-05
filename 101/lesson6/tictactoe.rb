require 'pry'

EMPTY_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_CONFIGURATIONS = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
  [1, 5, 9], [3, 5, 7]             # diagonals
]

def init_board
  board = {}
  (1..9).each { |i| board[i] = EMPTY_MARKER }
  board
end

# rubocop:disable Metrics/AbcSize
def display_board(board)
  system "clear"
  puts ""
  puts "     |     |"
  puts "  " + board[1] + "  |  " + board[2] + "  |  " + board[3]
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  " + board[4] + "  |  " + board[5] + "  |  " + board[6]
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  " + board[7] + "  |  " + board[8] + "  |  " + board[9]
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def join(arr, separator = ',', last_separator = 'or')
  str = ''
  arr.each_with_index do |a, index|
    if index.zero?
      str += a.to_s
    elsif index == arr.size - 1
      str += ' ' + last_separator + ' ' + a.to_s
    else
      str += separator + ' ' + a.to_s
    end
  end
  str
end

def empty_squares(board)
  board.keys.select { |square| board[square] == EMPTY_MARKER }
end

def valid_turn?(square, board)
  empty_squares(board).include? square
end

def board_full?(board)
  empty_squares(board).empty?
end

def turn!(who, board)
  case who
  when :player
    player_turn!(board)
  when :computer
    computer_turn!(board)
  end
end

def player_turn!(board)
  loop do
    puts "Choose a square (#{join(empty_squares(board))}): "
    square = gets.chomp.to_i
    if valid_turn?(square, board)
      board[square] = PLAYER_MARKER
      break
    else
      puts "Sorry, that's not a valid choice."
    end
  end
end

def computer_turn!(board)
  one_missing = []
  two_missing = []
  threatened  = []
  WINNING_CONFIGURATIONS.each do |squares|
    computer = squares.select { |square| board[square] == COMPUTER_MARKER }
    player   = squares.select { |square| board[square] == PLAYER_MARKER }
    empty    = squares.select { |square| board[square] == EMPTY_MARKER }
    if computer.size == 2 && empty.size == 1
      one_missing << empty.first
    elsif computer.size == 1 && empty.size == 2
      two_missing << empty.sample
    elsif player.size == 2 && empty.size == 1
      threatened << empty.first
    end
  end
  five = board[5] == EMPTY_MARKER ? [5] : []

  priority_squares = one_missing + threatened + five + two_missing

  square = priority_squares.fetch(0, empty_squares(board).sample)
  board[square] = COMPUTER_MARKER
end

def winner?(marker, board)
  view = board.select { |_, value| value == marker }
  WINNING_CONFIGURATIONS.any? do |squares|
    squares.all? do |square|
      view.include? square
    end
  end
end

def ask_play_again(player_won, computer_won)
  puts "The score is: you #{player_won}, me #{computer_won}. (First to 5 wins a beer!)"
  puts ""
  loop do
    puts "Do you want to play again? (y/n)"
    answer = gets.chomp
    return true  if answer.downcase == 'y'
    return false if answer.downcase == 'n'
    puts "Hm, not sure. I was expecting 'y' or 'n'..."
  end
end

## GAME ON!

def game_on(first = :player)

  player_won = 0
  computer_won = 0

  # Game loop
  loop do
    board = init_board
    current = first

    # Turn loop
    loop do
      display_board(board)

      turn!(current, board)

      if winner?(PLAYER_MARKER, board)
        display_board(board)
        player_won += 1
        puts "Congratulations, you won!"
        break
      end

      if winner?(COMPUTER_MARKER, board)
        display_board(board)
        computer_won += 1
        puts "I won!"
        break
      end

      if board_full?(board)
        display_board(board)
        puts "Narf, it's a tie."
        break
      end

      current = current == :player ? :computer : :player
    end

    # 5 wins anyone?
    if player_won == 5
      puts "You won 5 times. You get a beer! Cheers!"
      break
    end
    if computer_won == 5
      puts "Game over! I've won 5 times. I get a beer! Cheers!"
      break
    end

    # Play again?
    another_one = ask_play_again(player_won, computer_won)
    break if !another_one
  end

  puts ""
  puts "Thanks for playing!"
end

game_on
