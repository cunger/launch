function slice(array, start, end) {
  start = Math.min(start, array.length);
  end = Math.min(end, array.length);

  var subArray = [];
  var i;
  for (i = start; i < end; i++) {
    subArray.push(array[i]);
  }

  return subArray;
}

function splice(array, start, deleteCount, ...values) {
  start       = Math.min(start, array.length);
  deleteCount = Math.min(deleteCount, array.length - start);

  var deleted = slice(array, start, start + deleteCount);
  var rest    = slice(array, start + deleteCount, array.length);

  array.length = start;
  array.push(...values);
  array.push(...rest);

  return deleted;
}

// Examples

var testArray1 = [1, 2, 3, 4, 5, 6, 7, 8];
var testArray2 = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];

console.log(slice(testArray1, 0, 2));              // [1, 2]
console.log(testArray1);                           // [1, 2, 3, 4, 5, 6, 7, 8]
console.log(slice(testArray2, 1, 3));              // [ 'b', 'c' ]

console.log(splice(testArray1, 2, 5));             // [ 3, 4, 5, 6, 7 ]
console.log(testArray1);                           // [ 1, 2, 8 ]

console.log(slice([1, 2, 3], 1, 2));               // [2]
console.log(slice([1, 2, 3], 2, 0));               // []
console.log(slice([1, 2, 3], 5, 1));               // []
console.log(slice([1, 2, 3], 0, 5));               // [1, 2, 3]

console.log(splice([1, 2, 3], 1, 2));              // [2, 3]
console.log(splice([1, 2, 3], 1, 3));              // [2, 3]
console.log(splice([1, 2, 3], 1, 0));              // []
console.log(splice([1, 2, 3], 0, 1));              // [1]
console.log(splice([1, 2, 3], 1, 0, 'a'));         // []

var arr = [1, 2, 3];
console.log(splice(arr, 1, 1, 'two'));             // [2]
console.log(arr);                                  // [1, "two", 3]

var arr = [1, 2, 3];
console.log(splice(arr, 1, 2, 'two', 'three'));    // [2, 3]
console.log(arr);                                  // [1, "two", "three"]

var arr = [1, 2, 3];
console.log(splice(arr, 1, 0));                    // []
console.log(splice(arr, 1, 0, 'a'));               // []
console.log(arr);                                  // [1, "a", 2, 3]

var arr = [1, 2, 3];
console.log(splice(arr, 0, 0, 'a'));               // []
console.log(arr);                                  // ["a", 1, 2, 3]
