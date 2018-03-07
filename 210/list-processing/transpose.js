function transpose(matrix) {
  return matrix[0].map(function (_, i) {
    return matrix.map(function (row) {
      return row[i];
    });
  });
}

// Example

var matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
];

console.log(transpose(matrix));

// [
//   [1, 4, 7],
//   [2, 5, 8],
//   [3, 6, 9],
// ];
