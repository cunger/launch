
# OOP

It's all about **objects**, their state and behavior. **State** is captured by instance variables and usually differs from object to object. **Behavior** is captured by methods and is usually the same across objects of the same kind.

**Classes** group objects with the same attributes and behaviors, and thus provide a way to define attributes and behaviors of objects in one place. Objects are then created from classes, inheriting the functionality defined in the class.

> A class is like a blueprint that describes the properties and behavior of a type of object. An instance of a class then is an actual object of that class.

Ruby is very consistent in its take on OOP: everything is an object, including what are primitives in many other OOP languages, like strings, integers, Boolean values, and `nil`, as well as classes, modules, and so on. When it comes to instantiation, variable accessibility, and so on, classes behave pretty much like objects, because they are objects. What distinguishes classes is that they are the only objects that can spawn other objects.

OOP is one way to realize **encapsulation** and **inheritance**.

## Encapsulation

Encapsulation refers to exposing only that which is necessary to expose, and hiding everything else.

In Ruby, methods are by default public in the sense that they are accessible from anywhere as long as the class or object name is known. Ruby provides two ways to hide methods, so they are no longer accessible from everywhere:

* The method `private` makes method definitions private, i.e. they are accessible only within the class.
* The method `protected` makes method definitions protected, i.e. they are accessible only across instances of that class.

Encapsulation has at least two advantages:

* Methods that provide implementation details can be hidden, so they cannot be used anywhere outside of the class. This makes it possible to later change those methods without possibly breaking other parts of the program that use this method.
* Exposing as little as necessary goes a long way in avoiding name clashes.

## Inheritance

Grouping things into different classes of objects provides a natural concept of inheritance, that allows for re-using functionality, while being able to override more general functionality for more specific cases.

Inheritance is a way to inherit behavior from another class or module. All instance methods defined in a class or module from which a class `C` inherits will become instance methods of all instances of `C`. Thus the current object has access to all instance methods defined somewhere in the inheritance hierarchy. Inheritance thus allows for re-using methods and thereby avoiding duplicate code.

```ruby
class Animal
  def move
    puts "I'm moving!"
  end
end

class Dolphin < Animal
end
```

As a subclass, `Dolphin` inherits all methods defined in `Animal`, `move` can therefore be called on an instance of `Dolphin`, as in the following example.

```ruby
Dolphin.new.move
"I'm moving!"
=> nil
```

Inheritance also enables **polymorphism**, i.e. allows objects to be of different kinds (and accordingly adopt different behaviors).

## Single inheritance

A class can be direct subclass of exactly one other class. Single inheritance is a problem when a class is supposed to inherit behavior from two or more classes which are not (and should not be) in a subclass relation.

For example, we could have two classes `SwimmingObject` and `FlyingObject` for objects that swim and fly, respectively. A class `Duck` should inherit from both classes, as ducks can both swim and fly. However, subclassing allows for only one direct superclass, thus we can have either `class Duck < SwimmingObject` or `class Duck < FlyingObject`.

The only option to inherit from both by means of class inheritance would be to define `FlyingObject` as subclass of `SwimmingObject` or vice versa. But this means that a class inheriting from one will always also inherit from the other, which gets us into trouble as soon as we want objects that can fly but not swim (e.g. chicken) as well as objects that can swim but not fly (e.g. penguins).

## Modules

Modules are collections of methods and constants, and a class can gain access to those by including the module. Most importantly, a class can include arbitrarily many modules. Thus, when defining swimming- and flying-related methods in modules instead of classes, as in the following code, the class `Duck` can inherit those methods by including both modules. Now we can also have a class `Chicken` that includes `Flying` but not `Swimming`, and a class `Penguin` that includes `Swimming` but not `Flying`.

```ruby
module Swimming
end

module Flying
end

class Duck
  include Swimming
  include Flying
end

class Chicken
  include Flying
end

class Penguin
  include Swimming
end
```

Classes and modules are collections of methods and constants, and classes are, in fact, modules. Classes are instances of `Class`, modules are instances of `Module` (with `Class` being a direct subclass of `Module`).

Technically there are two differences between classes and modules:

* A class can spawn instances, a module cannot.
* A class can inherit from only one other class, but from as many modules as wanted.

On a conceptual level, classes define attributes and behaviors of objects that are of the same kind, with class inheritance capturing _is a_ relationships. Modules define behavior and functionality that can be shared among objects of different kinds, with module inclusion usually capturing _has a_ relationships.
