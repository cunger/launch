class Clock
  def initialize(hour, mins)
    @hour = hour
    @mins = mins
  end

  def self.at(hour, mins=0)
    new(hour, mins)
  end

  def to_s
    format('%02d:%02d', hour, mins)
  end

  def +(minutes)
    h, m = minutes.divmod 60
    @hour = (@hour + h) % 24
    @mins += m
    self
  end

  def -(minutes)
    self + -minutes
    # h, m = minutes.divmod 60
    # @hour -= h
    # @hour += 24 if @hour.negative?
    # @mins -= m
    # if @mins.negative?
    #   @hour -= 1
    #   @mins += 60
    # end
    # self
  end

  def ==(other)
    hour == other.hour && mins == other.mins
  end

  protected

  attr_reader :hour, :mins
end
