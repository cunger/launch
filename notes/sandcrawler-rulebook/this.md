
> `this` is the current execution context of a function

Functions are initially unbound, but dynamically bound to a context object at execution time.
In order to know what `this` points to, you have to answer: What is the calling object?

* When a function is defined on the global object and called without an explicit receiver (`greet(name)`),
`this` is the global object.
* When a function is called with an explicit receiver (`object.greet()`), `this` is the calling object.
* When a function is called by means of `call` or `apply`, `this` is explicitly provided.
* When a constructor function is called with the `new` operator (`new Greeting()`), `this` refers to the newly created object.

Binding a function to an object (`greet.bind(object)`) returns a new function, for which `this` always refers to that object.
