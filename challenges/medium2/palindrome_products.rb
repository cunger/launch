class Palindromes
  attr_reader :largest, :smallest

  def initialize(options)
    @max_factor = options[:max_factor]
    @min_factor = options[:min_factor] || 1
  end

  def generate
    upper_bound = @max_factor * @max_factor
    lower_bound = @min_factor * @min_factor

    @largest  = find_first_palindrome_in upper_bound.downto(1)
    @smallest = find_first_palindrome_in lower_bound.upto(upper_bound)
  end

  private

  def palindrome?(num)
    s = num.to_s
    s == s.reverse
  end

  def find_first_palindrome_in(collection)
    palindrome, factors = collection.each do |num|
      next unless palindrome?(num)
      factors = compute_factors(num)
      break num, factors unless factors.empty?
    end
    Palindrome.new(palindrome, factors)
  end

  def compute_factors(value)
    factors = []
    (@min_factor..@max_factor).each do |factor|
      next if factors.flatten.include? factor
      other, rest = value.divmod factor
      next if other > @max_factor || other < @min_factor
      factors << [factor, other] if rest.zero?
    end
    factors
  end
end

class Palindrome
  attr_reader :value, :factors

  def initialize(value, factors=[])
    @value = value
    @factors = factors
  end
end
