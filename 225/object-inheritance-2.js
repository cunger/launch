function Vehicle() {}

Vehicle.prototype = {
  door: 4,
  wheels: 4,
}

Vehicle.prototype.constructor = Vehicle;

var sedan = new Vehicle();
var coupe = new Vehicle();
coupe.doors = 2;

console.log(sedan);
console.log(coupe);

console.log(sedan instanceof Vehicle);
console.log(coupe instanceof Vehicle);

console.log(sedan.hasOwnProperty('doors'));
console.log(coupe.hasOwnProperty('doors'));

function Coupe() {}

Coupe.prototype = new Vehicle();
Coupe.prototype.doors = 2;
Coupe.prototype.constructor = Coupe;

function Motorcycle() {}

Motorcycle.prototype = Object.create(Vehicle.prototype); // same as: new Vehicle()
Motorcycle.prototype.doors = 0;
Motorcycle.prototype.wheels = 2;
Motorcycle.prototype.constructor = Motorcycle;

var otherCoupe = new Coupe();
var motorcycle = new Motorcycle();

console.log(motorcycle);
console.log(motorcycle instanceof Motorcycle);
console.log(motorcycle instanceof Vehicle);

console.log(otherCoupe);
console.log(otherCoupe instanceof Coupe);
console.log(otherCoupe instanceof Vehicle);
