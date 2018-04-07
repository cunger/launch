
> `this` is the current execution context of a function

Functions are initially unbound, but dynamically bound to a context object at execution time.
In order to know what `this` points to, you have to answer: What is the calling object?

* When a function is defined on the global object and called without an explicit receiver (`greet(name)`),
`this` is the global object.
* When a function is called with an explicit receiver (`object.greet()`), `this` is the calling object.
* When a function is called by means of `call` or `apply`, `this` is explicitly provided.
* When a constructor function is called with the `new` operator (`new Greeting()`), `this` refers to the newly created object.

Binding a function to an object (`greet.bind(object)`) returns a new function, for which `this` always refers to that object.

_Function invocation_

In function invocation, the execution context, and thus `this`, is the global object (`window` in the browser, `global` in Node).
Because the function is implicitly called on the global object.

`this` also refers to the global object outside of any function scope.

In strict mode, `this` in these cases is `undefined`.

_Method invocation_

## `call` and `apply`

`call` and `apply` invoke a function with an explicit execution context.

> If the first argument is not passed, the value of `this` is bound to the global object.
-- MDN


```js
func.call();     // this === global
obj.func.call(); // this === global
```

## `bind`

```js
var slice = Function.prototype.apply.bind(Array.prototype.slice);

slice(arguments);
```
