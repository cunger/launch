// Classify a triangles based on the length of its three sides:
//
// - equiliteral if all sides are equal
// - isosceles if two sides are equal
// - scalene if all three sides are different
//
// A triangle is invalid if either:
// - any side is <= 0
// - sum of the two shortest sides <= longest side

console.log(triangle(3, 3, 3) === 'equilateral');
console.log(triangle(3, 3, 1.5) === 'isosceles');
console.log(triangle(3, 4, 5) === 'scalene');
console.log(triangle(0, 3, 3) === 'invalid');
console.log(triangle(3, 1, 1) === 'invalid');
console.log(triangle(5, 1, 2) === 'invalid');
console.log(triangle(3, 3, 0) === 'invalid');
console.log(triangle(0, 0, 0) === 'invalid');

function triangle(x, y, z) {
  function isValid(x, y, z) {
    // All sides have to be greater than 0.
    if (x <= 0 || y <= 0 || z <= 0) return false;

    // The sum of two shortest sides has to be greater than the longest side.
    var sorted = [x, y, z].sort(function (a, b) { return a - b; });
    if (sorted[0] + sorted[1] <= sorted[2]) return false;

    return true;
  }

  if (!isValid(x, y, z))  return 'invalid';
  if (x === y && y === z) return 'equilateral';
  if (x === y || y === z) return 'isosceles';
  return 'scalene';
}
