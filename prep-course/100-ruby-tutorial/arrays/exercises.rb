
## Exercise 1

arr1 = [1, 2, 3, 4, 5]

puts arr1.include? 0
puts arr1.any? { |a| a == 0 }

## Exercise 2

arr2_1 = ["b", "a"]
arr2_1 = arr2_1.product(Array(1..3))
puts arr2_1.to_s # => [["b", 1], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]
arr2_1.first.delete(arr2_1.first.last)
# => 1
puts arr2_1.to_s
# => [["b", 1], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]

arr2_2 = ["b", "a"]
arr2_2 = arr2_2.product([Array(1..3)])
puts arr2_2.to_s # => [["b", [1, 2, 3]], ["a", [1, 2, 3]]]
arr2_2.first.delete(arr2_2.first.last)
# => [1, 2, 3]
puts arr2_2.to_s
# => [["b"], ["a", [1, 2, 3]]]

## Exercise 3

arr3 = [["test", "hello", "world"], ["example", "mem"]]

puts arr3.last.first
puts arr3[1][0]

## Exercise 4

arr4 = [15, 7, 18, 5, 12, 8, 5, 1]

puts arr4.index(5)   # => 3
puts arr4[5]         # => 8
puts arr4.index([5]) # => nil
puts arr4.index [5]  # => nil
# puts arr4.index[5] # => undefined method [] for Enumerator (arr4.index => <Enumerator>)

## Exercise 5

string = "Welcome to America!"
a = string[6]  # => "e"
b = string[11] # => "A"
c = string[19] # => nil

## Exercise 7

names = ['bob', 'joe', 'susan', 'margaret']
names[3] = 'jody' # => "jody"
# names => ["bob", "joe", "susan", "jody"]

## Exercise 8

arr8 = [0, 1, 2, 3, 4, 5]

new_arr8 = arr8.map { |a| a + 2 }

p arr8
p new_arr8
