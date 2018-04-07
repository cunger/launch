# Closures

When a function is defined, it has access to all variables in its own as well as in its surrounding scopes. This access is retained throughout the life-time of the function, independent in which scope it is invoked. Note that this means access to the identifiers; functions will look up the corresponding values only when invoked.  

> A closure is a function plus the connection to the scope in which the function was created. The name stems from the fact that a closure “closes over” the free variables of a function[, i.e. the variables not declared within the function].

Closures have a few distinct use cases:

### Partial application

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
