
// Rules:

// Ranges are separated by comma.
// Each range can be:
// * x
// * x:y
// * x:y:z
// * and so on
// (with any delimiter in [':', '-', '..'])
// Each number specifies only the significant part w.r.t the previous number.

// Tests:

console.log(equals(expand('1,3,7,2,4,1'), [1, 3, 7, 12, 14, 21]) === true);
console.log(equals(expand('1-3,1-2'), [1, 2, 3, 11, 12]) === true);
console.log(equals(expand('1:3,1..2'), [1, 2, 3, 11, 12]) === true);
console.log(equals(expand('1:5:2'), range(1, 12)) === true);
console.log(equals(expand('1-5:2'), range(1, 12)) === true);
console.log(equals(expand('7-5:2'), range(7, 22)) === true);
console.log(equals(expand('104-2'), range(104, 112)) === true);
console.log(equals(expand('104-02'), range(104, 202)) === true);
console.log(equals(expand('104-0'), range(104, 110)) === true);
console.log(equals(expand('545,64:11'), [545].concat(range(564, 611))) === true);

// Approach:

// Split string into range strings.
// For each range string:
//   * Split it into significant-part-of-numbers.
//   * If there is only one: add expansion of it to the result.
//   * Otherwise: Iterate from i = 1 to end:
//       Add range from expanded i-1 to expanded i to the result.
//       e.g. 3:5   => range(3, 5)
//            3:5:1 => range(3, 5) + range(5, 11) // and take care that 5 is not added twice

function expand(string) {
  var numbers = [];
  var rangeStrings = string.split(',');
  var previousNumber;
  var expandedRange;

  rangeStrings.forEach(function (rangeString) {
    expandedRange  = toRange(rangeString, previousNumber);
    previousNumber = expandedRange[expandedRange.length - 1];
    numbers.push(...expandedRange);
  })

  return numbers;
}

function toRange(string, previousNumber) {
  var numbers = [];
  var numberStrings = string.split(/:|\-|\.\./g);

  if (numberStrings.length == 1) {
    return [ getFullNumber(previousNumber, numberStrings[0]) ];
  }

  var i;
  for (i = 1; i < numberStrings.length; i += 1) {
    start = getFullNumber(previousNumber, numberStrings[i - 1]);
    end   = getFullNumber(start, numberStrings[i]);
    if (i > 1) start += 1;
    numbers.push(...range(start, end));
    previousNumber = end;
  }

  return numbers;
}

function getFullNumber(previousNumber, string) {
  if (!previousNumber) return Number(string);

  var suffix = new RegExp(string + '$');
  var n;
  for (n = previousNumber; ; n += 1) {
    if (String(n).match(suffix)) return n;
  }
}

console.log(getFullNumber(1, '5') == 5);
console.log(getFullNumber(7, '5') == 15);
console.log(getFullNumber(104, '02') == 202);
console.log(getFullNumber(undefined, '3') == 3);

// Helpers

function range(from, to) {
  var numbers = [];
  for (var n = from; n <= to; n += 1) {
    numbers.push(n);
  }

  return numbers;
}

function equals(array1, array2) {
  if (array1.length !== array2.length) return false;

  var i;
  for (i = 0; i < array1.length; i += 1) {
    if (array1[i] !== array2[i]) return false;
  }

  return true;
}
