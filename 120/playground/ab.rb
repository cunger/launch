
# Private methods are callable from subclasses.

# Rule of thumb: If you need an explicit object reference to call the method,
# it's not accessible (if it's private).
# (You don't need self explicitly; methods from superclasses are available
#  just as if they were part of the subclass itself.)

class A

  def methodA
    puts "I'm #{self}."
  end

  private :methodA
end

class B < A

  def methodB
    methodA
    puts "I'm still #{self}."
  end
end

b = B.new
b.methodB
