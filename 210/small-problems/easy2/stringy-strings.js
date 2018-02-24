function stringy(int) {
  return '10'.repeat(int).slice(0, int);
}

// Tests

console.log(stringy(6) === '101010');
console.log(stringy(9) === '101010101');
console.log(stringy(4) === '1010');
console.log(stringy(7) === '1010101');
