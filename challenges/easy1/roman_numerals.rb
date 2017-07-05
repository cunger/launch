class Integer

  def to_roman
    number = self
    TO_ROMAN.map do |int, str|
      quotient, number = number.divmod int
      str * quotient
    end.join
  end

  private

  TO_ROMAN = { 1000 => 'M',
                900 => 'CM',
                500 => 'D',
                400 => 'CD',
                100 => 'C',
                 90 => 'XC',
                 50 => 'L',
                 40 => 'XL',
                 10 => 'X',
                  9 => 'IX',
                  5 => 'V',
                  4 => 'IV',
                  1 => 'I' }
end
