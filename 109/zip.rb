def interleave(arr1, arr2)
  zipped_arr = []

  if arr1.size < arr2.size
    shorter_arr = arr1
    longer_arr  = arr2
  else
    shorter_arr = arr2
    longer_arr  = arr1
  end

  shorter_arr.each_index do |index|
    zipped_arr << arr1[index]
    zipped_arr << arr2[index]
  end

  zipped_arr += longer_arr[shorter_arr.size..-1]

  zipped_arr
end

# Alternative: arr1.zip(arr2).flatten

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave([1, 2, 3], ['a', 'b', 'c', 'd']) == [1, 'a', 2, 'b', 3, 'c', 'd']
p interleave([1, 2, 3, 4, 5], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c', 4, 5]
