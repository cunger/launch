
def times(num)
  i = 0
  while i < num
    yield i
    i += 1
  end
  num
end

def each(array)
  index = 0
  while index < array.size
    yield array[index]
    index += 1
  end
  array
end

def select(array)
  filtered_array = []
  for element in array
    filtered_array << element if yield(element)
  end
  filtered_array
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

## map

def map(array)
  new_array = []
  for element in array
    new_array << yield(element)
  end
  new_array
end

def map!(array)
  index = 0
  while index < array.size
    array[index] = yield(array[index])
    index += 1
  end
  array
end

p map(array) { |n| n + 1 }
p array
p map!(array) { |n| n + 1 }
p array

## reduce: folding a collection into one object

def reduce(array, initial = nil)
  return initial if array.empty?

  if initial.nil?
    fold = array[0]
    index = 1
  else
    fold = initial
    index = 0
  end
  # Shorter version (Tyler Lippert):
  # index, fold = initial.nil? ? [0, initial] : [1, array.first]

  while index < array.size
    fold = yield(fold, array[index])
    index += 1
  end
  fold
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
