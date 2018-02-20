
// Converting a string into an integer.
// Takes an arbitary string and interprets all non-digit characters as 0.

function stringToInteger(string) {
  var integer = 0;

  // check for a sign at the beginning of the string

  var signFactor = 1;

  if (string.startsWith('-')) {
    signFactor = -1;
    string = string.substring(1);
  } else if (string.startsWith('+')) {
    string = string.substring(1);
  }

  // iterate through the string from back to forth

  for (var i = 0; i < string.length; i++) {

    var position = string.length - i - 1;
    var multiple = Math.pow(10, i);

    var digit = 0;
    switch (string[position]) {
      case '1': digit = 1; break;
      case '2': digit = 2; break;
      case '3': digit = 3; break;
      case '4': digit = 4; break;
      case '5': digit = 5; break;
      case '6': digit = 6; break;
      case '7': digit = 7; break;
      case '8': digit = 8; break;
      case '9': digit = 9; break;
    }

    integer += digit * multiple;
  }

  return signFactor * integer;
}

// Simple tests

console.log('String to number:');

console.log(stringToInteger('1234'));
console.log(stringToInteger('023'));
console.log(stringToInteger('+5'));
console.log(stringToInteger('-100'));
