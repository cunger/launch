# Enumerable: each

`Enumerable` provides a range of collection-related behavior. In order for a class \(usually a class implementing collections, such as `Array`, `Hash`, `Set`, and `Range`\) to include and use it, `Enumerable` needs to be able to traverse through the collection - more specifically, the class must implement `each`, a method that yields successive members of the collection. In the simplest case it calls a block with one argument and binds the current member to that argument. When done, it returns the collection.

```ruby
["r", "u", "b", "y"].each { |c| puts "Give me a #{c.upcase}!" }
Give me a R!
Give me a U!
Give me a B!
Give me a Y!
=> ["r", "u", "b", "y"]
```

Building on `each`, `Enumerable` implements several handy extensions of it, among them the following two:

* `each_with_index` calls a block with two arguments: the current element and the index of that element. Like each, it returns the collection.

```ruby
collection.each_with_index { |element, index| ... }
=> collection
```

* `each_with_object` additionally expects an object, and calls a block with two arguments: the current element and that object \(which is passed to and returned from each iteration of the block\). It returns the initial object.

```ruby
collection.each_with_object(initial_memo) { |element, memo| ... }
=> initial_memo
```

```ruby
["r", "u", "b", "y"].each_with_object("") { |c, str| str << c }
=> "ruby"
["r", "u", "b", "y"].each_with_object("") { |c, str| p (str + c) }
"r"
"u"
"b"
"y"
=> ""
```

In addition, classes that include `Enumerable` might define further variants of each that are specific for that class. For example, `Array` also defines `each_index`, in case you don't care about the elements but only their indices.

```ruby
array.each_index { |index| ... }
=> array
```

And `Hash` defines a few variants that are specific to hashes:

```ruby
hash.each_key   { |key| ... }
hash.each_value { |value| ... }
hash.each_pair  { |key, value| ... }
```

They all return the hash they're called on, and `each_pair` is basically the same as `each`, just providing a more descriptive name.

Note that `String` does not include `Enumerable` but also defines `each`-like methods, based on the different possibilities of viewing strings as collections:

* `each_char`
* `each_byte`
* `each_codepoint`
* `each_line` \(with an optional separator argument\)



