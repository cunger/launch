class SpaceVehicle
end

class SpaceShuttle < SpaceVehicle
  attr_accessor :heatshield, :thrusters, :payload

  def initialize
     @heatshield = :on
     @thrusters  = :off
     @payload    = []
  end

  def load(item)
     @payload << item
  end

  def launch
    @thrusters = :on
  end

  def ==(other)
    other.is_a?(SpaceShuttle) &&
    heatshield == other.heatshield &&
    thrusters  == other.thrusters &&
    payload    == other.payload
  end
end
