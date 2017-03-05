
# Input:
# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration

# Output:
# monthly interest rate
# loan duration in months

def ask(message)
  loop do
    print message
    input = gets.chomp.strip
    num = Float(input) rescue nil
    break num unless num.nil?
    puts "Hmm... I don't understand. Please make sure your input is numerical."
  end
end

## Main

puts "==== Loan calculator ===="

loop do
  puts ""

  loan_amount = ask "Loan amount: "
  loan_duration = ask "Loan duration (in months): "
  apr = ask "Annual Percentage Rate (in percent): "
  apr /= 100

  monthly_interest_rate = apr / 12
  monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-loan_duration))

  puts "--> Monthly payment: #{format('%.2f', monthly_payment)}"

  puts "\nDo you want to calculate another loan? (y/n)"
  answer = gets.chomp.strip
  break if answer == "n"
end

puts "\nLive long and prosper!"
