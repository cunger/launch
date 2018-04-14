# Private data

IIFEs are a way to create temporary, private scope, and closures turn that _temporary_ into _as long as a reference to the function lives_.

Here's an example from Douglas Crockford:
```js
var digitName = function () {
  var names = ['zero', 'one', 'two', 'three', 'four',
               'five', 'six', 'seven', 'eight', 'nine'];

  return function (n) {
    return names[n];
  };
}();
```

## Private data in objects

Private data in a function:
```js
var func = function () { // open IIFE
  var private1 = ...;
  var private2 = ...;

  return function () {
    // use private stuff
  }
}();
```

Private data in a singleton object:
```js
var obj = function () { // open IIFE
  // private data
  var counter = 0;

  // public data
  return {
    publicField: true;
    publicMethod: function () {
      // ...
    }
  };
}();
```

Private data in an object via its constructor:
```js
function Constr() {
  var that = this; // in order to available to private functions

  // private data
  var counter = 0;

  function privateFunction() {
    counter++;

    // public data
    that.publicField  = ...;
    that.publicMethod = ...;
  }

  // other public data
  that.anotherPublicField = ...;
}
```

## The module pattern

```js
var Module = (function() {
  var private1 = 'foo';
  var private2 = 0;

  function privateMethod() {
      // ...
  }

  return {
    publicProperty: '',
    publicMethod: function(args) {
        // do something
    },
    privilegedMethod: function(args) {
        // do something with private data
    }
  };
})();
```

## Alternatives

For data that is not secret but simply should not be relied on when using an API,
it can be enough to follow the convention to start names of private properties
with an underscore, e.g. `_counter`. This way, they're accessible for testing
and inspection, while others know that they're not meant as public interface.
