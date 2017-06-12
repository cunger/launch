
def count(collection)
  # n = 0
  # collection.each do |element|
  #   n += 1 if yield element
  # end
  # n
  collection.map { |element| yield(element) ? 1 : 0 }.sum
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
