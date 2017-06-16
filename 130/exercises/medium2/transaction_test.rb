require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'transaction'

class TransactionTest < Minitest::Test

  def test_paying_enough
    transaction = Transaction.new 199.0
    input  = StringIO.new("200\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 200, transaction.amount_paid
  end

  def test_paying_too_little
    transaction = Transaction.new 199.0
    input  = StringIO.new("10\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_match(/That is not the correct amount/, output.string)
  end
end
