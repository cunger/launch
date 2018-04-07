# Object creation

object literals if only one object is needed

## Factory pattern

```js
function makePoint(x, y) {
  // var private = ...

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
* New objects are created as `Object`s, and their origin or specific type is unknown unless that information is explicitly added.

Advantage:
* Allows for private data.

## Pseudo-classical constructor pattern

```js
function Point(x, y) {
  // Scope safety
  if (!(this instanceof Point)) {
    return new Point(x, y);
  }

  // State  
  this.x = x || 0;
  this.y = y || 0;
}

// Shared behaviour
Point.prototype.distanceFromOrigin = function () {
  return Math.sqrt(this.x * this.x + this.y * this.y);
};

var point1 = new Point();     // or: Point()
var point2 = new Point(1, 1); // or: Point(1, 1)
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

Disadvantage:
* `instanceof` does not work, because it expects a _constructor_ as argument.

# Behind the curtains

## `new`

* A new object is created using the constructor function.
* The constructor function is executed with `this` set to the new object.
* If the constructor function has no explicit return, the new object is returned.

```js
new Constructor(args)

{
  var object = Object.create(Constructor.prototype);
  var result = Constructor.apply(object, args);

  return result === undefined ? object : result;
}
```

## `Object.create`

```js
function create(object) {
  function F() {};
  F.prototype = object;

  return new F();
}
```
