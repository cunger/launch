require 'io/console'
require_relative 'expenses'

class CLI
  def initialize
    @expenses = Expenses.new
  end

  def dispatch(args)
    case ARGV[0]
    when 'list'
      puts expenses.list
    when 'add'
      amount = read_float ARGV[1]
      memo   = read_str ARGV[2..-1]
      if amount && memo
        expenses.add(amount, memo)
        puts "+ #{amount} '#{memo}'"
      else
        puts 'Please provide an amount and memo.'
      end
    when 'delete'
      id = read_str ARGV[1..-1]
      if id
        deleted = expenses.delete(id)
        if deleted
          puts "The following expense has been deleted:\n"
          puts deleted
        else
          puts "There is no expense with id '#{id}'."
        end
      else
        puts 'Please provide the id of the expense you want to delete.'
      end
    when 'search'
      term = read_str ARGV[1..-1]
      if term
        puts expenses.search(term)
      else
        puts expenses.help_search
      end
    when 'clear'
      puts "This will delete all expenses. Are you sure? (Press 'y' to proceed.)"
      char = $stdin.getch
      if char == 'y'
        expenses.delete_all
        puts "All expenses were deleted."
      end
    else
      puts HELP
    end
  end

  private

  attr_reader :expenses

  def read_float(string)
    return nil if string.nil?
    Float string
  rescue ArgumentError
    nil
  end

  def read_str(strings)
    return nil if strings.nil?
    strings.join(' ')
  end

  HELP = <<~HEREDOC
  An expense recording system

  Commands:

  add AMOUNT MEMO - record a new expense
  clear - delete all expenses
  list - list all expenses
  delete NUMBER - remove expense with id NUMBER
  search QUERY - list expenses with a matching memo field
  HEREDOC
end
