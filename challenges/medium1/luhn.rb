class Luhn
  def initialize(num)
    @digits = num.digits
  end

  def addends
    @digits.map.with_index { |digit, index|
      if index.even?
        digit
      else
        new_digit = 2 * digit
        new_digit -= 9 if new_digit > 9
        new_digit
      end
    }.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    (checksum % 10).zero?
  end

  def self.create(num)
    new_num = num * 10
    remainder = new(new_num).checksum.remainder(10)
    remainder.zero? ? new_num : new_num + (10 - remainder)
  end
end
