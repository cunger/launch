
def sort(arr)
  sort_rec(arr, [], Proc.new { |x| x })
end

def dictionary_sort(arr)
  sort_rec(arr, [], Proc.new { |x| x.downcase })
end

def sort_rec(unsorted_array, sorted_array, preprocessing)
  # If there's nothing more to sort, stop
  if unsorted_array.empty?
    return sorted_array
  end
  # Find smallest elements in unsorted_array
  smallest = unsorted_array[0..0]
  unsorted_array[1..unsorted_array.size-1].each do |a|
    if preprocessing.call(a) < preprocessing.call(smallest[0])
      smallest = [a]
    elsif preprocessing.call(a) == preprocessing.call(smallest[0])
      smallest << a
    end
  end
  # Move them to sorted_array
  sorted_array   += smallest
  unsorted_array -= smallest
  # Repeat
  sort_rec(unsorted_array, sorted_array, preprocessing)
end

def shuffle(arr)
  # keep original array untouched
  org_arr = arr.clone
  new_arr = []
  until org_arr.empty?
    a = org_arr.sample
    new_arr << a
    org_arr.delete(a)
  end
  new_arr
end

def pseudo_shuffle(arr)
  # keep original array untouched
  org_arr = arr.clone
  new_arr = []
  until org_arr.empty?
    a = org_arr.sample
    # don't allow for consecutive elements n and n+1
    unless not new_arr.empty? and a == new_arr.last + 1
      new_arr << a
      org_arr.delete(a)
    end
  end
  new_arr
end

# Small test

int_arr = [ 2, 6, 4, 3, 2, 6, 10, 45, 4, 0 ]
str_arr = [ "world", "hello", "blah", "blubb", "Blah", "blubb" ]

puts sort(int_arr) == int_arr.sort
puts sort(str_arr) == str_arr.sort

puts dictionary_sort(str_arr).to_s

ordered_arr = (0..20).to_a
puts shuffle(ordered_arr).to_s
puts pseudo_shuffle(ordered_arr).to_s
