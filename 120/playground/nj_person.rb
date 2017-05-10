# https://launchschool.com/posts/c3f022b7

class Person
  attr_accessor :name
  attr_writer :age
  attr_reader :weight, :eye_color, :hair_color

  def initialize
    @height = 6
    if false
      @weight = 150
    end
    @hair_color &&= 'brown'
    p '---BEGIN---'
    p @unicorn
    p '---END---'
  end
end

bob = Person.new
p bob.name                 #=> nil
p bob.weight               #=> nil
p bob.eye_color            #=> nil
p bob.hair_color           #=> nil
p bob.instance_variables   #=> [:@height]
