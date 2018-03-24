
function makeCar(accelerationRate, brakeRate) {
  return {
    speed: 0,
    accelerationRate: accelerationRate,
    brakeRate: brakeRate,
    accelerate: function () {
      this.speed += this.accelerationRate;
    },
    brake: function () {
      this.speed = Math.max(0, this.speed - this.brakeRate);
    },
  };
}

var sedan = makeCar(8, 6);
sedan.accelerate();
console.log(sedan.speed);
sedan.brake();
console.log(sedan.speed);
sedan.brake();
console.log(sedan.speed);

var coupe = makeCar(12, 10);
coupe.accelerate();
console.log(coupe.speed);

var hatchback = makeCar(9, 9);
