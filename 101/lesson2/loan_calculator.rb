
# Input:
# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration

# Output:
# loan duration in months

def ask(message)
  print message
  gets.chomp.strip
end

def get_float(message)
  loop do
    input = ask message
    float = Float(input) rescue nil
    break float unless float.nil?
    puts "Hmm... I don't understand. Please make sure your input is numerical."
  end
end

## Main

puts "==== Loan calculator ===="

loop do
  puts ""

  loan_amount = get_float "Loan amount: "
  loan_duration = get_float "Loan duration (in months): "
  apr = get_float "Annual Percentage Rate (in percent): "
  apr /= 100

  monthly_interest_rate = apr / 12
  monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-loan_duration))

  puts "--> Monthly payment: #{format('%.2f', monthly_payment)}"

  answer = ask "\nDo you want to calculate another loan? (y/n) "
  break if answer == "n"
end

puts "\nLive long and prosper!"
