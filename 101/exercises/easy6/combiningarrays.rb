
def merge(arr1, arr2)
  arr2.each { |a| arr1 << a }
  arr1.uniq
end

# Alternative (set union): arr1 | arr2 

## Test

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
