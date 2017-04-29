class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    puts "I'm #{name}!"
  end

  def some_method
    puts "Fnord!"
  end
end

kitty = Cat.new('Sophie')
puts '------'
puts kitty
puts '------'
p kitty.to_s
puts '------'
p kitty.some_method
puts '------'
