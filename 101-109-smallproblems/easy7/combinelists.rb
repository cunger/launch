
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

## Test

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
