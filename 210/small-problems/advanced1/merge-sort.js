// Merging two sorted arrays

// If both arrays are non-empty:
//   compare first elements
//   add the smaller one to the result array
// Repeat.
// If one array is empty, concat result with the rest of the other array.

// Recursive solution:

function merge(array1, array2) {
  var merge = function(merged, array1, array2) {
    if (array1.length === 0) return merged.concat(array2);
    if (array2.length === 0) return merged.concat(array1);

    var a1 = array1[0];
    var a2 = array2[0];
    if (a1 < a2) {
      return merge(merged.concat([a1]), array1.slice(1), array2);
    } else {
      return merge(merged.concat([a2]), array1, array2.slice(1));
    }
  }

  return merge([], array1, array2);
}

console.log(merge([1, 5, 9], [2, 6, 8])); // [1, 2, 5, 6, 8, 9]
console.log(merge([1, 1, 3], [2, 2]));    // [1, 1, 2, 2, 3]
console.log(merge([], [1, 4, 5]));        // [1, 4, 5]
console.log(merge([1, 4, 5], []));        // [1, 4, 5]

// Merge sort

function mergeSort(array) {
  if (array.length <= 1) return array;

  var middle = Math.floor(array.length / 2);
  return merge (mergeSort(array.slice(0, middle)),
                mergeSort(array.slice(middle)));
}

console.log(mergeSort([9, 5, 7, 1]));    // [1, 5, 7, 9]
console.log(mergeSort([5, 3]));          // [3, 5]
console.log(mergeSort([6, 2, 7, 1, 4])); // [1, 2, 4, 6, 7]

console.log(mergeSort(['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie']));
// ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]

console.log(mergeSort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]));
// [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

console.log(mergeSort([1])); // [1]
console.log(mergeSort([]));  // []
