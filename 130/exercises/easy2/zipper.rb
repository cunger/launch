
def zip(array1, array2)
  array = []
  (0...array1.size).each { |i| array << [array1[i], array2[i]] }
  array
end

  p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
