
def multiply_list(numbers1, numbers2)
  # max_index = [numbers1.size, numbers2.size].min - 1
  # (0..max_index).to_a.map { |i| numbers1[i] * numbers2[i] }
  numbers1.zip(numbers2).map { |n1, n2| n1 * n2 }
end

def multiply_all_pairs(numbers1, numbers2)
  numbers1.product(numbers2).map { |n1, n2| n1 * n2 }.sort
end

## Tests

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
