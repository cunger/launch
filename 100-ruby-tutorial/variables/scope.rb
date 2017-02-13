## Example 1

x = 0 # initializing x

3.times do
  x += 1 # simply re-assigning x
end

puts x # => 3

## Example 2

y = 0

3.times do
  y += 1
  z = y
end

puts z
