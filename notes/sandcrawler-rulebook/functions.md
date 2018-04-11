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

When a function created by a function declaration is called, we speak of _function invocation_; when a function created as a property of an object (i.e. a _method_) is called, we speak of _method invocation_.

A _pure_ function
* is referentially transparent, i.e. given the same inputs, the output is always the same, and
* does not produce any side effects.

In particular, this means it doesn't depend on or modify variables outside of its scope.

For _constructor functions_, see [object creation](object-creation.md).

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

## Closures

When a function is defined, a _closure_ is created that.

> A closure is the combination of a function and the lexical environment within which that function was declared.
-- MDN

> A closure is a function plus the connection to the scope in which the function was created. The name stems from the fact that a closure “closes over” the free variables of a function[, i.e. the variables not declared within the function].

Closures thus preserve the function's access to all variables in its own as well as in its surrounding scopes. This access is retained throughout the life-time of the function, independent in which scope it is invoked. Note that this means access to the identifiers; functions will look up the corresponding values only when invoked.  

Closures have a few distinct use cases.

### Partial function application

Partial function application is the process of applying a function to some of its parameters and return a function that expects the rest of the parameters.

_Example:_
```js
function fMap(fn, list) {
  return list.map(fn);
}

function fMapWith(fn) {
  return function (list) {
    return fMap(fn, list);
  }
}

const incrementElements = fMapWith(x => x + 1);

incrementElements([1, 2, 3]);
incrementElements([1, 3, 5, 7]);
```

Partial application like this relies on the facts that JavaScript supports closures (so the returned function can access `fn`, even when invoked in a different context) and that functions are first-class citizens, i.e. can be arguments and return values.

A generic version for arbitrarily many arguments looks like this (very similar to what `bind` does):
```js
function partial(fn) {
  var args = Array.prototype.slice.call(arguments, 1);
  var self = this;

  return function() {
    return fn.apply(self, args.concat(Array.prototype.slice.call(arguments)));
  };
}
```

Finally, _currying_ is the process as transforming a function of _n_ arguments such that it can be called as a chain of _n_ functions each with a single argument. This has no real use case in JavaScript, though. Cf. [Ben Alman](http://benalman.com/news/2012/09/partial-application-in-javascript/):
* In functional languages like Haskell, every function is inherently curried, i.e. takes exactly one argument. Applying a function to several arguments is basically syntactic sugar for chained applications of a curried function.
* In JavaScript, function application is defined to take all arguments, i.e. functions are inherently uncurried.   

### Private data

```js
// From Douglas Crockford

var digitName = function () {
  var names = ['zero', 'one', 'two', 'three', 'four',
               'five', 'six', 'seven', 'eight', 'nine'];

  return function (n) {
    return names[n];
  };
}();
```

Douglas Crockford's power constructor:

```js
function powerConstructor() {
  var that = Object.create(prototypeObject);
  var privateData = 'secret';

  that.priviledgedMethod = function () {
    // ... privateData ...
  };

  return that;
}
```

IIFEs are a way to create temporary, private scope.
