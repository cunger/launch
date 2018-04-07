var Vehicle = {
  doors: 4,
  wheels: 4,
}

var sedan = Object.create(Vehicle);
var coupe = Object.create(Vehicle);
coupe.doors = 2;

console.log(sedan);
console.log(coupe);

console.log(sedan.hasOwnProperty('doors'));
console.log(coupe.hasOwnProperty('doors'));

var Coupe = Object.create(Vehicle);

var Motorcycle = Object.create(Vehicle);
Motorcycle.wheels = 2;

var otherCoupe = Object.create(Coupe);
var motorcycle = Object.create(Motorcycle);

console.log(otherCoupe.wheels);
console.log(motorcycle.wheels);

console.log(Coupe.isPrototypeOf(otherCoupe));
console.log(Vehicle.isPrototypeOf(otherCoupe));
console.log(Motorcycle.isPrototypeOf(motorcycle));
console.log(Vehicle.isPrototypeOf(motorcycle));
