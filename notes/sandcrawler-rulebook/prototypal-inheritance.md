There are no classes. Objects inherit directly from other objects; more specifically: an object contains a link to another object, its _prototype_, to which it delegates properties. The object itself needs to contain only those properties that are different from its prototype.

Every object has a `__proto__` property that points to its prototype, can can be accessed by `Object.getPrototypeOf(obj)` and checked by `pobj.isPrototypOf(obj)`. For functions this is by default `Function.prototype`, for arrays it's `Array.prototype`, etc.

Note that `foo.isPrototypeOf(bar)` checks whether `foo` is anywhere in the prototype chain of `bar`, while `Object.getPrototypeOf(foo)` returns the object that `foo.__proto__` points to, i.e. it's "direct" prototype.

Every function in addition has a `prototype` property that points to an object that serves as prototype of all object created by that function when invoked as a constructor. That prototype has a `constructor` property that points back to the function. This `constructor` property is also used by the  `instanceof` operator to test whether a value has been created by a particular constructor function (checking whether this constructors `.prototype` is in the prototype chain of the object).
