
### Boolean checks

```js
// Does an array contain an element?
array.indexOf(element) !== -1; // ES5
array.includes(element);       // ES6

// Does an object contain a key?
object.hasOwnProperty('key');

// Is a value numeric?
function isNumeric(value) {
  return typeof(value) === 'number' && !isNaN(value);
}
```

### Iterating over an object

```js
Object.keys(object).forEach(function (key) {
  // ...
});

var values = Object.keys(object).map(key => object[key]);
// ES2017: Object.values(object)
```

### Shallow copying and merging of objects

```js
var object1 = ...
var object2 = ...

var copy1  = Object.assign({}, object1);
var merged = Object.assign(copy1, object2);
```

`Object.assign(target, ...sources)` copies the values of all enumerable own properties of the source objects
to the target object and returns `target`.

### Sorting numbers

```js
function sortAscending(array) {
  return array.slice().sort(function (x, y) { return x - y });
}

function sortDescending(array) {
  return array.slice().sort(function (x, y) { return y - x });
}
```

### Collection pipes

Counting occurrences:

```js
array.reduce(function (counts, element)) {
  counts[element] = (counts[element] || 0) + 1;
  return counts;
}, {});
```

Finding the minimum:

```js
array.reduce(function (currentMin, currentElement) {
  if (currentElement < currentMin) {
    return currentElement;
  } else {
    return currentMin;
  }
});
```

### Current date and time

```js
var today = new Date(); // 2018-02-26T08:29:07.229Z, type: object
var today = Date();     // "Mon Feb 26 2018 09:29:35 GMT+0100 (CET)", type: string
var now   = Date.now(); // 1519633775731, type: number

var year  = new Date().getFullYear();
```

### Random integer within range

```js
// Returns a random integer between min and max (inclusive)
function random(min, max) {
  return min + Math.floor(Math.abs(max - min + 1) * Math.random());
}
```

### Enum-like objects

```js
const Weekday = Object.freeze({ Monday: 1, Tuesday: 2, ... });
```
