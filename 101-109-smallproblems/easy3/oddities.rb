def oddities1(array)
  new_array = []
  array.each_with_index { |element, index| new_array << element if index.even? }
  new_array
end

def oddities2!(array)
  array.keep_if { |element| array.index(element).even? }
end

def oddities3!(array)
  array.select.with_index { |_, index| index.even? }
end
## Tests

p oddities1([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities1(['abc', 'def']) == ['abc']
p oddities1([123]) == [123]
p oddities1([]) == []

p oddities2!([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities2!(['abc', 'def']) == ['abc']
p oddities2!([123]) == [123]
p oddities2!([]) == []

p oddities3!([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities3!(['abc', 'def']) == ['abc']
p oddities3!([123]) == [123]
p oddities3!([]) == []
