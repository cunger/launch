// Given an integer n, compute the difference between
// - square of the sum of 1..n
// - sum of the squares of 1..n

// Input: integer
// Output: integer

console.log(sumSquareDifference(3) === 22); // (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
console.log(sumSquareDifference(10) === 2640);
console.log(sumSquareDifference(1) === 0);
console.log(sumSquareDifference(100) === 25164150);

function sumSquareDifference(n) {
  var ints = range(1, n);
  var squareOfSum  = ints.reduce((sum, i) => sum + i, 0)**2;
  var sumOfSquares = ints.map(i => i**2).reduce((sum, i) => sum + i, 0);

  return squareOfSum - sumOfSquares;
}

function range(from, to) {
  var numbers = [];
  for (var n = from; n <= to; n += 1) {
    numbers.push(n);
  }

  return numbers;
}

// console.log(range(1, 10));
// console.log(range(0, 0));
