
function push(array, ...values) {
  values.forEach(function (value) {
    array[array.length] = value;
  });
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

// Unshifting arbitarily many values:

function unshift(array, ...values) {
  values.forEach(function (value) {
    array.splice(0, 0, value)
  });
  // or shorter (Nick Johnson):
  // arr.splice(0, 0, ...values);

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
