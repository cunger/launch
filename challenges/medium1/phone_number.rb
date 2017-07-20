class PhoneNumber
  INVALID = '0000000000'

  attr_reader :number

  def initialize(string)
    @number = clean(string)
  end

  def area_code
    number[0, 3]
  end

  def to_s
    "(#{number[0, 3]}) #{number[3, 3]}-#{number[6..-1]}"
  end

  private

  def clean(string)
    return INVALID if string.downcase =~ /[a-z]/

    num = string.gsub(/[^\d]/, '')
    return num if num.length == 10
    return num[1..-1] if num.length == 11 && num.chars.first == '1'
    return INVALID
  end
end
