
module Dive
  def dive_to(meters)
    puts "I'm #{@name}, a #{self.class}, and I dive to #{meters} m!"
    puts "I'm #{self.name}, a #{self.class}, and I dive to #{meters} m!"
    puts "I'm #{name}, a #{self.class}, and I dive to #{meters} m!"
  end
end

class Mammal
  LATIN = "Mammalia"

  def self.latin
    LATIN
  end
end

class Cetacean < Mammal
  include Dive
end

class Dolphin < Cetacean
  @@population_size = 0

  def initialize(name)
    @name = name
    puts "A new dolphin was born. Welcome, #{@name}!"
    @@population_size += 1
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def speak
    puts "So long and thanks for all the fish!"
  end

  def self.population_size
    @@population_size
  end

  def to_s
    "Dolphin '#{name}'"
  end
end

class Whale < Cetacean
end

class Porpoise < Cetacean
end

class Human < Mammal
  include Dive

  attr_accessor :name

  def initialize(name)
    @name = name
    puts "A new human was born. Welcome, #{@name}!"
  end

  def sing
    puts "Lalalalalala!"
  end
end

shakira = Dolphin.new "Shakira"
panda = Dolphin.new "Panda"
me = Human.new "Christina"

shakira.dive_to(300)
me.dive_to(10)

puts shakira.name + " speaks: "
shakira.speak

puts me.name + " sings: "
me.sing

shakira.name = "Shake"

puts shakira.name
puts shakira.to_s

p Cetacean.ancestors
p Dolphin.ancestors
p Human.ancestors

p Mammal.latin
p Dolphin.population_size
