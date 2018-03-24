# Functions

In JavaScript, functions are first-class citizens.

A function declaration creates a function as well as a variable with the function name, to which the function is assigned as value. That is, the following two are in principle equivalent (however, differing when it comes to [hoisting](scope.md)):
```js
function fnord() {
  // ...
}

var fnord = function () {
  // ...
};
```

## Input

When invoked, the arguments passed to the function are bound to the function parameters. Missing parameters have `undefined` as value, excess parameters are ignored but are accessible within the function body via `arguments`. `arguments` is array-like, but not an array; in order to turn it into an array:
* `Array.prototype.slice.call(arguments)`
* `Array.from(arguments)` (ES6)

ES6 introduces [rest parameter syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters):
```js
function f(a, b, ...rest) {
  // ...
}
```
Which allows for collecting arguments into an array (a real one, unlike `arguments`).
It looks exactly the same as [spread syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax), also introduced by ES6, which allows for expanding an array into its elements, as in `someFunction(...array)`.

ES6 also introduces default values:
```js
function f(start = 0, count = 10, end = start + count) {
  // ...
}

// ES5 pattern for defaults:
function f(start, count, end) {
  start = start || 0;
  count = count || 10;
  end   = end   || start + count;

  // ...
}
```
Default values are used whenever the argument is `undefined` - both when it is left out and when it is explicitly set to `undefined`. 

Arguments are bound to parameters from left to right, independent of default values:
```js
function f(a = 1, b) {
  return [a, b];
}

f();  // [1, undefined]
f(2); // [2, undefined]
```

## Output

Functions without an explicit `return` statement have `undefined` as return value.

## Pure functions

A _pure_ function
* is **referentially transparent**, i.e. given the same inputs, the output is always the same, and
* **does not produce any side effects**.
In particular, this means it doesn't depend on or modify variables outside of its scope.
