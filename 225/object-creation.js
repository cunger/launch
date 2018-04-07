var fnord = {
  blubb: 'blubb',
  blah: (function () {
    console.log(this);
  }).bind(this)()
};

// {}

//// Object.create ////

function createObject(obj) {
  // return {
  //   __proto__: obj,
  // };

  function F() {}
  F.prototype = obj;

  return new F();
}

Object.prototype.begetObject = function () {
  return createObject(this);
}

var foo = {
  a: 1
};

var bar = createObject(foo);
console.log(foo.isPrototypeOf(bar)); // true

var baz = foo.begetObject();
console.log(foo.isPrototypeOf(baz)); // true

//// new ////

function neww(constructor, args) {
  var obj = Object.create(constructor.prototype);
  var result = constructor.apply(obj, args);

  return result === undefined ? obj : result;
}

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

Person.prototype.greeting = function() {
  console.log('Hello, ' + this.firstName + ' ' + this.lastName);
};

var john = neww(Person, ['John', 'Doe']);
john.greeting();               // Hello, John Doe
console.log(john.constructor); // Person(firstName, lastName) {...}


/// OLOO ////

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

console.log(point1);
console.log(point1.distanceFromOrigin());
console.log(point2);
console.log(point2.distanceFromOrigin());
console.log(point1 instanceof Point);
console.log(point2 instanceof Point);
