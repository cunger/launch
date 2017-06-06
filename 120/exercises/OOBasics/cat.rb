class Cat
  @@number_of_instances = 0

  attr_accessor :name

  def initialize(name)
    @name = name
    @@number_of_instances += 1
  end

  def rename(name)
    self.name = name
  end

  def identify
    self
  end

  def self.total
    @@number_of_instances
  end

  def self.greeting
    puts "Hello! I'm a cat!"
  end

  def greeting
    self.class.greeting
    puts "And my name is #{self.name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty.name
p kitty.identify

kitty.rename('Chloe')
puts kitty.name
p kitty.identify
p kitty == kitty.identify

Cat.greeting
kitty.class.greeting
kitty.greeting

another_kitty = Cat.new "Bombur"

puts Cat.total
