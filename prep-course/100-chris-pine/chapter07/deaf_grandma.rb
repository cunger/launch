
consecutive_byes = 0
last_input = ''

input = gets.chomp

loop do

  if input == 'BYE'
    if last_input == 'BYE'
      consecutive_byes += 1
    else
      consecutive_byes = 1
    end
  else
    consecutive_byes = 0
  end

  break if consecutive_byes == 3

  if input == input.upcase
    year = 1930 + rand(21)
    puts 'NO, NOT SINCE ' + year.to_s + '!'
  else
    puts 'HUH?! SPEAK UP, SONNY!'
  end

  last_input = input
  input = gets.chomp
end

puts 'AH, WELL. NICE TALKING TO YOU!'
