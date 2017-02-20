
firstTime = true
enough = false

until enough

  lines = nil

  loop do
    puts "That was fun!" unless firstTime
    puts "How many output lines do you want? Enter a number >= 3 or 'q' to quit:"
    answer = gets.chomp

    if answer.downcase == "q"
      enough = true
      break
    end

    lines = answer.to_i
    break if lines >= 3
    puts "That's not enough lines."
  end

  lines.times { puts "Launch!" }
  firstTime = false
end
