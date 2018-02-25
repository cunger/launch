// 1

function oddElementsOf(arr) {
  var odds = [];
  var i;
  for (i = 1; i < arr.length; i += 2) {
    odds.push(arr[i]);
  }

  return odds;
}

var digits = [4, 8, 15, 16, 23, 42];

console.log(oddElementsOf(digits)); // [8, 16, 42]

// 2

function combinedArray(even, odd) {
  var combined = [];
  var i;
  var j;

  i = 0;
  for (j = 0; j < even.length; j++) {
    combined[i] = even[j];
    i += 2;
  }

  i = 1;
  for (j = 1; j < odd.length; j++) {
    combined[i] = odd[j];
    i += 2;
  }

  // or, shorter:
  // for (i = 0; i < even.length; i++) {
  //   combined.push(even[i]);
  //   combined.push(odd[i]);
  // }

  return combined;
}

var digits = [4, 8, 15, 16, 23, 42];
var letters = ['A', 'L', 'V', 'A', 'R', 'H'];

console.log(combinedArray(digits, letters)); // [4, "A", 8, "L", 15, "V", 16, "A", 23, "R", 42, "H"]

// 3

function backAndForth(array) {
  return array.concat(array.slice().reverse());
}

console.log(backAndForth(digits)); // [4, 8, 15, 16, 23, 42, 42, 23, 16, 15, 8, 4]

// 4

function sortDescending(arr) {
  return arr.slice().sort(function (x, y) { return y - x });
}

var array = [23, 4, 16, 42, 8, 15];
var result = sortDescending(array);
console.log(result);                 // [42, 23, 16, 15, 8, 4]
console.log(array);                  // [23, 4, 16, 42, 8, 15]

// 5

function matrixSums(arrays) {
  return arrays.map(function (array) {
    return array.reduce(function (x, y) {
      return x + y;
    });
  });
}

console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]]));  // returns [15, 60, 12]

// 6

function uniqueElements(arr) {
  var unique = []
  arr.forEach(function (a) {
    if (!unique.includes(a)) {
      unique.push(a);
    }
  });

  return unique;
}

console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]));  // returns [1, 2, 4, 3, 5]
