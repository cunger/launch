function isAllUnique(string) {
  var seenChars = {};

  return string.split('').every(function (char) {
    if (seenChars[char]) {
      return false;
    } else {
      seenChars[char] = true;
      return true;
    }
  });
}

console.log(isAllUnique('The quick brown fox jumped over a lazy dog') === false);
console.log(isAllUnique('123,456,789') === false);
console.log(isAllUnique('The big apple') === false);
console.log(isAllUnique('The big apPlE') === false);
console.log(isAllUnique('!@#$%^&*()') === true);
console.log(isAllUnique('abcdefghijklmnopqrstuvwxyz') === true);
