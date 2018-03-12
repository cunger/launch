// Encode //

// Input: string message, number of rails
// Output: encoded string

// Rules:
//
// * Discard spaces.
// * Output string is all upper case, independent of input case?
// * Input message fills the rails in diagonal zigzag.
//   Example: WE ARE DISCOVERED FLEE AT ONCE
//   W . . . E . . . C . . . R . . . L . . . T . . . E
//   . E . R . D . S . O . E . E . F . E . A . O . C .
//   . . A . . . I . . . V . . . D . . . E . . . N . .
//   => WECRLTE + ERDSOEEFEAOC + AIVDEN

console.log(encode("WE ARE DISCOVERED FLEE AT ONCE", 3) === "WECRLTEERDSOEEFEAOCAIVDEN");

// Approach:
//
// Fill all rails at the same time, one position after the next.
// Count up and down, to decide which rail gets the letter.
//   1 rail:  0 0 0 0 0 0 0 0
//   2 rails: 0 1 0 1 0 1 0 1
//   3 rails: 0 1 2 1 0 1 2 1
//   4 rails: 0 1 2 3 2 1 0 1
//   ...
// Do this until all letters have been consumed.
// Then concat the rails.

function encode(message, numberOfRails) {
  message = message.replace(/\s+/g, '').toUpperCase();

  if (numberOfRails < 2) return message;

  var rails = BouncingArray(initArrayOfEmptyArrays(3));

  message.split('').forEach(function (char) {
    rails.push(char);
  });

  return rails.array.reduce(function (string, rail) {
    return string + rail.join('');
  }, '');
}

function initArrayOfEmptyArrays(n) {
  var arr = [];
  var i;
  for (i = 0; i < n; i += 1) {
    arr.push([]);
  }

  return arr;
}

function BouncingArray(array) {
  return {
    array: array,
    index: 0,
    max: array.length - 1,
    direction: 'up',
    goingUp:   function () { return this.direction === 'up'; },
    goingDown: function () { return this.direction === 'down'; },
    atBottom:  function () { return this.index === 0; },
    atTop:     function () { return this.index === this.max; },
    moveUp:    function () { this.index++; },
    moveDown:  function () { this.index--; },
    push: function (value) {
      // insert value
      this.array[this.index].push(value);
      // swap direction if we are at either end of the array
      if (this.atTop())    this.direction = 'down';
      if (this.atBottom()) this.direction = 'up';
      // update index
      this.goingUp() ? this.moveUp() : this.moveDown();
    }
  };
}
