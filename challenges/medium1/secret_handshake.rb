
class SecretHandshake
  CODES = [ lambda { |cs| cs << 'wink' },
            lambda { |cs| cs << 'double blink' },
            lambda { |cs| cs << 'close your eyes' },
            lambda { |cs| cs << 'jump' },
            lambda { |cs| cs.reverse! } ]

  def initialize(code)
    @digits = to_binary_digits(code)
  end

  def commands
    commands = []
    @digits.each.with_index do |digit, index|
      CODES[index].call(commands) if digit == 1
    end
    commands
  end

  private

  def to_binary_digits(input)
    case input
    when Integer then input.digits(2)
    when String && /[01]+/ then input.chars.map(&:to_i).reverse
    else []
    end
  end
end
