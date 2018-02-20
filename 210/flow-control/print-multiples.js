// Log all multiples of `number` that
// * are between 1 and 100 (inclusive)
// * are odd
// in decreasing order.

// 1. Determine the maximum multiple within the range.
// 2. From that max down to 1:
//    if multiple is odd, log number * multiple

function logOddMultiples(number) {
  function isOdd(x) {
    return x % 2 !== 0;
  }

  var factor;
  for (factor = Math.floor(100 / number); factor >= 1; factor--) {
      var multiple = factor * number;
      if (isOdd(multiple)) {
        console.log(multiple);
      }
  }
}

// Examples

logOddMultiples(17);
console.log('');
logOddMultiples(21);
