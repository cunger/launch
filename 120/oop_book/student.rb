class Student
  attr_accessor :name
  attr_writer   :grade

  def initialize(name)
    @name = name
  end

  def better_grade_then?(other)
    self.grade <=> other.grade
  end

  protected

  attr_reader :grade
end

joe = Student.new 'Joe'
bob = Student.new 'Bob'

joe.grade = 'A'
bob.grade = 'B'

puts "Well done!" if joe.better_grade_then?(bob)
puts joe.grade
