# Object creation

Since there are no classes, objects can be created directly. If you need only one object, the most straightforward way is by means of an object literal, for example:
```js
var obj = {
  property: 'value',
  method: function () {
    return true;
  }
};
```

If you want it to hold private data, you can use an IIFE. For example:
```js
var counter = (function () {
  var i = 0;

  return {
    get: function () {
      return i;
    },
    set: function (value) {
      i = value;
    },
    increment: function () {
      i += 1;
      return i;
    },
  }
}());
```

If you need more than one object of the same kind, specify a way to create those objects, such that they can share behaviour.

## Factory pattern

A _factory function_ instantiates and returns a new object, thus allowing for the creation of objects based on a pre-defined template.

```js
function makePoint(x, y) {
  // var private = 'private data here';

  return {
    x: x || 0,
    y: y || 0,
    distanceFromOrigin: function () {
      return Math.sqrt(this.x * this.x + this.y * this.y);
    }
  };
}

var point1 = makePoint();
var point2 = makePoint(1, 1);
```

Disadvantages:
* Methods are duplicated on each created object.
* New objects are created as `Object`s, and their origin or specific type is unknown unless that information is explicitly added to the object upon creation.

## Pseudo-classical constructor pattern

A _constructor function_ is supposed to be invoked with the `new` operator, which instantiates a new object behind the scenes and provides it to the constructor function as `this`.

```js
function Point(x, y) {
  // Scope safety
  if (!(this instanceof Point)) {
    return new Point(x, y);
  }

  // State -> each object created from this constructor
  // will have those properties as its own properties
  this.x = x || 0;
  this.y = y || 0;
}

// Shared behaviour -> only the prototype has the property,
// all objects created from it delegate method calls to it
Point.prototype.distanceFromOrigin = function () {
  return Math.sqrt(this.x * this.x + this.y * this.y);
};

var point1 = new Point();     // or: Point()
var point2 = new Point(1, 1); // or: Point(1, 1)
```

All properties set in the constructor function will be own properties of the created object, all properties set on the prototype will be delegated.

> The constructor is responsible for setting up instance-specific data, the prototype contains shared data (i.e., the methods).
-- [2ality](http://2ality.com/2012/01/js-inheritance-by-example.html)

If the created objects don't need a unique state at the beginning, the created object can be empty initially and delegate everything, for example:

```js
function MyObject() {}

myObject.prototype.p1 = ...
myObject.prototype.p2 = ...
```

When reassigning the `prototype` to a new object, make sure to set the otherwise lost `constructor` property.
For example:
```js
Point.prototype = {
  x: 0,
  y: 0,
};

Point.prototype.constructor = Point;
```

## Object linking to other objects (OLOO) pattern

```js
// Create prototype object
var Point = {
  x: 0,
  y: 0,

  init: function(x, y) {
    this.x = x;
    this.y = y;

    return this;
  },

  distanceFromOrigin: function () {
    return Math.sqrt(this.x * this.x + this.y * this.y);
  },
};

var point1 = Object.create(Point);
var point2 = Object.create(Point).init(1, 1);
```

Note that `instanceof` does not work here, because it expects a _constructor_ as argument. Instead, use `Point.isPrototypeOf(point1)`.

# Behind the curtains

### `new`

* A new object is created using the constructor function.
* The constructor function is executed with `this` set to the new object.
* If the constructor function has no explicit return, the new object is returned.

```js
function newOperator(Constructor, args) {
  var object = Object.create(Constructor.prototype);
  var result = Constructor.apply(object, args);

  return result === undefined ? object : result;
}
```

### `Object.create`

```js
function create(object) {
  function F() {};
  F.prototype = object;

  return new F();
}
```
