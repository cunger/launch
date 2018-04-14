# Objects

Objects are roughly maps from strings to values. A key-value pair is called a _property_, and _methods_ are properties whose values are functions.

Objects are created by constructors (e.g. the pre-defined constructors `Object`, `Array,` etc.) or by means of special literals:

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
* In Node it is `global`.

In the browser, declared variables and functions are added as properties to the global object.
They carry a _Don't Delete_ flag, so they cannot be deleted.
```js
var name = 'Bobbo';
function say() {}

this === window;    // => true

window.name;        // => 'Bobbo'
window.say;         // => function say() {}

delete window.name; // false
delete window.say;  // false
```

Undeclared variables are also added to the global object but can be deleted:
```js
y = 1;

window.y;           // => 1
delete window.y;    // true
```

Node is a modular environment, therefore the execution context in the Node console is different.
Declared variables are local variables within the module's scope.
```js
var name = 'Bobbo';
function say() {}

this === module.exports; // => true

module.exports.name;     // => undefined
module.exports.say;      // => undefined

global.name;             // => undefined
global.say;              // => undefined
```

Undeclared variables are added to the global object:
```js
y = 1;                   // added to global

global.y;                // => 1
module.exports.y;        // => undefined
```
