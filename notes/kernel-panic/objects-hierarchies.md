# Objects, classes and hierarchies

It's all objects. Also _classes_ and _modules_ are objects, namely instances of `Class` and `Module` (which themselves are objects).

> If you can reference it with a variable, it's an object.

Ruby has single inheritance, i.e. a class can have only one superclass. The superclass of `Class` is `Module`.
```
> Class.ancestors
=> [Class, Module, Object, Kernel, BasicObject]
```

Classes are the only kind of object that can spawn instances; modules cannot have instances.

```ruby
# Named class

class Something
end

some_instance = Something.new

# Anonymous class

some_class = Class.new
def some_class.some_method; end

some_instance = some_class.new
some_instance.some_method
```

_Class methods_ (like `Dolphin::oldest`) are methods that are defined and called directly on class objects.
_Instance methods_ (like `Dolphin#name`) are methods accessible to and called on instances.

## The method-lookup path

See also [this GitHub gist](https://gist.github.com/damien-roche/351bf4e7991449714533), and check using `some_class.ancestors`.

When resolving an identifier, Ruby checks:

* the class itself (local variables before methods)
* all modules included in the class (in reverse order of inclusion, and unless a module is included with `prepend` instead of `include` - in that case module methods take precedence over class methods)
* its superclass
* all modules included in its superclass
* ...
* `Object`
* `Kernel` (the module included in object)
* `BasicObject` (the parent of all classes)

## self and super

Note that `self` and `super` are keywords (not methods).

### super

> When you call `super` from within a method, it will search the inheritance hierarchy for a method by the same name and then invoke it.

In doing so, `super` always jumps to the next higher element of the method-lookup path. That is, if you include a module in a class, `super` will jump to that module before jumping to the superclass.
* `super` forwards all arguments passed to the method calling it to the method in `super`
* `super()` forwards no arguments
* `super(arg1, arg2)` forwards only the specified arguments

### self

`self` gives you access to the current object.

At the top level of a program, this is `main` (the built-in default object of type `Object`).

At the top level of a class or module, this is the class or module object.
```ruby
class C
  self

module M
  self
```

In a method (wherever: in a class or module, a singleton method of a specific object, or at the top-level), this is the object that responds to the method. Note that top-level methods are available to all objects.

An instance variable belongs to whatever object is `self` when the code containing the instance variables is executed.
