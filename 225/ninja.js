// 5

var ninja;

function Ninja() {
 this.swung = true;
}

ninja = new Ninja();

Ninja.prototype = {
 swingSword: function() {
   return this.swung;
 },
};

// console.log(ninja.swingSword());
console.log(ninja.__proto__);
console.log(Ninja.prototype);
console.log(ninja.__proto__ === Ninja.prototype);

// 6

var ninjaA;
var ninjaB;

function Ninja() {
  this.swung = false;
}

ninjaA = new Ninja();
ninjaB = new Ninja();

// Add a swing method to the Ninja prototype which
// returns itself and modifies swung

Ninja.prototype.swing = function () {
  this.swung = true;
  return this;
};

console.log(ninjaA.swing().swung); // true
console.log(ninjaB.swing().swung); // true

// 7

var ninjaA = (function() {
  function Ninja() {};
  return new Ninja();
})();

var ninjaB = new ninjaA.constructor();
// or:
// var ninjaB = Object.create(ninjaA);

console.log(ninjaB.constructor === ninjaA.constructor); // true
