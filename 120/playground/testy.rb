class Testy
  attr_accessor :value

  def initialize
    @value = 0
  end

  def public_interface
    self.private_interface
    # private_interface
  end

  private

  def fnord
    puts "Fnord!"
  end

  def private_interface
    self.value = value + 1
  end
end

tester = Testy.new
# p tester.public_interface
# => NoMethodError (private method), because caller of `private_interface is `self`, in this case `tester`
# commented out line without `self` would work

class Machine
  def start
    flip_switch(:on)
  end

  def getter_switch
    @switch
  end

  private

  def switch=(value)
    @switch = value
  end

  def flip_switch(desired_state)
    self.switch = desired_state # translates to `@switch = desired_state`, not `machine.switch = desired_state`
                                # this is special for setter methods, as without `self.` , `switch` would be a local variable
  end
end

machine = Machine.new
machine.start
p machine.getter_switch # => :on
