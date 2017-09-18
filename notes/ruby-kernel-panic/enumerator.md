# Iterators and sequences

An _iterator method_ is a method that takes a block and calls its for each element in some collection, passing the element into the block as a parameter.

## Internal iteration

How to iterate is controlled by the collection that implements it. An example is `Array#each`.

In order to benefit from all the internal iteration magic, implement `each` and include `Enumerable`.

## External iteration

How to iterate is controlled from the outside, by whoever uses the iterator. In order to allow this, build an `Enumerator` object. \(`Enumerator` implements `each` and includes `Enumerable`, so enumerators are also endowed with methods for internal iteration.\)

An `Enumerator` object can be built from most of the `Enumerable` methods by not providing a block:

```ruby
array = [1, 2, 3]
array.each # same as: array.enum_for(:each), or: Enumerator.new(array, :each)
array.map  # same as: array.enum_for(:map),  or: Enumerator.new(array, :map)
```

When implementing an iteration method like those, it's good practice to include this option as follows:

```ruby
return enum_for(__callee__) unless block_given?
```

An enumerator can also be constructed explicitly as instance of the `Enumerator` class. Construction requires a block that takes a yielder as argument. A yielder is an `Enumerator::Yielder` object that passes control around. It let's us yield each item of the enumerator to blocks passed to `Enumerable` method calls, like `next`, `peek`, `rewind`, etc.

**Example: infinite sequence of natural numbers**

```ruby
def natural_numbers
  Enumerator.new do |yielder|
    n = 0
    loop do
      yielder << n # another way of saying: yielder.yield n
      n += 1
    end
  end
end

puts natural_numbers.first(10)
```

**Example: repeatedly execute a block**

```ruby
def repeatedly(&block)
  Enumerator.new do |yielder|
    loop do
      yielder << block.call
    end
  end
end

enum = repeatedly { puts 'Yay!' }
enum.first 10
```

For finite enumerators:

```ruby
loop do
  raise StopIteration if there_is_no_next_value
  yielder << next_value
end
```



