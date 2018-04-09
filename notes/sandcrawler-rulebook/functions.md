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
* is **referentially transparent**, i.e. given the same inputs, the output is always the same, and
* **does not produce any side effects**.

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

## Execution context

Functions initially have no context, but receive one when they are executed.
Thus with every function invocation, the function has access to its _execution context_, through the keyword [`this`](this.md).
This can be either
* an _implicit execution context_ (the global object), or
* an _explicit execution context_ (when invoked with an explicit receiver, or by means of `call` or `apply`).

Binding a function to its execution context happens when the function is executed, not when it is defined. It's thus quite different from lexical variable scope.

Upon _function invocation_, the execution context, and thus `this`, is the global object (`window` in the browser, `global` in Node),
because the function is implicitly called on the global object.
(`this` also refers to the global object outside of any function scope. Unless in strict mode, then it is `undefined`.)

Upon _method invocation_, the execution context, and thus `this`, is the calling object.

```js
var obj = {
  method: function () {
    function whereAmI() {
      console.log(this);
    }

    whereAmI(); // this === global object, because function invocation
  }
};

obj.method(); // this === obj, because method invocation
```
See _context loss_ below.

The execution context can also be changed explicitly by means of `call`, `apply`, and `bind`.
`call` and `apply` explicitly bind a function's execution context to an object when invoking the function:
```js
func.call(obj, arg1, arg2); // this === obj
func.apply(obj, args);      // this === obj

func.call();                // this === global
obj.func.call();            // this === global
```

`bind` permanently binds a function to a provided object. It creates and returns a new function that always uses the provided object as execution context.

Here's roughly how `bind` works:
```js
Function.prototype.bind = function (context) {
  var args = Array.prototype.slice.call(arguments, 1);
  var self = this;

  return function() {
    return self.apply(context, args.concat(Array.prototype.slice.call(arguments));
  };
}
```

### Context loss

The execution context does not propagate to nested functions. That is:
```js
var obj = {
  method: function () {
    function fun() {
      console.log(this);
    }

    fun(); // will log global
  }
};
```

One option is to explicitly bind `this` to a variable and use that variable:
```js
var obj = {
  method: function () {
    var self = this;

    function fun() {
      console.log(self);
    }

    fun(); // will log obj
  }
};
```
Another option is to either explicitly provide the context upon execution:
```js
var obj = {
  method: function () {
    function fun() {
      console.log(this);
    }

    fun.call(this); // will log obj
  }
};
```
Or bind the method to the object:
```js
var obj = {
  method: function () {
    function fun() {
      console.log(this);
    }.bind(this);

    fun(); // will log obj
  }
};
```

Note that context loss is a problem in all nested functions, e.g. also with `forEach`, `map`, `every`, `some`:
```js
var obj = {
  stuff: [],
  method: function () {
    stuff.forEach(function (element) {
      // this === whatever context with which `forEach` calls the callback
    })
  }
}
```
These methods therefore take an optional context argument (e.g. `forEach(callback, [thisArg])`):
 ```js
 var obj = {
   stuff: [],
   method: function () {
     stuff.forEach(function (element) {
       // this === obj
     }, this)
   }
 }
