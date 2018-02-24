function slice(array, start, end) {
  var subArray = [];
  var i;
  for (i = start; i < end; i++) {
    subArray.push(array[i]);
  }

  return subArray;
}

function splice(array, start, length) {
  var subArray = slice(array, start, start + length);

  var rest = slice(array, start + length, array.length);
  array.length = start;
  var i;
  for (i = 0; i < rest.length; i++) {
    array.push(rest[i]);
  }

  return subArray;
}

function concat(array1, array2) {
  var array = [];

  array.push(...array1);
  array.push(...array2);

  return array;
}

function join(array, separator) {
  var string = '';
  var i;

  for (i = 0; i < array.length; i++) {
    string += String(array[i]);
    if (i < array.length - 1) {
      string += separator;
    }
  }

  return string;
}


var testArray1 = [1, 2, 3, 4, 5, 6, 7, 8];
var testArray2 = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];

console.log(slice(testArray1, 0, 2)); // [1, 2]
console.log(testArray1);              // [1, 2, 3, 4, 5, 6, 7, 8]
console.log(slice(testArray2, 1, 3)); // [ 'b', 'c' ]

console.log(splice(testArray1, 2, 5)); // [ 3, 4, 5, 6, 7 ]
console.log(testArray1);               // [ 1, 2, 8 ]

console.log(concat([1, 2, 3], [4, 5, 6])); // [ 1, 2, 3, 4, 5, 6 ]

console.log(join(['bri', 'tru', 'wha'], 'ck ')); // 'brick truck wha'
console.log(join([1, 2, 3], ' and '));           // '1 and 2 and 3'
