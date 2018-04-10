There are no classes. Objects inherit directly from other objects; more specifically: an object contains a link to another object, its _prototype_, to which it delegates properties. The object itself needs to contain only those properties that are different from its prototype.

Every object has an internal property `[[prototype]]` that points to the reference of another object, its prototype. It can be accessed by `__proto__` or (for browser compatibility reasons much preferred) `Object.getPrototypeOf(obj)` and checked by `pobj.isPrototypOf(obj)`. For functions this is by default `Function.prototype`, for arrays it's `Array.prototype`, etc.

Note that `foo.isPrototypeOf(bar)` is transitive, i.e. checks whether `foo` is anywhere in the prototype chain of `bar`, while `Object.getPrototypeOf(foo)` returns the object that `foo.__proto__` points to, i.e. it's "direct" prototype.

When trying to access a property or method of an object, JavaScript first checks the object itself for it, and if not successful, walks through the prototype chain until it finds it or runs out of prototypes. The end of the prototype chain is `Object.prototype` (which implements methods like `toString`, `valueOf`, `hasOwnProperty`, `isPrototypeOf`, etc., and which has no prototype).
Methods found on a prototype instead of the object are still called in the context of the calling object, of course.

This is how behaviour is shared, and how objects can override prototype behaviour with more specific implementations.

In order to check whether a property exists on the object as opposed to one of its prototypes, use `obj.hasOwnProperty('key')` or `Object.getOwnPropertyNames(obj)`.

Every function in addition has a `prototype` property that points to an object that serves as prototype of all object created by that function when invoked as a constructor (and is the object where all shared behaviour of those created objects is stored). That prototype has a `constructor` property that points back to the function. This `constructor` property is also used by the  `instanceof` operator to test whether a value has been created by a particular constructor function (checking whether this constructors `.prototype` is in the prototype chain of the object).

## Example

```js
function Dolphin(name) {
  this.name = name;
}

const flipper = new Dolphin('flipper');
```

![Prototype hierarchy with Dolphin](proto1.png)

```js
function Animal() {}

Dolphin.prototype = Object.create(Animal.prototype);
Dolphin.prototype.constructor = Dolphin; // otherwise `flipper instanceof Animal` won't work

// Never do: Dolphin.prototype = Animal.prototype;
// Because then they're the same object instead of being in a hierarchy,
// so all methods added to Dolphin will end up on Animal as well (and thus
// also on all objects that inherit from Animal).
```

![Prototype hierarchy with Dolphin and Animal](proto2.png)
