
// Converting an integer into a string

DIGIT2CHAR = { 0: '0', 1: '1', 2: '2', 3: '3', 4: '4',
               5: '5', 6: '6', 7: '7', 8: '8', 9: '9' }

function integerToString(integer) {

  if (integer === 0) return '0';

  var isNegative = false;
  if (integer < 0) {
    isNegative = true;
    integer *= -1;
  }

  // determine factor to start with
  var factor = 1;
  while (integer / factor >= 10) {
    factor *= 10;
  }

  var string = '';
  var remainder = integer;

  for (factor; factor >= 1; factor /= 10) {

    var digit = Math.floor(remainder / factor);
    remainder %= factor;

    string += DIGIT2CHAR[digit];
  }

  if (isNegative) string = '-' + string;
  
  return string;
}

// Simpe tests

console.log('Number to string:');

console.log(integerToString(1));
console.log(integerToString(4321));
console.log(integerToString(0));
console.log(integerToString(50));
console.log(integerToString(+50));
console.log(integerToString(-50));
