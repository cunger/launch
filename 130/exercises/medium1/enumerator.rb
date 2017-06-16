
def factorial_enum
  Enumerator.new do |yielder|
    # first factorial (0!) = 1
    yielder << 1
    # generate subsequent factorials
    i = 1
    factorial = 1
    loop do
      factorial *= i
      yielder << factorial # another way of saying: yielder.yield accumulator
      i += 1
    end
  end
end

puts factorial_enum.first(7)
