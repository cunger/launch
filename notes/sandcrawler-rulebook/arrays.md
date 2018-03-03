# Arrays

_Arrays_ are objects where
* _elements_ are all values that have been assigned to non-negative integer keys, and
* the property `length` is 1 larger than the highest such key (it is therefore not necessarily equal to the number of elements).

Elements should be accessed via `array[index]` instead of dot notation.

Note that negative integers don't count as array indices, thus `array[-1]` will try to look up the key `"-1"`. For accessing the last element in an array, use `array[array.length - 1]` or `array.slice(-1)[0]`.

The `length` property can be explicitly set. Setting it to less than the current length truncates the array. Setting it to more does not create keys for the additional, non-present elements; however, empty slots will be shown when printing the array.

## Methods

Listed are methods already included in ES5.

* `forEach(function)` always returns `undefined`, independent of the return value of the passed callback function.
* `map(function)`
* `some(function)`
* `array.reduce(function, initialValue)`, where `function` is being passed two arguments: the so far accumulated value and the current value.
* `array.slice(startIndex = 0, exclusiveEndIndex = array.length)` -- Also allows negative indices as `startIndex` for access counting from the end of the array.

Mutating:

* `array.pop()` and `array.push(...values)`
* `array.shift()` and `array.unshift(...values)`
* `array.splice(startIndex, deleteCount, values)` removes `deleteCount` elements, starting from `startIndex` and replacing them by `values`.
* `array.sort(function)` -- Note that without providing a comparison function (returning a number <0, 0, >0), the default sort comparison is by string Unicode points, with all array elements will be converted into strings (yes, also numbers!).

(Shallow) copying an array:
```js
var copy = array.slice();
var copy = [...array]; // ES6
```
