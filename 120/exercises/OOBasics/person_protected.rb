class Person
  attr_writer :secret

  def compare_secret(other_person)
    self.secret == other_person.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Marhsmallows'

person2 = Person.new
person2.secret = 'SM'

puts person1.compare_secret(person2)
puts person2.secret # => NoMethodError: protected method called
