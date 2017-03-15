
def reverse!(array)
  store = []
  array.length.times { store << array.pop }
  store.length.times { array.unshift store.pop }
  array
end

## Alternatives

# Rafael Dwan:
#
# def reverse!(list)
#   list = list.sort! { |a, b| list.index(b) <=> list.index(a) }
# end
#
# Nick Johnson:
#
# def reverse!(list)
#   list.each_index { |idx| list.insert(idx, list.pop) }
# end
#
# def reverse!(arr)
#   arr.sort_by!.with_index { |_, idx| -idx }
# end

def reverse(array)
  array.reduce([],:unshift)
end

## Tests

list = [1, 2, 3, 4]
result = reverse!(list)
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
result = reverse!(list)
p list == ["e", "d", "c", "b", "a"]
p list.object_id == result.object_id

list = ['abc']
result = reverse!(list)
p list == ["abc"]
p list.object_id == result.object_id

list = []
result = reverse!(list)
p list == []
p list.object_id == result.object_id

p reverse([1,2,3,4]) == [4,3,2,1]
p reverse(%w(a b c d e)) == %w(e d c b a)
p reverse(['abc']) == ['abc']
p reverse([]) == []

list = [1, 2, 3]
new_list = reverse(list)
p list.object_id != new_list.object_id
p list == [1, 2, 3]
p new_list == [3, 2, 1]
