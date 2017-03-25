
def bubble_sort!(array)
  loop do
    did_something = false
    array.each_index do |index|
      break if index + 1 == array.size
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        did_something = true
      end
    end
    return array if !did_something
  end
end

## Tests

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
