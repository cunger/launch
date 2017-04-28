
def show_multiplicative_average(integers)
  avg = integers.reduce(1,:*).fdiv integers.size
  puts format('%.3f',avg)
end

## Examples

show_multiplicative_average([3, 5])
# 7.500

show_multiplicative_average([2, 5, 7, 11, 13, 17])
# 28361.667
