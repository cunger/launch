
def merge(array1, array2)
  merged_array = []
  index1 = 0
  index2 = 0

  while index1 < array1.size
    if index2 >= array2.size || array1[index1] < array2[index2]
      merged_array << array1[index1]
      index1 += 1
    else
      merged_array << array2[index2]
      index2 += 1
    end
  end
  while index2 < array2.size
    merged_array << array2[index2]
    index2 += 1
  end

  merged_array
end

def merge_sort(array)
  array.map { |a| [a] }.reduce([]) { |arr, a| merge(arr, a) }
end

## Tests

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
