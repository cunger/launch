class Person

  def initialize(str)
    @name = str
  end

  def name
    @name.clone
  end

  def age=(num)
    @age = adapt(num)
  end

  def age
    adapt(@age)
  end

  private

  def adapt(num)
    num * 2
  end
end

person1 = Person.new 'James'

person1.name.reverse!
puts person1.name

person1.age = 20
puts person1.age
