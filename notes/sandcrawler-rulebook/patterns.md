
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
