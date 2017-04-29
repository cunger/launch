module Colorful
  def spray_paint(color)
    self.color = color
  end
end

module Affordable
  def buy
    puts "It's yours!"
  end
end

class Vehicle
  include Colorful

  @@total = 0

  attr_reader   :year
  attr_accessor :color, :speed, :fuel, :miles

  def initialize(year, color)
    @@total += 1

    @year  = year
    @color = color
    @speed = 0
    @miles = 0
    @fuel  = 0
  end

  def self.number_of_vehicles_on_the_road
    @@total
  end

  def age
    calculate_age
  end

  def speed_up(num)
    self.speed += num
  end

  def brake(num)
    self.speed -= num
  end

  def shut_off
    self.speed = 0
  end

  def fill_tank(gallons)
    self.fuel += gallons
  end

  def print_mpg(miles, gallons)
    puts "#{format('%.1f', miles.fdiv(gallons))} miles per gallon"
  end

  private

  def calculate_age
    Time.new.year - self.year
  end
end

class Car < Vehicle
  include Affordable

  PRICE = 4_000

  attr_accessor :model

  def initialize(model, year, color)
    super(year, color)
    @model = model
  end

  def info
    "Your #{color} #{model} from #{year} is going #{speed} mph."
  end

  def to_s
    "#{color} #{self.model} (from #{self.year}, with #{self.miles} miles)"
  end
end

class Hovercraft < Vehicle

  attr_accessor :eels

  PRICE = 20_000

  def initialize(year, color)
    super
    @eels = 0
  end

  def got_eels?
    eels > 0
  end

  def add_eel
    self.eels += 1
  end

  def to_s
    "#{color} hovercraft (from #{year}, with #{eels} eels)"
  end
end

# Examples

landrover = Car.new('LandRover', 2000, 'black')
puts landrover
puts landrover.info

landrover.speed_up(100)
puts landrover.info

landrover.brake(50)
puts landrover.info

landrover.shut_off
puts landrover.info

landrover.color = 'sparkly blue'
puts landrover.info

landrover.spray_paint('shiny white')
puts landrover.info

landrover.print_mpg(312, 16)

puts Vehicle.number_of_vehicles_on_the_road

hover = Hovercraft.new(2012, 'silver')
47.times { hover.add_eel }

puts hover

p Car.ancestors
p Hovercraft.ancestors

puts landrover.age
puts hover.age

landrover.buy
hover.buy # undefined method `buy`
