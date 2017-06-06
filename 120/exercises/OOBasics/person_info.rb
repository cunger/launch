class Person
  attr_accessor :first_name
  attr_reader   :phone_number
  attr_writer   :last_name, :age

  def initialize(number=555)
    @phone_number = number
  end

  def first_equals_last?
    first_name == last_name
  end

  def older_than?(other)
    age > other.age
  end

  private

  attr_reader :last_name

  protected

  attr_reader :age
end

# Name

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?

# Age

person2 = Person.new
person2.age = 17

person3 = Person.new
person3.age = 26

puts person2.older_than?(person3)

# Phone number

person4 = Person.new(1234567899)
puts person4.phone_number

person4.phone_number = 9987654321
puts person4.phone_number
