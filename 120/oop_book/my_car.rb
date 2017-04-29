
module Colorful
  def spray_paint(color)
    self.color = color
  end
end

class MyCar
  include Colorful

  attr_reader   :model, :year
  attr_accessor :color, :speed, :fuel, :miles

  def initialize(model, year, color)
    @model = model
    @year  = year
    @color = color
    @speed = 0
    @miles = 0
    @fuel  = 0
  end

  def info
    "Your #{color} #{model} from #{year} is going #{speed} mph."
  end

  def to_s
    "#{color} #{self.model} (from #{self.year}, with #{self.miles} miles)"
  end

  # Driving

  def speed_up(num)
    self.speed += num
  end

  def brake(num)
    self.speed -= num
  end

  def shut_off
    self.speed = 0
  end

  def travel(miles)
    self.miles += miles
  end

  # Tank

  def fill_tank(gallons)
    self.fuel += gallons
  end

  # Gas mileage

  def print_mpg(miles, gallons)
    puts "#{format('%.1f', miles.fdiv(gallons))} miles per gallon"
  end
end

# Examples

landrover = MyCar.new('LandRover', 2000, 'black')
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
