function substringsFrom(string, startIndex) {
  return range(startIndex + 1, string.length).map(function (endIndex) {
    return string.slice(startIndex, endIndex);
  });
}

function substringsAtStart(string) {
  return substringsFrom(string, 0);
}

function substrings(string) {
  return range(0, string.length - 1).reduce(function (arr, i) {
    return arr.concat(substringsFrom(string, i));
  }, []);
}

function range(start, end, step = 1) {
  var range = [];
  var i;
  for (i = start; i <= end; i += step) {
    range.push(i);
  }

  return range;
}

function palindromicSubstrings(string) {
  return substrings(string).filter(isPalindrome);
}

function isPalindrome(string) {
  return string.length > 1 && reverse(string) === string;
}

function reverse(string) {
  return string.split('').reverse().join('');
}

// Examples

console.log(substringsAtStart('abc'));   // ["a", "ab", "abc"]
console.log(substringsAtStart('a'));     // ["a"]
console.log(substringsAtStart('xyzzy')); // ["x", "xy", "xyz", "xyzz", "xyzzy"]
console.log(substringsAtStart(''));      // []

console.log(substrings('abcde'));
// [ "a", "ab", "abc", "abcd", "abcde",
//   "b", "bc", "bcd", "bcde",
//   "c", "cd", "cde",
//   "d", "de",
//   "e" ]

console.log(palindromicSubstrings('abcd'));  // []
console.log(palindromicSubstrings('madam')); // [ "madam", "ada" ]

console.log(palindromicSubstrings('hello-madam-did-madam-goodbye'));
// [ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
//   "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
//   "-madam-", "madam", "ada", "oo" ]

console.log(palindromicSubstrings('knitting cassettes'));
// [ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]
