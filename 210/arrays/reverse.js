function reverse(sequence) {
  if (typeof(sequence) === 'string') {
    return reverseArray(sequence.split('')).join('');
  } else {
    return reverseArray(sequence);
  }
}

function reverseArray(array) {
  var reversed = [];
  var i;
  for (i = array.length - 1; i >= 0; i--) {
    reversed.push(array[i]);
  }

  return reversed;
}

console.log(reverse('Hello'));           // "olleH"
console.log(reverse('a'));               // "a"
console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
console.log(reverse([]));                // []

var array = [1, 2, 3];
console.log(reverse(array));             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]
