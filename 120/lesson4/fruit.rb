class Fruit
  attr_accessor :vitamin

  def initialize(name)
    @name = name
  end

  def source_of(vitamin)
    @vitamin = vitamin
    if false
      @secret = "I'm healthy!"
    end
    @secret &&= "I'm tasty!"
  end
end

apple = Fruit.new("apple")
p apple.instance_variables
p apple.vitamin
p apple.instance_variables

apple.source_of("C")
p apple.instance_variables

## NOTE: Instance variables come into existence when they're initialized with a value,
##       i.e. when the code that initializes them is actually executed.
