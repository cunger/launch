## The & operator

The `&` operator tells Ruby to use an object as a block. If expects that object to be a _proc_; if it is not, it first calls `to_proc` on it.

```ruby
def execute(&block) # `&` takes the block that is part of the method invocation,
                    # turns it into a `Proc` object (by calling `to_proc`),
                    # and binds it to the variable `block`.
  block.call
end

execute  { puts 'Yay!' }

p = proc { puts 'Yay!' }
execute(&p)         # `&` hands `p` to the method as the block it can take,
                    # so this is the same as saying `execute { puts 'Yay!' }`.
                    # Without `&`, `p` would be passed as a normal method argument.
```

`to_proc` is defined in

* `Proc`
* `Symbol`: It allows you to say `&:capitalize` and get back a _proc_ that captures the `capitalize` method. Note that, like above, the `&` in `array.map(&:capitalize)` tells `map` that `:capitalize.to_proc` takes the place of the block that can be part of the method invocation \(as in `array.map { |item| item.capitalize }`\).

  `Symbol#to_proc` basically works like this:

  ```ruby
    class Symbol
      def to_proc
        proc { |obj, args| obj.send(self, *args) }
      end
    end
  ```

* `Method`

It can also be defined by any class as a class or instance method.

## Currying 

```ruby
p = proc { |x, y| x + y } 
p.curry # => <Proc> 

p.call(1)         # => <Proc> 
p.call(1).call(2) # => 3
```



