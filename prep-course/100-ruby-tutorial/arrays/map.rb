
## Procs

def map_proc(arr, proc)
  new_arr = []
  arr.each { |a| new_arr << proc.call(a) }
  new_arr
end

def map_proc!(arr, proc)
  arr.each_index { |i| arr[i] = proc.call(arr[i]) }
end

# Example

a = [1, 2, 3]
increment = Proc.new { |x| x + 1 } # alternative: proc { |x| x + 1 }

map_proc(a, increment) # => [2,3,4]
# a => [1,2,3]
map_proc!(a, increment) # => [2,3,4]
# a => [2,3,4]


## Blocks

def map_block(arr, &block)
  new_arr = []
  arr.each { |a| new_arr << block.call(a) }
  new_arr
end

def map_block!(arr, &block)
  arr.each_index { |i| arr[i] = block.call(arr[i]) }
end

# Example

a = [1,2,3]

map_block(a) { |x| x + 1 }
# a => [1,2,3]
map_block!(a) do |x|
  x + 1
end
# a => [2,3,4]
