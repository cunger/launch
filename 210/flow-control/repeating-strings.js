function repeat(string, times) {
  if (!isPositiveNumber(times)) {
    return undefined;
  }

  var result = ''
  var i;
  for (i = 0; i < times; i++) {
    result += string;
  }

  return result;
}

function isPositiveNumber(value) {
  return Number(value) === value && value >= 0;
}

console.log(repeat('abc', 1));       // "abc"
console.log(repeat('abc', 2));       // "abcabc"
console.log(repeat('abc', -1));      // undefined
console.log(repeat('abc', 0));       // ""
console.log(repeat('abc', 'a'));     // undefined
console.log(repeat('abc', false));   // undefined
console.log(repeat('abc', null));    // undefined
console.log(repeat('abc', '  '));    // undefined
