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

Keep in mind that `{` at the beginning of a line is always interpreted as a block statement, not as an object. For example:
```js
{ foo: 'bar' }['foo']; // ==> ['foo']
{} + {};               // ==> +{}
                       // ==> NaN
```

`Object.freeze(obj)` prevents all properties of `obj` to be re-assigned. Note that the references of those properties are frozen; their values can, however, still be mutated. Frozen objects cannot be unfrozen.
