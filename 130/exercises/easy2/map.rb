
# def map(collection)
#   collection.each.with_object([]) { |item, arr| arr << yield(item) }
# end

def map(collection)
  with_object(collection.each, []) { |item, arr| arr << yield(item) } # = b2, yield b3
end

def with_object(enumerator, obj)
  enumerator.each { |item| yield(item, obj) } # = b1, yield b2
  obj
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36] # = b3

# map2 is invoked with two arguments:
# - the collection [1, 3, 6]
# - the block b3 = { |value| value**2 }
# it calls with_object, providing it with three arguments:
# - an enumerator over all elements in the collection (collection.each)
# - an empty array
# - the block b2 = { |item, arr| arr << yield(item) }
#   (which in its body calls b3)
# with_object now calls `each` on the enumerator,
# giving each item to the block b1 = { |item| yield(item, obj) }
# so for the first item, 1, it will yield it together with obj (which is [])
# to block b2, which will call block b3 on the item (taking the square of it)
# and add it to `arr`
# b2 and thus b1 have `arr` as return value
# however, `enumerator.each {...}` returns the original collection behind the enumerator,
# in this case [1, 2, 3]
# that's why it's necessary to explicitly return `obj` from `with_object`

p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

## Tests by Kristen Wilde

require 'set'

hash = { 1=> "m", 2=> "c", 3=> "s" }
set = Set[1, 3, 6]

p map(hash) { |_, v| v += "at" } == ["mat", "cat", "sat"]
p map(set) { |value| value**2 } == [1, 9, 36]
p map({}) { |value| true } == []
p map(Set[]) { |value| true } == []
p map(hash) { |value| false } == [false, false, false]
p map(set) { |value| false } == [false, false, false]
p map(hash) { |_, value| value.upcase } == ['M', 'C', 'S']
p map(set) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4, 5, 6]]
