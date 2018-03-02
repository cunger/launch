function swap(text) {
  return text.split(' ')
             .map(swapFirstAndLastLetter)
             .join(' ');
}

function swapFirstAndLastLetter(string) {
  if (string.length < 2) return string;

  return string[string.length - 1] + string.slice(1, -1) + string[0];
}

// Tests

console.log(swapFirstAndLastLetter('Oh') === 'hO');
console.log(swapFirstAndLastLetter('what') === 'thaw');
console.log(swapFirstAndLastLetter('a') === 'a');

console.log(swap('Oh what a wonderful day it is') === 'hO thaw a londerfuw yad ti si');
console.log(swap('Abcde') === 'ebcdA');
console.log(swap('a') === 'a');
