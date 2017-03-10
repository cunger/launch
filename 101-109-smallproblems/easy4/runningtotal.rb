
def running_total(array)
  new_array = []
  array.each_with_index do |num, index|
    new_array << array[0..index].reduce(:+)
  end
  new_array
end

## Alternative

# def running_total(array)
#   sum = 0
#   array.map { |value| sum += value }
# end

## Tests

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
