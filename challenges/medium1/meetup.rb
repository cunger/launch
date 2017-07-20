require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year  = year
  end

  ## Input:
  # weekday  ::= :monday | :tuesday | ...
  # schedule ::= :first | :second | :third | :fourth | :last | :teenth
  ## Output:
  # Date
  def day(weekday, schedule)
    start = Date.new(@year, @month, 1)
    limit = start.next_month
    days  = select (start...limit), to_method_sym(weekday)

    case schedule
    when :first  then days[0]
    when :second then days[1]
    when :third  then days[2]
    when :fourth then days[3]
    when :last   then days[-1]
    when :teenth then first(days) { |d| (13..19).cover? d.day }
    end
  end

  private

  def to_method_sym(weekday)
    (weekday.to_s + '?').to_sym
  end

  def select(collection, method_sym)
    collection.select { |element| element.send method_sym }
  end

  def first(collection)
    collection.each do |element|
      return element if yield element
    end
    nil
  end
end
