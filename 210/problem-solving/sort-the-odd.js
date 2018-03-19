// Input: (possibly empty) array of numbers
// Output: odd-sorted array of the same numbers
//
// Requirements:
// Even numbers, including zero, must remain their position in the array.
// The odd numbers have to be re-arranged in their positions, such that they're sorted in ascending order.

// Example:

console.log(sortArray([5, 3, 2, 8, 1, 4])); // [1, 3, 2, 8, 5, 4]
console.log(sortArray([]));                 // []
console.log(sortArray([5, 0, 1]));          // [1, 0, 5]
console.log(sortArray([7, 3, 6, 1, 3]));    // [1, 3, 6, 3, 7]

// Approach:
// Build new array.
// First get all even numbers (incl. 0) from the input array
// and fill them into the positions they have in the input array.
// Then get all odd numbers from the input array, sort them,
// and fill them into the remaining positions.

function sortArray(numbers) {
  var byIncreasingOrder = function (x, y) { return x - y; };
  var sorted = [];

  numbers.forEach(function (n, i) {
    if (isEven(n)) sorted[i] = n;
  });

  numbers.filter(isOdd)
         .sort(byIncreasingOrder)
         .forEach(function (n) {
           insertAtFirstEmptyPosition(sorted, n);
         });

  return sorted;
}

function isEven(number) {
  return number % 2 === 0;
}

function isOdd(number) {
  return !isEven(number);
}

function insertAtFirstEmptyPosition(array, element) {
  var index = array.findIndex(x => x === undefined);
  if (index === -1) index = array.length;

  array[index] = element;
}

console.log(isEven(4) === true);
console.log(isEven(3) === false);
console.log(isEven(0) === true);


// Condensed version (from Codewars):
//
// function sortArray(array) {
//   const odd = array.filter(isOdd).sort(byIncreasingOrder);
//   return array.map(x => isOdd(x) ? odd.shift() : x);
// }
