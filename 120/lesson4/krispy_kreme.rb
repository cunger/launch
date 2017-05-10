class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    filling = @filling_type.nil? ? "Plain" : @filling_type
    glazing = @glazing.nil? ? "" : "with " + @glazing

    filling + " " + glazing
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
# => "Plain"

puts donut2
# => "Vanilla"

puts donut3
# => "Plain with sugar"

puts donut4
# => "Plain with chocolate sprinkles"

puts donut5
# => "Custard with icing"
