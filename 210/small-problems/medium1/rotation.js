//// Rotate the first element of an array ////

function rotateArray(array) {
  if (!Array.isArray(array)) return;
  if (array.length === 0) return [];

  return array.slice(1).concat(array[0]);
}

console.log('Testing Rotation Part 1...');

console.log(rotateArray([7, 3, 5, 2, 9, 1]));       // [3, 5, 2, 9, 1, 7]
console.log(rotateArray(['a', 'b', 'c']));          // ["b", "c", "a"]
console.log(rotateArray(['a']));                    // ["a"]
console.log(rotateArray([1, 'a', 3, 'c']));         // ["a", 3, "c", 1]
console.log(rotateArray([{ a: 2 }, [1, 2], 3]));    // [[1, 2], 3, { a: 2 }]
console.log(rotateArray([]));                       // []

console.log(rotateArray());                         // undefined
console.log(rotateArray(1));                        // undefined

// the input array is not mutated
var array = [1, 2, 3, 4];
console.log(rotateArray(array));                    // [2, 3, 4, 1]
console.log(array);                                 // [1, 2, 3, 4]

//// Rotate the last n digits of a number ////

function rotateRightmostDigits(number, n) {
  var string = String(number);
  if (n < 1 || n > string.length) return number;

  var cutoff = string.length - n;
  var prefix = string.slice(0, cutoff); // leave as it is
  var suffix = string.slice(cutoff);    // rotate

  return Number(prefix + rotate(suffix));
}

function rotate(string) {
  return string.slice(1) + string[0];
}

console.log('Testing Rotation Part 2...');

console.log(rotateRightmostDigits(735291, 1) === 735291);
console.log(rotateRightmostDigits(735291, 2) === 735219);
console.log(rotateRightmostDigits(735291, 3) === 735912);
console.log(rotateRightmostDigits(735291, 4) === 732915);
console.log(rotateRightmostDigits(735291, 5) === 752913);
console.log(rotateRightmostDigits(735291, 6) === 352917);

//// Maximum rotation of a number ////

function maxRotation(number) {
  for (var i = String(number).length; i > 1; i -= 1) {
    number = rotateRightmostDigits(number, i);
  }

  return number;
}

console.log('Testing Rotation Part 3...');

console.log(maxRotation(735291) === 321579);
console.log(maxRotation(3) === 3);
console.log(maxRotation(35) === 53);
console.log(maxRotation(105) === 15); // the leading zero gets dropped
console.log(maxRotation(8703529146) === 7321609845);
