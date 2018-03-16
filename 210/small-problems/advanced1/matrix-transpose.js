// Transpose a matrix (m x n array):
// Build new array,
// adding each row of the input array as column in the output array.

function transpose(matrix) {
  if (matrix.length === 0) return [];

  var transposed = [];
  var rows = matrix.length;
  var columns = matrix[0].length;
  var c;
  var r;

  for (c = 0; c < columns; c++) {
    transposed.push([]);
  }

  for (c = 0; c < columns; c++) {
    for (r = 0; r < rows; r++) {
      transposed[c][r] = matrix[r][c];
    }
  }

  return transposed;
}

// Example:

var matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
];

var newMatrix1 = transpose(matrix1);

console.log(newMatrix1); // [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
console.log(matrix1);    // [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

var matrix2 = [
  [1, 5],
  [4, 7],
  [3, 9]
];

console.log(transpose(matrix2)); // [[1, 4, 3], [5, 7, 9]]

console.log(transpose([[1, 2, 3, 4]]));       // [[1], [2], [3], [4]]
console.log(transpose([[1], [2], [3], [4]])); // [[1, 2, 3, 4]]
console.log(transpose([[1]]));                // [[1]]

console.log(transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]));
// [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]

console.log(transpose([[1, 2], [3, 4], [5, 6], [7, 8]]));
