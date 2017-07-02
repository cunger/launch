
class Number
  DIGITS = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
  TO_INT = DIGITS.zip((0..15).to_a).to_h

  def initialize(base, string)
    @base = base
    @digits = to_digits(string.downcase)
  end

  def to_decimal
    @digits.reverse
           .map.with_index { |digit, n| digit * @base**n }
           .reduce(0, :+)
  end

  private

  def to_digits(string)
    if string =~ Regexp.new('\A(' + DIGITS.take(@base).join('|') + ')+\z')
      string.chars.map { |char| TO_INT[char] }
    else
      []
    end
  end
end

class Octal < Number
  def initialize(string)
    super(8, string)
  end
end

class Trinary < Number
  def initialize(string)
    super(3, string)
  end
end

class Hex < Number
  def initialize(string)
    super(16, string)
  end
end
