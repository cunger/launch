# Object conversion

`Array(arg)` says:
> Returns `arg` as an `Array`. First tries to call `to_ary` on `arg`, then `to_a`.

`String(arg)` says something analogous:
> Returns `arg` as a `String`. First tries to call its `to_str` method, then its `to_s` method.

So they're methods for object conversion, transforming their argument using explicit and implicit object conversion.

*Explicit conversion* converts an object to the target type. For example, `obj.to_s` will give you a string representation of `obj`, and `obj.to_i` will give you an integer representation. If those methods are defined for `obj`, that is. The `Nil` class implements all of them:

```ruby
nil.to_s => ""
nil.to_a => []
nil.to_h => {}
nil.to_i => 0
nil.to_f => 0.0
nil.to_r => (0/1)
nil.to_c => (0+0i)
```

Ruby doesn't call explicit conversion methods unless you explicitly ask it to do so.

```ruby
"THX" + 1138      => TypeError
"THX" + 1138.to_s => "THX1138"
```

*Implicit conversion* is defined for objects that can be considered as something target type-ish. So `to_int` would be implemented for integer-like objects, that is objects that act like integers and thus make sense everywhere an integer makes sense. It wouldn't be implemented for objects that are not integer-like. Analogously for `to_str`, `to_ary`, `to_hash` and a few others. Hence the behavior of `nil`:

```ruby
nil.to_str  => NoMethodError
nil.to_ary  => NoMethodError
nil.to_hash => NoMethodError
nil.to_int  => NoMethodError
```

Some core Ruby operators and methods call implicit conversion methods. One example is `String#+`, which calls `to_str` on its argument, and thus fails, for example, for integers:

```ruby
"THX" + 1138
=> TypeError: no implicit conversion of Integer into String
```

Similarly, `String#*` calls `to_int` on its argument and therefore is fine being provided a `Float` (fortunately or unfortunately not attempting to print the string `3.14` times):

```ruby
"Yay!" * 3.14 => "Yay!Yay!Yay!"
```

Now it makes perfect sense why `Array(arg)` first tries `to_ary`: *Let's see whether this is already something like an array.* And only if that is not defined or returns `nil`, it calls `to_a`: *Ok, if it's not an array, let's make it one!*

What about hashes? `Hash(arg)` calls `to_hash`, and returns the empty hash for `[]` and `nil`. Period. No calling `to_h`.

```ruby
Hash([[1, 2]])   => TypeError: can't convert Array into Hash
[[1, 2]].to_hash => TypeError: can't convert Array into Hash
[[1, 2]].to_h    => {1=>2}
```

Turns out this conversion method is younger than the rest, because the whole issue is less obvious for hashes than it is for strings or arrays, so it evoked more discussion.

Finally, `Kernel` also defines numerical conversions, like `Float(arg)` and `Integer(arg)`, which convert numerical values directly into floats and integers, and for everything else fall back on `to_f` and `to_i`. Also, `Integer` is more refined than `to_i` when it comes to converting string representations of integers into numerical values. In particular, both are more picky than their `to_f` and `to_i` counterparts in expecting the given argument to be an object that can actually reasonably interpreted as `Float` or `Integer`.

```ruby
nil.to_f   => 0.0
Float(nil) => TypeError: can't convert nil into Float
Float("1138") => 1138.0
Float("THX")  => ArgumentError: invalid value for Float()
```

This makes them pretty useful for [numeric validation](https://pdxwolfy.wordpress.com/2016/04/12/numeric-validation-in-ruby/).
