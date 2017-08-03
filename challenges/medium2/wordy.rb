class WordProblem
  def initialize(string)
    string = preprocess string
    string.scan /(-?\d+)(.*)/ do |num, rest|
      @value = Integer(num)
      @stack = parse(rest.strip)
    end
    raise ArgumentError if !@value || @stack.empty?
  end

  def answer
    @stack.inject(@value) do |value, pair|
      op, n = pair
      value = value.send(op, n)
    end
  end

  private

  OPERATIONS = { 'plus' => :+,
                 'minus' => :-,
                 'multiplied by' => :*,
                 'divided by' => :/ }

  def preprocess(string)
    string.downcase.sub('what is', '').gsub('?', '').strip
  end

  def parse(string)
    stack = []
    string.scan /(plus|minus|multiplied by|divided by) (-?\d+)/ do |op, num|
      operation = OPERATIONS.fetch(op) { raise ArgumentError }
      stack << [operation, Integer(num)]
    end
    stack
  end
end
