module Walk
  def walk
    puts "#{self} #{gait} forward"
  end
end

class Person
  include Walk
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "strolls"
  end
end

class Noble < Person
  include Walk
  attr_reader :name, :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def to_s
    title + ' ' + name
  end

  def gait
    "struts"
  end
end

class Cat
  include Walk
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
  include Walk
  attr_reader :name

  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"
