# Arrays

_Arrays_ are objects where
* _elements_ are all values that have been assigned to non-negative integer keys, and
* the property `length` is 1 larger than the highest such key (it is therefore not necessarily equal to the number of elements).

Elements should be accessed via `array[index]` instead of dot notation.

Note that negative integers don't count as array indices, thus `array[-1]` will try to look up the key `"-1"`. For accessing the last element in an array, use `array[array.length - 1]` or `array.slice(-1)[0]`.

The `length` property can be explicitly set. Setting it to less than the current length truncates the array. Setting it to more does not create keys for the additional, non-present elements; however, empty slots will be shown when printing the array.

## Arrays as stacks and queues

The following methods are all mutating:

* `array.pop()` and `array.push(...values)`
* `array.shift()` and `array.unshift(...values)`

## Slice and splice

* `array.slice(startIndex = 0, exclusiveEndIndex = array.length)` returns the subarray as a new array. Also allows negative indices as `startIndex` for access counting from the end of the array. With defaults useful for (shallow) copying an array: `copy = array.slice()`.

* `array.splice(startIndex, deleteCount, values)` removes `deleteCount` elements, starting from `startIndex` and replacing them by `values`. In contrast to `slice`, `splice` is mutating the array.

## List processing

_Iteration:_
* `forEach(function)` always returns `undefined`, independent of the return value of the passed callback function.
```js
array.forEach(function (element) {
  if (!func(element)) {
    return false; // This is the return value of the anonymous function and will be ignored.
  }
}); // ==> undefined
```
Also, `forEach` always iterates over the whole list; the only way to break out is by throwing an error.

_Filter and transform:_
* `filter(function)` returns a new array.
* `map(function)` also returns a new array.
* `array.sort(function)` sorts the array in place, i.e. is mutating. Note that without providing a comparison function (returning a number <0, 0, >0), the default sort comparison is by string Unicode points, with all array elements will be converted into strings (yes, also numbers!).

_Checks:_
* `some(function)`
* `every(function)`

The callback function passed to `forEach`, `filter`, `map`, `some` and `every` is called with three arguments: the current element, its index, and the array over which is iterated.

_Folding:_
* `array.reduce(function, initialValue?)`, where `function` is being passed four arguments: the so far accumulated value, the current element, the index of the current element, and the array that is processed. If the `initialValue` is not given, `reduce` uses the first element of the array as initial value.
* Analogously for `reduceRight`.
