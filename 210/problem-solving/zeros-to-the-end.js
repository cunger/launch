// Input: array of arbitrary elements
// Output: array of the same elements, with:
//   - all 0s moved to the end
//   - preserving the order of the other elements

// Examples:

console.log(moveZeros([false, 1, 0, 1, 2, 0, 1, 3, 'a'])); // [false, 1, 1, 2, 1, 3, 'a', 0, 0]
console.log(moveZeros([]));                                // []
console.log(moveZeros([0, 0, 0]));                         // [0, 0, 0]
console.log(moveZeros([true, null]));                      // [true, null]

// Approach:
// First, filter the input array for all elements that are not zero.
// Then, add to that list all 0s that are in the input array.

function moveZeros(array) {
  return array.filter(x => x !== 0).concat(array.filter(x => x === 0));
}
