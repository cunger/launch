// Input: positive integer
// Output: next bigger integer with the same digits, or -1 if there is none

console.log(nextBigger(12) === 21);
console.log(nextBigger(513) === 531);
console.log(nextBigger(2017) === 2071);

console.log(nextBigger(9) === -1);
console.log(nextBigger(111) === -1);
console.log(nextBigger(531) === -1);

console.log(nextBigger(123456789));


// Approach:
// - treat integer as array of chars
// - get all permutations of this array, and sort
// - map them to numbers again
// - return the next one after the input, or -1 if there is none:
//   get index of input; if this index + 1 equals perm-array.length, return -1

// Example: 513
// => ['5', '1', '3']
// => ['5', '1', '3'], ['5', '3', '1'], ['1', '3', '5'], ['1', '5', '3'], ['3', '1', '5'], ['3', '5', '1']
// => 513, 531, 135, 153, 315, 351
// => 135, 153, 315, 351, 513, 531
// => 531

function nextBigger(number) {
  var digits   = String(number).split('');
  var anagrams = permutations(digits)
                 .map(a => Number(a.join('')))
                 .filter(n => n > number)
                 .sort((x, y) => x - y);

  if (anagrams.length === 0) return -1;
  return anagrams[0];
}

function permutations(chars) {
  var arrays = [[]];
  var newArrays;
  var i;

  chars.forEach(function (char) {
    newArrays = [];
    arrays.forEach(function (array) {
      for (i = 0; i < chars.length; i++) {
        if (array[i] === undefined) {
          var newArray = array.slice();
          newArray[i] = char;
          newArrays.push(newArray);
          }
        }
      }
    });
    arrays = newArrays;
  });

  return arrays;
}
