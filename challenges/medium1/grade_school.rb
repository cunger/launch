class School
  def initialize
    @grades = {}
  end

  def to_h
    @grades.to_a.sort.to_h
  end

  def add(name, grade)
    @grades[grade] ||= []
    @grades[grade] << name
    @grades[grade].sort!
  end

  def grade(grade)
    @grades[grade] || []
  end
end
