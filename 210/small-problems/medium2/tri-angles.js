// Classify triangles based on their three angles:
// - right if one angle === 90
// - obtuse if one angle > 90
// - acute otherwise, i.e. if all angles < 90
//
// A triangle is valid if both
// - every angle is > 0, and
// - the sum of the angles is 180.

console.log(triangle(60, 70, 50) === 'acute');
console.log(triangle(30, 90, 60) === 'right');
console.log(triangle(120, 50, 10) === 'obtuse');
console.log(triangle(0, 90, 90) === 'invalid');
console.log(triangle(50, 50, 50) === 'invalid');

function triangle(a, b, c) {
  function isValid(a, b, c) {
    return (a > 0 && b > 0 && c > 0 && a + b + c === 180);
  }

  if (!isValid(a, b, c)) return 'invalid';
  if ([a, b, c].some(angle => angle === 90)) return 'right';
  if ([a, b, c].some(angle => angle > 90)) return 'obtuse';
  return 'acute';
}
