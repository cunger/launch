
module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable

  # attr_reader :name
  # attr_writer :name
  attr_accessor :name

  def initialize(name)
    @name = name
    # puts "I'm a cat!"
  end

  def say_hello
    puts "Hello! My name is #{self.name}!"
  end
end

# Examples

kitty = Cat.new('Sophie')
kitty.say_hello
kitty.name = 'Luna'
kitty.say_hello

kitty.walk
