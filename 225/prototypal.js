// 1

function getDefiningObject(object, propKey) {
  var proto = object;

  while (true) {
    if (proto === null || proto.hasOwnProperty(propKey)) {
      return proto;
    }

    proto = Object.getPrototypeOf(proto);
  }
}

var foo = {
  a: 1,
  b: 2,
};

var bar = Object.create(foo);
var baz = Object.create(bar);
var qux = Object.create(baz);

bar.c = 3;

console.log(getDefiningObject(qux, 'a') === foo);     // true
console.log(getDefiningObject(qux, 'c') === bar);     // true
console.log(getDefiningObject(qux, 'e'));             // null

// 2

function shallowCopy(object) {
  var copy = Object.create(Object.getPrototypeOf(object));

  Object.getOwnPropertyNames(object).forEach(function (prop) {
    copy[prop] = object[prop];
  });

  return copy;
}

var foo = {
  a: 1,
  b: 2,
};

var bar = Object.create(foo);
bar.c = 3;
bar.say = function() {
  console.log('c is ' + this.c);
};

var baz = shallowCopy(bar);
console.log(baz.a);       // 1
baz.say();                // "c is 3"

var a = {
  hasOwnProperty: 1,
};

var b = shallowCopy(a);
console.log(b.hasOwnProperty);

// 3

function extend(destination) {
  Array.prototype.slice.call(arguments, 1).forEach(function (source) {
    Object.getOwnPropertyNames(source).forEach(function (prop) {
      destination[prop] = source[prop];
    });
  });

  return destination;
}

var foo = {
  a: 0,
  b: {
    x: 1,
    y: 2,
  },
};

var joe = {
  name: 'Joe'
};

var funcs = {
  sayHello: function() {
    console.log('Hello, ' + this.name);
  },

  sayGoodBye: function() {
    console.log('Goodbye, ' + this.name);
  },
};

var object = extend({}, foo, joe, funcs);

console.log(object.b.x);          // 1
object.sayHello();                // "Hello, Joe"
