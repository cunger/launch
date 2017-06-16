class CashRegister
  attr_reader :total_money

  def initialize(total_money)
    @total_money = total_money
  end

  def change(transaction)
    (transaction.amount_paid - transaction.item_cost).round(2)
  end

  def give_receipt(transaction)
    puts "You've paid $#{transaction.item_cost}."
  end

  def accept_money(transaction)
    @total_money += transaction.amount_paid
  end

  def start_transaction(transaction)
    transaction.prompt_for_payment
    accept_money(transaction)
    change(transaction)
    give_receipt(transaction)
  end
end
