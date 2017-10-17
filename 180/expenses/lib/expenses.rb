require 'pg'

class Expenses
  def initialize
    @data = PG.connect(dbname: 'expenses')
    setup_schema
  end

  def list
    show_as_table all_expenses
  end

  def search(string)
    show_as_table expenses_like(string)
  end

  def add(amount, memo)
    add_expense amount, memo
  end

  def delete(id)
    e = get_expense id
    return nil if e.values.empty?
    delete_expense id
    show_as_table result
  end

  def delete_all
    delete_all_expenses
  end

  private

  attr_reader :data

  def setup_schema
    count = data.exec "SELECT COUNT(*) AS c FROM information_schema.tables \
                       WHERE table_schema = 'public' AND table_name = 'expenses';"
    if count.field_values("c")[0] == "0"
      data.exec File.read('data/schema.sql')
    end
  end

  def add_expense(amount, memo)
    query = "INSERT INTO expenses (amount, memo) VALUES ($1, $2);"
    data.exec_params(query, [amount, memo])
  end

  def get_expense(id)
    query = "SELECT * FROM expenses WHERE id = $1;"
    result = data.exec_params(query, [id])
  end

  def delete_expense(id)
    query = "DELETE FROM expenses WHERE id = $1;"
    data.exec_params(query, [id])
  end

  def delete_all_expenses
    data.exec "DELETE FROM expenses;"
  end

  def all_expenses
    data.exec "SELECT * FROM expenses ORDER BY created_on DESC;"
  end

  def total
    data.exec "SELECT SUM(amount) FROM expenses;"
  end

  def expenses_like(string)
    query = "SELECT * FROM expenses WHERE memo ILIKE $1 ORDER BY created_on DESC;"
    data.exec_params(query, ["%#{string}%"])
  end

  def show_as_table(results)
    return 'There are no expenses.' if results.values.empty?

    table  = " ID |    Date    |    Amount     |      Memo        \n"
    table += "----+------------+---------------+------------------\n"
    results.each do |result|
      table += " %2s | %10s | %13s | %s " % [ result['id'],
                                              result['created_on'],
                                              result['amount'],
                                              result['memo'] ]
      table += "\n"
    end
    total = results.field_values('amount').map(&:to_f).sum.to_s
    table += "----------------------------------------------------\n"
    table += "Total:             %13s " % total
    table
  end
end
