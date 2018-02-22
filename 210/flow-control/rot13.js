// Rot 13:
// Change each character of the English alphabet to the one 13 positions later.
// * The alphabet wraps at the end, for example 20 -> 14 (in a 26-character alphabet).
// * Transformation needs to preserve case.
// Don't modify characters that are not in the English alphabet.

function rot13(string) {
  var ROTATION = 13;
  var UPPER_A  = 65;
  var UPPER_Z  = 90;
  var LOWER_A  = UPPER_A + 32;
  var LOWER_Z  = UPPER_Z + 32;

  function isLower(char) {
    return char >= LOWER_A && char <= LOWER_Z;
  }

  function isUpper(char) {
    return char >= UPPER_A && char <= UPPER_Z;
  }

  function rotate(char, start, end) {
    var result = char + ROTATION;

    if (result > end) {
      result = result - end + start - 1;
    }

    return result;
  }

  var rotated = '';
  var i;

  for (i = 0; i < string.length; i++) {
    var char = string[i].charCodeAt(0);
    var newChar = char;

    if (isLower(char)) {
      newChar = rotate(char, LOWER_A, LOWER_Z);
    } else if(isUpper(char)) {
      newChar = rotate(char, UPPER_A, UPPER_Z);
    }

    rotated += String.fromCharCode(newChar);
  }

  return rotated;
}

// Test

var testString = 'Teachers open the door, but you must enter by yourself.';
console.log(rot13(testString) === 'Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.');
console.log(rot13(rot13(testString)) === testString);
