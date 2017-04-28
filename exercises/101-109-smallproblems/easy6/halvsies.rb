
def halvsies(arr)
  breakpoint = (arr.size / 2.0).ceil
  # second_arr = []
  # until arr.size == breakpoint
  #   second_arr.unshift arr.pop
  # end
  # [arr, second_arr]
  [arr.slice(0..(breakpoint - 1)), arr.slice!(breakpoint..-1)]
end

## Tests

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
