require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new 0
    @item_cost = 199.9

    @transaction_nothing_paid = Transaction.new @item_cost

    @transaction_all_paid = Transaction.new @item_cost
    @transaction_all_paid.amount_paid = @item_cost

    @transaction_partly_paid = Transaction.new @item_cost
    @transaction_partly_paid.amount_paid = 42.7

    @transaction_more_paid = Transaction.new @item_cost
    @transaction_more_paid.amount_paid = 200.0
  end

  def test_accept_money
    [
      @transaction_nothing_paid,
      @transaction_partly_paid,
      @transaction_all_paid,
      @transaction_more_paid
    ].each do |transaction|

       before = @cash_register.total_money
       @cash_register.accept_money transaction
       after = @cash_register.total_money

       assert_equal(before + transaction.amount_paid, after)
     end
  end

  def test_change
    assert_equal 0.1, @cash_register.change(@transaction_more_paid)
    assert_equal 0, @cash_register.change(@transaction_all_paid)
    # expected behavior for the other transactions not clear
  end

  def test_receipt
    assert_output("You've paid $#{@item_cost}.\n") do
      @cash_register.give_receipt(@transaction_more_paid)
    end
  end
end
