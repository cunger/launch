// Input: sequence (string or array)
// Output: array with all elements in original order, where consecutive duplicates are all removed but one

// Examples:

console.log(uniqueInOrder('AAAABBBCCDAABBB'));    // ['A', 'B', 'C', 'D', 'A', 'B']
console.log(uniqueInOrder('ABBCcAD'));            // ['A', 'B', 'C', 'c', 'A', 'D']
console.log(uniqueInOrder([1, 2, 2, 3, 3]));      // [1, 2, 3]
console.log(uniqueInOrder([]));                   // []
console.log(uniqueInOrder(''));                   // []
console.log(uniqueInOrder(['a', 'A', 'b', 'b'])); // ['a', 'A', 'b']

// Approach:
// - Turn input into an array, i.e. if it's a string, split it into its chars.
// - Initialize:
//     output array = []
//     previous element
// - For each element in input array:
//     If the same as the previous element, skip it.
//     Otherwise push it to output array and set previous element to this one.
// - Return output array.

function uniqueInOrder(sequence) {
  var inputArray = toArray(sequence);
  var uniques = [];
  var previousElement;

  inputArray.forEach(function (element) {
    if (element !== previousElement) {
      uniques.push(element);
      previousElement = element;
    }
  });

  return uniques;
}

function toArray(sequence) {
  if (Array.isArray(sequence)) return sequence;
  if (typeof(sequence) === 'string') return sequence.split('');
  throw new Error('Invalid input type');
}
