class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(num)
    sum_of_multiples(num)
  end

  def self.to(num)
    new(3, 5).sum_of_multiples(num)
  end

  def sum_of_multiples(limit)
    (1...limit).select { |n| @factors.any? { |f| (n % f).zero? } }
               .reduce(0, :+)
  end
end
