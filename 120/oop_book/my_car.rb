
module Colorful
  def spray_paint(color)
    self.color = color
  end
end


class MyCar
  include Colorful

  attr_reader   :model, :year
  attr_accessor :color, :speed

  def initialize(model, year, color)
    @model = model
    @year  = year
    @color = color
    @speed = 0
  end

  def info
    "Your #{color} #{model} from #{year} is going #{speed} mph."
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
end

landrover = MyCar.new('LandRover', 2000, 'black')
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
