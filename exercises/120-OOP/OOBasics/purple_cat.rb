class PurpleCat
  COLOR = 'purple'

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}!"
  end

  def greet
    puts "Hello! My name is #{self.name} and I'm a #{COLOR} cat."
  end
end

kitty = PurpleCat.new 'Sophie'
kitty.greet

puts kitty

puts PurpleCat::COLOR
puts COLOR # => uninitialized constant COLOR (NameError)
