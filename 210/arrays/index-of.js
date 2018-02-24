function indexOf(array, value) {
  var i;
  for (i = 0; i < array.length; i++) {
    if (array[i] === value) {
      return i;
    }
  }
  return -1;
}

function lastIndexOf(array, value) {
  var i;
  for (i = array.length - 1; i>= 0; i--) {
    if (array[i] === value) {
      return i;
    }
  }
  return -1;
}

// Tests

console.log(indexOf([1, 2, 3, 3], 3) == 2);
console.log(indexOf([1, 2, 3], 4) === -1);

console.log(lastIndexOf([1, 2, 3, 3], 3) === 3);
console.log(lastIndexOf([1, 2, 3], 4) === -1); 
