class Person
  attr_reader :gender

  def initialize(gender)
    @gender = gender
  end

  def name=(str)
    @name = str.capitalize
  end

  def name
    case gender
    when :female then 'Mrs. ' + @name
    when :male   then 'Mr. '  + @name
    else 'Mr./Mrs. ' + @name
    end
  end
end

person1 = Person.new(:female)
person1.name = 'eLiZaBeTh'
puts person1.name

person2 = Person.new(:male)
person2.name = 'James'
puts person2.name
