// 1

function toDegrees(radians) {
  var DEGREES_OF_ONE_RADIAN = 180 / Math.PI;
  return radians * DEGREES_OF_ONE_RADIAN;
}

console.log(toDegrees(1));
console.log(toDegrees(3.14));

// 2

var degrees = -180;

console.log(Math.abs(degrees));

// 3

console.log(Math.sqrt(16777216));

// 4

console.log(Math.pow(16, 6));

// 5

var a = 50.72;
var b = 49.2;
var c = 49.86;

console.log(Math.floor(a));
console.log(Math.ceil(b));
console.log(Math.round(c));

// 6

function randomIntegerInRange(min, max) {
  return min + Math.floor(Math.abs(max - min + 1) * Math.random());
  // similar, but results in a non-uniform distribution:
  // return Math.round(min + Math.abs(max - min + 1) * Math.random());
}

console.log(randomIntegerInRange(1, 5));
console.log(randomIntegerInRange(10, 10));
console.log(randomIntegerInRange(300, 200));
