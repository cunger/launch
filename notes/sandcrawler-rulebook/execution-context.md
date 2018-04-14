# Execution context

Functions initially have no context, but receive one when they are executed.
Thus with every function invocation, the function has access to its _execution context_, through the keyword [`this`](this.md).

Binding a function to its execution context happens when the function is executed, not when it is defined.
Since functions are first-class citizens, they can be removed from their objects, passed around, and executed in a variety of different contexts.

## Implicit execution context

Upon **function invocation** (e.g. `smile()`), the execution context, and thus `this`, is the global object, because the function is implicitly called on the global object. That is, `window` in the browser environment, and `global` in Node (and `module.exports` within a module).

`this` also refers to the global object outside of any function scope. Unless in strict mode, then it is `undefined`.

Upon **method invocation** (e.g. `person.smile()`), there is an explicit receiver; the execution context, and thus `this`, is the calling object.
Just don't get confused with _explicit_ and _implicit_: When executing `person.smile()`, the execution context of `smile` is implicitly bound to `person`, as this is the explicit receiver of the function call.

```js
var obj = {
  method: function () {
    function whereAmI() {
      console.log(this);
    }

    whereAmI();    // this === global object, because function invocation
  }
};

obj.method();      // this === obj, because method invocation

func = obj.method;
func();            // this === global object, because function invocation
```
See also _context loss_ below.

## Explicit execution context

The execution context can also be changed explicitly by means of `call`, `apply`, and `bind`.
`call` and `apply` explicitly bind a function's execution context to an object when invoking the function:
```js
func.call(obj, arg1, arg2); // this === obj
func.apply(obj, args);      // this === obj

func.call();                // this === global
obj.func.call();            // this === global
```

`bind` permanently binds a function to a provided object. It creates and returns a new function that always uses the provided object as execution context. (Except for when the function is called as a constructor with `new`, then `this` will be the newly created object.)

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
That is, `bind` uses _partial application_.

## The value of `this`

> `this` is the current execution context of a function

Functions are initially unbound, but dynamically bound to a context object at execution time.
In order to know what `this` points to, you have to answer: What is the calling object?

* When a function is defined on the global object and called without an explicit receiver (`greet(name)`),
`this` is the global object.
* When a function is called with an explicit receiver (`object.greet()`), `this` is the calling object.
* When a function is called by means of `call` or `apply`, `this` is explicitly provided.
* When a constructor function is called with the `new` operator (`new Greeting()`), `this` refers to the newly created object.

Binding a function to an object (`greet.bind(object)`) returns a new function, for which `this` always refers to that object.

## Context loss

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
```
