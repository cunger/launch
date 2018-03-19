// Input: array of numbers
// Output: first index at which the sum of the subarray to the left
//         equals the sum of the subarray to the right of the index
//         (empty subarray has a sum of 0)
//         -1 if there is no such index

// Examples:

console.log(findEvenIndex([1, 2, 3, 4, 3, 2, 1]) === 3);
console.log(findEvenIndex([1, 100, 50, -51, 1, 1]) === 1);
console.log(findEvenIndex([1, 2, 3, 4, 5, 6]) === -1);
console.log(findEvenIndex([20, 10, 30, 10, 10, 15, 35]) === 3);
console.log(findEvenIndex([1, 0]) === 0);
console.log(findEvenIndex([1]) === 0);

// Approach:
// for each position in the array:
//   if sum of left slice equals sum of right slice, return index
// return -1

function findEvenIndex(array) {
  return array.findIndex(function (_, index) {
    return sum(array.slice(0, index)) === sum(array.slice(index + 1));
  });
}

function sum(array) {
  return array.reduce((s, a) => s + a, 0);
}
