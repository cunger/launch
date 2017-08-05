class Triangle
  attr_reader :rows

  def initialize(num)
    @rows = compute_rows.first(num)
  end

  private

  def compute_rows
    Enumerator.new do |yielder|
      # First row
      row = [1]
      yielder << row
      # Second row
      row = [1, 1]
      yielder << row
      # All other rows
      loop do
        row = [1] + row.each_cons(2).to_a.map(&:sum) + [1]
        yielder << row
      end
    end
  end
end
