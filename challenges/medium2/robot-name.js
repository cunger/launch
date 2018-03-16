// Requirements:

// Robots are created without name.
// When you ask for its name the first time, it creates a random one.
// This name it will keep. Until:
// When the robot is reset to factory settings, its name is wiped.
// When you ask it for its name, it creates a new random one.
// No two robots can have the same name.

// We need:
//
// * constructor Robot() that creates a new robot object
// * robot object needs
//   - name attribute, which is initially undefined
//   - getter getName(): if name is undefined, create a random one
//   - resetToFactorySettings(): sets the name atribute back to undefined
// * storage for names used by all robots
// * random name generator:
//   - generate sequence of n chars
//   - for each char, take a random one from a pre-defined alphabet
//   - prepend 'R' to each sequence, to make sure it doesn't start with a number

// Tests

var robot = Robot();

console.log(robot.name === undefined);
var name = robot.getName();

console.log(name);
console.log(robot.name === name);
console.log(robot.getName() === name);

robot.resetToFactorySettings();

console.log(robot.name === undefined);

var newName = robot.getName();

console.log(newName);
console.log(robot.name === newName);
console.log(newName !== name);

// Solution

function Robot() {
  return {
    name: undefined,

    getName: function () {
      if (!this.name) this.name = generateRandomName(12);
      return this.name;
    },

    resetToFactorySettings: function () {
      this.name = undefined;
    },
  };
}

function generateRandomName(n) {
  var ALPHABET = 'abcdefghijklmnopqrstuvwxyz1234567890';
  var name = 'R';
  var i;
  for (i = 0; i < n; i++) {
    name += ALPHABET[getRandomInt(ALPHABET.length)];
  }

  return name;
}

// from MDN:
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random
function getRandomInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}
