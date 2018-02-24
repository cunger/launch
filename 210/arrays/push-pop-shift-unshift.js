
function push(array, value) {
  array[array.length] = value;
  return array.length;
}

function pop(array) {
  var i = array.length - 1;
  var last = array[i];
  array.length = i;
  return last;
}

function unshift(array, value) {
  // moving each element one to the right
  // (starting at the end)
  var i;
  for (i = array.length - 1; i >= 0; i--) {
    array[i + 1] = array[i];
  }
  // inserting the value at the first position
  array[0] = value;

  return array.length;
}

function shift(array) {
  var first = array[0];
  var i;
  for (i = 0; i < array.length; i++) {
    array[i] = array[i + 1];
  }
  array.length -= 1;
  return first;
}

var count = [1, 2, 3];
console.log(shift(count));
console.log(count);
