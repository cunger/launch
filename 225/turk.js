console.log(this);               // {}
console.log(this === global);    // false
console.log(this === undefined); // false

var turk = {
  firstName: 'Christopher',
  lastName: 'Turk',
  fullName: this.firstName + ' ' + this.lastName,
  occupation: 'Surgeon',
  getOccupation: function () {
    return this.firstName + ' ' + this.lastName + ' is a ' + this.occupation + '.';
  },
  getBoundOccupation: function () {
    return this.firstName + ' ' + this.lastName + ' is a ' + this.occupation + '.';
  }.bind(this)
}

turk.getDescription = function() {
  return this.firstName + ' ' + this.lastName + ' is a ' + this.occupation + '.';
};

console.log(turk.fullName);              // undefined undefined
console.log(turk.getDescription());      // Christopher Turk is a Surgeon.
console.log(turk.getOccupation());       // Christopher Turk is a Surgeon.
console.log(turk.getBoundOccupation());  // undefined undefined is a undefined.
