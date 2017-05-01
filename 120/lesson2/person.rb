class Person
  SEPARATOR = ' '

  attr_accessor :first_name, :last_name

  def initialize(str)
    self.name = str
  end

  def name=(str)
    if str.include? SEPARATOR
      @first_name, @last_name = str.split SEPARATOR
    else
      @first_name = str
      @last_name  = ''
    end
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end

  def same_name?(other)
    name == other.name
  end

  def to_s
    name
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
p bob.same_name?(rob)
p bob == rob
p bob == bob.clone
p bob == bob.dup

puts bob
