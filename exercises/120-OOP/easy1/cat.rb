class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, fur)
    super(name, age)
    @fur = fur
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@fur} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

class AlternativeCat < Pet
  attr_accessor :color

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@color} fur."
  end
end

pudding = AlternativeCat.new('Pudding', 7)
# pudding.color = 'black and white'
butterscotch = AlternativeCat.new('Butterscotch', 10)
# butterscotch.color = 'tan and white'
puts pudding, butterscotch
