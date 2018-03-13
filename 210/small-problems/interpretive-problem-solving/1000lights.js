// Input: integer n
// Given: n switches
// Rules:
// n number of passes, repeatedly toggling all switches in positions that are a multiple of n
// Output: array of those switches that are turned on (numbers in 1..n)

// Approach:
// switches = array of booleans of length n, initially all elements `false`
// for i = 1 to n: map, swapping (=negating) each position that is a multiple of n
// return: reduced array, containing all positions (+1) that are `true`

function lightsOn(n) {
  var switches = Array(n).fill(false);
  var i;
  for (i = 1; i <= n; i += 1) {
    switches = switches.map(function (s, index) {
      return isMultipleOf(index + 1, i) ? !s : s;
    });
  }

  var turnedOn = [];
  switches.forEach(function (s, index) {
    if (s) turnedOn.push(index + 1);
  });

  return turnedOn;
}

function isMultipleOf(x, y) {
  return x % y === 0;
}

console.log(lightsOn(0));   // []
console.log(lightsOn(1));   // [1]
console.log(lightsOn(5));   // [1, 4]
console.log(lightsOn(100)); // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
