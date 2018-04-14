# Prototypes

There are no classes; objects inherit directly from other objects. More specifically: Every object has an internal [property](http://2ality.com/2012/10/javascript-properties.html) `[[Prototype]]` that points to another object, its _prototype_. It can be accessed by `__proto__` or (for browser compatibility reasons much preferred) `Object.getPrototypeOf(obj)` and checked by `pobj.isPrototypOf(obj)`. For functions this is by default `Function.prototype`, for arrays it's `Array.prototype`, etc.

Note that `foo.isPrototypeOf(bar)` is transitive, i.e. checks whether `foo` is anywhere in the prototype chain of `bar`, while `Object.getPrototypeOf(bar)` returns the object that is the value of `bar`'s internal `[[Prototype]]`' property, i.e. it's immediate prototype.

The **prototype chain** of an object is a sequence of objects starting with the object referenced by the object's internal `[[Prototype]]` property, followed by the reference of that object's `[[Prototype]]` property, and so on, until the referenced object is `Object.prototype`, which is each object's prototype and does not have a prototype itself. `Object.prototype` implements methods like `toString`, `valueOf`, `hasOwnProperty`, `isPrototypeOf`, etc.

Behaviour is shared between objects by **delegation**: When trying to access a property of an object, JavaScript first checks the object itself, and if it does not find a property of that name, walks through the prototype chain until it finds it or runs out of prototypes. An object thus delegates each property that is does not specify itself to the first object on its prototype chain that does specify it. At the same time it can override prototype behaviour by specifying the property as its own.

In order to check whether a property exists on the object as opposed to one of its prototypes, use `obj.hasOwnProperty('key')` or `Object.getOwnPropertyNames(obj)`.

## Constructor functions  

Every function in addition has a `prototype` property that points to an object that serves as prototype for all objects created by that function when invoked as a constructor (and is the object where all shared behaviour of those created objects is stored). That prototype has a `constructor` property that points back to the function. This `constructor` property is also used by the `instanceof` operator to test whether a value has been created by a particular constructor function (checking whether this constructors `prototype` is in the prototype chain of the object).

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
