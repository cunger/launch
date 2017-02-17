
def map(arr,proc)
  new_arr = []
  arr.each { |a| new_arr << proc.call(a) }
  new_arr
end

def map!(arr,proc)
  arr.each_index { |i| arr[i] = proc.call(arr[i]) }
end

# Example

a = [1,2,3]
increment = Proc.new { |x| x+1 }

map(a, increment) # => [2,3,4]
# a => [1,2,3]
map!(a, increment) # => [2,3,4]
# a => [2,3,4]
