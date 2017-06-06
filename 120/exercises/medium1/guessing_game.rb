
class GuessingGame
  def initialize(min=1, max=100)
    @range   = (min..max)
    @guesses = Math.log2(@range.size).to_i + 1
    @number  = nil
  end

  def reset
    @number = rand(@range)
  end

  def play
    reset
    show_intro

    guess = nil
    @guesses.downto(1) do |n|
      show_remaining_guesses(n)
      guess = prompt_guess

      break if guess == @number

      result = :too_low  if guess < @number
      result = :too_high if guess > @number
      show_result(result)
    end

    show_outro(win: guess == @number)
  end

  private

  def show_remaining_guesses(n)
    if n == 1
      puts "You have only one guess remaining."
    else
      puts "You have #{n} guesses remaining."
    end
  end

  def prompt_guess
    guess  = 0
    wanted = "a number between #{@range.first} and #{@range.last}"
    loop do
      print "Please enter #{wanted}: "
      guess = gets.chomp.to_i
      break if @range.cover? guess
      puts "Sorry, that is not #{wanted}..."
    end
    guess
  end

  def show_intro
    puts "\n---- New game, new luck! ----\n\n"
  end

  def show_result(result)
    msg = { too_low:  "Too low.",
            too_high: "Too high." }[result]
    puts ""
    puts msg
  end

  def show_outro(outcome={ win: false })
    puts ""
    if outcome[:win]
      puts "You win. Congratulations!"
    else
      puts "Sorry, you're out of guesses..."
      puts "The number was: #{@number}"
    end
  end
end

##

game = GuessingGame.new
game.play

game = GuessingGame.new(501, 1500)
game.play
