function charWiseEquals(string1, string2, i1, i2) {
  while (i1 < string1.length && i2 < string2.length) {
    if (string1[i1] !== string2[i2]) {
      return false;
    }
    i1++;
    i2++;
  }
  return true;
}

function indexOf(string, substring) {
  var i;
  for (i = 0; i <= string.length - substring.length; i++) {
    if (charWiseEquals(string, substring, i, 0)) {
      return i;
    }
  }
  return -1;
}

function lastIndexOf(string, substring) {
  var i;
  for (i = string.length - substring.length; i >= 0; i--) {
    if (charWiseEquals(string, substring, i, 0)) {
      return i;
    }
  }
  return -1;
}

console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1
