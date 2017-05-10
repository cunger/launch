module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

car = Car.new
p car.respond_to? :go_fast
p car.public_methods
car.go_fast

truck = Truck.new
p truck.respond_to? :go_fast
p truck.public_methods
truck.go_fast
