# OO Design with Sandy Metz

OO design is concerned with:
* what objects know (their responsibilities)
* who they know (their dependencies)
* what they reveal and how they talk to one another (their interfaces)

The main goal is future-prove code, i.e. code that is easy to change when the unexpected future arrives.
From a practical point of view, changeability is the only design metrics that matters.

Good design improves maximum flexibility by putting off decisions at every opportunity, deferring commitments until more specific requirements arrive.

Writing code that embraces change:
* Depend on behavior, not data.
* Hide data structures: trade indexing into data structures for sending messages to objects
* Enforce single responsibility in classes and methods
* Write high-value tests. This gives you the confidence to refactor constantly.

When deciding between design strategies, it's useful to ask: "What will happen when I'm wrong?"

The key to improving your design skills is to attempt the different techniques, accept your errors cheerfully, remain detached from past design decisions, and refactor mercilessly.

## Refactoring and testing

Refactoring is how you change from one design to the next, and tests free you to refactor with impunity.

Only test what matters. Test everything just once and in the proper place.

Test behavior (the public interface), not internal structure, so that refactoring can change the internal structure and tests indicate whether the intended behavior is still working.

Test first, whenever it makes sense. This helps writing reusable code, because tests are reuse.

## Class-based to message-based

The transition from class-based design to message-based design is a turning point in your design career. Changing the fundamental design question from "I know I need this class, what should it so?" to "I need to send this message, who should respond to it?" is the first step in that direction. You don't send messages because you have objects, you have objects because you send messages.

It's not what an object is that matters, it's what it does. It's not the class of the object that's important, it's the _message_ you plan to send it.

_Let objects speak for themselves._ Objects should contain their own behavior and manage themselves. E.g. no `FooUtils` that knows all about `Foo`s, but rather ask the `Foo`s directly.

## Dependencies

The public interface of a class is a contract that articulates the responsibilities of the class.
Reusable classes are pluggable units of well-defined behavior that have few entanglements.

Manage dependencies so that each class had the fewest possible; a class should know just enough to do its job and not one thing more. It becomes less useful when it knows too much about other objects.

Isolate dependencies, e.g. by defining a wrapper around calls to other objects, like this:
```ruby
# many calls to method from another class
wheel.diameter
wheel.diameter
wheel.diameter
```
=>
```ruby
diameter
diameter
diameter

def diameter
  wheel.diameter
end
```

Choosing dependency direction: depend on I things that change less often than you do (e.g. that are more abstract than concrete).

## Inheritance vs composition

Inheritance is is specialization. At its core, it is a mechanism for automatic message delegation. It defines a forwarding path for not-understood messages.

Modules specify roles that an object can play. They provide a template that an object can use, possibly providing a specialization (e.g. by overriding default methods and re-setting default parameters).

The trick with inheritance, behavior sharing via modules, and composition is to apply each technique to the right problem, in order to lower application costs.

* Use class inheritance for _is-a_ relationships. It is suited for adding functionality to existing classes when you use most of the old code - i.e. when variants are far more alike than different. Keep hierarchies shallow and narrow.
* Use modules when many different objects play a common role (that is not that object's main responsibility).
* Use composition for _has-a_ relationships, when the composed behavior is more than the sum of its parts.

## Duplication and abstraction

It's better to tolerate duplication than to anticipate the wrong abstraction.
Duplication is useful when it supplies independent, specific examples of a general concept that you don't yet understand.
The goal is to quickly maximize the number of whole examples before extracting abstractions from their parts.

If you cannot correctly identify the abstraction, there may not be one, and if no common abstraction exists, then inheritance is not the solution to your design problem.
