// A console.log(featured number is an integer with the following properties:
// - odd
// - a multiple of 7
// - each digit occurs exactly once
//   (i.e. from length 11 on, no number can be console.log(featured anymore)

// Input: integer
// Output: next highest featured integer, or an error if there is none

// Brute force:
// Starting from the next odd multiple of 7, check each odd multiple of 7
// whether it's featured and return the first one you find.
// If the length is greater than 10, stop and return an error.

// Tests

console.log(featured(12) === 21);
console.log(featured(20) === 21);
console.log(featured(21) === 35);
console.log(featured(997) === 1029);
console.log(featured(1029) === 1043);
console.log(featured(999999) === 1023547);
console.log(featured(999999987) === 1023456987);

function featured(number) {
  function isFeatured(n) {
    if (n % 2 === 0) return false;
    if (String(n).match(/(\d).*\1/)) return false;
    return true;
  }

  var nextMultiple = number + (7 - (number % 7));
  if (nextMultiple % 2 === 0) nextMultiple += 7;
  var n;
  for (n = nextMultiple; String(n).length < 11; n += 14) {
    if (isFeatured(n)) return n;
  }

  return new Error('There is no next featured number.');
}
