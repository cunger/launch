# Objects

Objects are created by the corresponding constructors (`Object`, `Array,` etc.) or by means of special literals:

* Object literals: `{}`
* Array literals: `[]`
* Regular expression literals: `//`

Property names can be any valid string, property values can be any valid expression.

Properties can be accessed in two way:

* _dot notation_: `object.property`, upon which the string `"property"` will be looked up among the property names of the object.
* `object[key]`, where `key` can be any expression, which will be evaluated, with the return value being coerced into a String. If that string does not exist among the keys, it returns `undefined`.

To delete a property, use `delete object.property;`.

Object properties can capture _state_ as well as _behaviour_ (in object _methods_, i.e. properties that happen to have a function as value).
Objects thus organize code by putting related data and functions together.

Keep in mind that `{` at the beginning of a line is always interpreted as a block statement, not as an object. For example:
```js
{ foo: 'bar' }['foo']; // ==> ['foo']
{} + {};               // ==> +{}
                       // ==> NaN
```

`Object.freeze(obj)` prevents all properties of `obj` to be re-assigned. Note that the references of those properties are frozen; their values can, however, still be mutated. Frozen objects cannot be unfrozen.

## Global object

When running, JavaScript creates a global object, which serves as implicit execution context.
* In the browser this is `window` (standardized in the browser's DOM, not in ECMAScript).
* In Node it is `global`. (Note, however, that Node is a modular environment and `this` in modules points to `module.export`.)

Properties that have been declared on the global object are created with a _Don't Delete_ flag, so they cannot be deleted.
```js
// declared and added to the global object
var x = 1;
function f () {}

// not declared, but added to the global object
y = 1;

delete global.x; // false
delete global.f; // false
delete global.y; // true
```
