// 1

function lastInArray(array) {
  return array[array.length - 1];
}

// 2

function rollCall(firstNames) {
  var i;
  for (i = 0; i < firstNames.length; i++) {
    console.log(firstNames[i] + '!');
  }

  // ES 6
  // for (let firstName of firstNames) {
  //   console.log(firstName + '!');
  // }
}

// 3

function reverse(array) {
  var reversed = [];
  var i;
  for (i = 0; i < array.length; i++) {
    reversed[array.length - 1 - i] = array[i];
  }

  return reversed;
}

// 4

function firstIndexOf(value, array) {
  var index = -1;
  var i;
  for (i = 0; i < array.length; i++) {
    if (array[i] === value) {
      index = i;
      break;
    }
  }

  return index;
}

// 5

function content(array) {
  var string = '';
  var i;
  for (i = 0; i < array.length; i++) {
    string += String(array[i]);
  }

  return string;
}
